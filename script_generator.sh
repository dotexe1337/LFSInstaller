#!/bin/bash

PARTITION=$1
SWAP_PARTITION=$2
DISTRIB_CODENAME=$3
VERSION_CODENAME=$4
INSTALL_TYPE=$5
VERSION=$6
SWAP=$7

echo "Partition: $PARTITION"
echo "Swap Partition: $SWAP_PARTITION"
echo "Distribution Codename: $DISTRIB_CODENAME"
echo "Version Codename: $VERSION_CODENAME"
echo "Install Type: $INSTALL_TYPE"
echo "Version: $VERSION"
echo "Swap: $SWAP"
echo ""

echo "Initializing the script generation..."

if [[ "$VERSION" == "12.2" ]]; then
	tar -xf $(pwd)/releases/$VERSION/LFS-$VERSION-SYSV.tar.xz
else
	tar -xf $(pwd)/releases/$VERSION/LFS-BOOK-$VERSION.tar.xz
fi

# Check which major version the LFS Release Build version is using
MAJOR_VERSION=$(echo "$VERSION" | cut -d '.' -f 1)
if [[ "$MAJOR_VERSION" == "9" ]]; then
	xmllint --html --xpath '//li[@class="sect1"]/a/text()' $(pwd)/$VERSION/chapter06/chapter06.html 2>/dev/null > list.txt
else
	xmllint --html --xpath '//li[@class="sect1"]/a/text()' $(pwd)/$VERSION/chapter08/chapter08.html 2>/dev/null > list.txt
fi

# Remove the following words from such list.
sed -i '/\<Introduction\>\|\<Package Management\>\|\<About Debugging Symbols\>\|\<Stripping\>\|\<Cleaning Up\>/d' list.txt

mapfile -t system_packages < list.txt
system_packages+=("Quit")
rm -r list.txt

display_menu() {
	echo "Please select basic system software packages you want to download, compile and install: "	
	for i in "${!system_packages[@]}"; do
		echo "$i) ${system_packages[$i]}"
	done
	echo -n "Enter the number corresponding to your choice: "
}

selected_softwares=()
while true; do
	display_menu
	read -r choice
	
	# Validate the user input
	if [[ "$choice" =~ ^[0-9]+$ ]] && (( choice >= 0 && choice < ${#system_packages[@]} )); then
		# Check if user wants to quit.
		if [[ "${system_packages[$choice]}" == "Quit" ]]; then
			echo "Quitting system package selection. Exiting..."
			break
		fi

		# Add the selected optiont to the array of selected options
		selected_softwares+=("${system_packages[$choice]}")
		echo "Selected System Software: "
	else 
		echo "Invalid choice, please try again."
	fi
done

echo "You have selected the following system software packages for downloading, compiling and installing: "
for opt in "${selected_softwares[@]}"; do
	echo "- $opt"
done



# Extract Software Package From Page
closest_match=""
max_match_length=0
DIRECTORY=""

if [[ "$MAJOR_VERSION" == "9" ]]; then
	DIRECTORY="$(pwd)/$VERSION/chapter06/"
else
	DIRECTORY="$(pwd)/$VERSION/chapter08/"
fi

for file in "$DIRECTORY"*.html; do
	if [[ -f "$file" ]]; then
		# Get the base name without the extension
		base_name=$(basename "$file" .html)

		# Reset variables for the next iteration
		closest_match=""
		max_match_length=0

		for opt in "${selected_softwares[@]}"; do
			# Convert both base name and option to lowercase for case-insensitive comparison
			base_name_lower=$(echo "$base_name" | tr '[:upper:]' '[:lower:]')
			opt_lower=$(echo "$opt" | tr '[:upper:]' '[:lower:]')

			if [[ "$opt_lower" == *"$base_name_lower"* ]]; then
				# Calculate the length of the matching part
				match_length=${#base_name_lower}

				# If the current match is longer (i.e., closer) than the previous best match
				if [[ $match_length -gt $max_match_length ]]; then
					closest_match="$opt"
					max_match_length=$match_length
				fi
			fi
		done

		# Output the closest match if found
		if [[ -n "$closest_match" ]]; then
		    	echo "Performing actions for $closest_match and file $file"
		fi
	fi
done

echo "Selected softwares: ${selected_softwares[@]}"

# Single or Phases
if [[ "$INSTALL_TYPE" == "SINGLE" ]]; then
	./single_install_extract_html.sh "$VERSION" "$MAJOR_VERSION" "$DIRECTORY" "${selected_softwares[@]}"
else 
	./phases_install_extract_html.sh "$VERSION" "$MAJOR_VERSION" "$DIRECTORY" "${selected_softwares[@]}"
fi
# --------------------------------------------------------------------------------------------------------

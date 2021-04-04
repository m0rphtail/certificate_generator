#!/bin/bash

echo -n "Enter SVG filename: "
read input_file
mkdir -p tmp
mkdir -p certificates
cat $input_file > tmp/'tmp_'$input_file.txt
echo -n "Enter Placeholder text: "
read placeholder_text

# names=$(cat names.txt)
# for name in $names
# do
#     echo "Generating certificate for $name ..."
#     cp tmp/'tmp_'$input_file'.txt' tmp/'tmp_'$input_file'_'$name.txt
# done

while IFS='' read -r name || [[ -n "$name" ]]; do
    echo "Generating certificate for $name ..."
    formated_name=${name// /_}
    echo $formated_name
    main_svg_text=tmp/'tmp_'$input_file'.txt'
    named_svg_text=tmp/'tmp_'$input_file'_'"$formated_name".txt
    echo $main_svg_text
    echo $named_svg_text
    #cp tmp/'tmp_'$input_file'.txt' tmp/'tmp_'$input_file'_'"$name".txt
    var_for_sed="s/\b"$placeholder_text"\b/"$formated_name"/gI"
    echo $var_for_sed
    #sed -i $var_for_sed tmp/'tmp_'$input_file'_'"$name".txt
    #Inkscape --export-area-page --export-filename=certificates/$name.png tmp/'tmp_'$input_file'_'"$name".txt
done < names.txt

#rm -rf tmp

   # cp tmp/'tmp_'$input_file'.txt' tmp/'tmp_'$input_file'_'$name.txt
#Inkscape --export-area-page --export-filename=$output_file $input_file
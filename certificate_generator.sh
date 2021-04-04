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
    name_for_sed=${name// /\\ }
    formated_placeholder=${placeholder_text// /\\ }
    main_svg_text=tmp/'tmp_'$input_file'.txt'
    named_svg_text=tmp/'tmp_'$input_file'_'"$formated_name".txt
    named_svg=tmp/'tmp_'$input_file'_'"$formated_name".svg
    cp $main_svg_text $named_svg_text
    sed -i "s/$formated_placeholder/$name_for_sed/g" $named_svg_text
    mv $named_svg_text $named_svg
    inkscape --export-area-page --export-filename=certificates/$formated_name.png $named_svg
done < names.txt

rm -rf tmp

   # cp tmp/'tmp_'$input_file'.txt' tmp/'tmp_'$input_file'_'$name.txt
#Inkscape --export-area-page --export-filename=$output_file $input_file
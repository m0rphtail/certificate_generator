#!/bin/bash

if [ $(which inkscape) = '/usr/bin/inkscape' ]; then

    echo -n "Enter SVG filename: "
    read input_file
    mkdir -p tmp
    mkdir -p certificates
    cat $input_file > tmp/'tmp_'$input_file.txt
    echo -n "Enter Placeholder text: "
    read placeholder_text
    echo \\n

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
        inkscape --export-area-page --export-filename=certificates/$formated_name.png $named_svg >/dev/null 2>&1
    done < names.txt

    rm -rf tmp
    echo done

else
    echo "Inkscape not installed"
fi
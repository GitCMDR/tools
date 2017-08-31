#!/usr/bin/env bash

echo "Starting Script"

exts=$(ls | sed 's/^.*\.//' | sort -u)  # grabbing all extension files in dir.
delete=(sh) # creating array to delete "sh" element from 'exts' array
exts=( "${exts[@]/$delete}" ) # delete sh extension from exts

for ext in $exts # looping through each extension found
do
    echo Found $ext fileformat. # verbose explaining extensions found
done

for ext in $exts
do
    echo Processing $ext
    mkdir -pv $ext  # make directory with extension name if one is not created
    mv -v *.$ext $ext/ # move file to respective directory
done

unset exts delete # clear variables created on script
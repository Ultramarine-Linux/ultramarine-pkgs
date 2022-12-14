#!/bin/bash

echo :: ensurepip
python -m ensurepip
echo :: python modules
python -m pip install -r requirements.txt

search() {
    for folder in $1/*; do
        if [ -f "$folder/chkupdate.py" ]; then
            echo :: $folder
            (cd $folder && python chkupdate.py)
            continue
        fi
        x=0
        for thing in $folder/*; do
            [[ -f $thing ]] && x=1 && break
        done
        [[ $x -eq 1 ]] && search $folder
    done
}

search ultramarine

exit 0
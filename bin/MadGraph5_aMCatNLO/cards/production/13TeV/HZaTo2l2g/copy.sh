#!/bin/bash

default=$(basename $(pwd))
#m=$1
for m in {2..35}
do
    echo Copying mass M$m
    newdir=../"$default"_M"$m"
    mkdir $newdir
    cp "$default"_customizecards.dat $newdir/"$default"_M"$m"_customizecards.dat
    cp "$default"_extramodels.dat $newdir/"$default"_M"$m"_extramodels.dat
    cp "$default"_proc_card.dat $newdir/"$default"_M"$m"_proc_card.dat
    cp "$default"_run_card.dat $newdir/"$default"_M"$m"_run_card.dat
    # modify output name
    sed -i 's/'$default'/'$default'_M'$m'/g' $newdir/"$default"_M"$m"_proc_card.dat
    # Modify mass parameter
    sed -i 's/AMASS/'$m'.0/g' $newdir/"$default"_M"$m"_customizecards.dat
done

#!/bin/bash -

N_LEVELS=3
BRANCHING=30
N_FILES=0

echo "Creating $(($BRANCHING**$N_LEVELS)) folders in $N_LEVELS levels"
echo "Creating $(($BRANCHING**$N_LEVELS*$N_FILES)) files ($N_FILES in each level)"

do_depth() {
    local prefix=$1
    local n_remaining=$2
    # echo $prefix $n_remaining
    for i in `seq 0 $BRANCHING`;
    do
        local folder="$prefix/folder-$i"
        # echo making $folder
        mkdir -p $folder
        
        if [[ $n_remaining -gt 0 ]]; then
            do_depth $folder $((n_remaining-1))
        else
            for j in `seq 0 $N_FILES`;
            do
                touch $folder/file-$j.js
            done
        fi
    done
}

do_depth 'src' $((N_LEVELS-1))
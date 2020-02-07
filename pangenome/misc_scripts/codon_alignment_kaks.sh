#!/bin/bash
#FA=hemC.fa

runprank(){
FA=$1
PFX=$(echo $FA | cut -d '.' -f1)
prank -d=$FA -o=$PFX -translate -F
}
export -f runprank

parallel runprank ::: *fa

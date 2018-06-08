#!/bin/sh
x=0
mkdir webfiles
cd webfiles
while [ $x -lt 100 ]
do
   mkdir "a$x"
   cd "a$x" 
   wget https://www.dropbox.com/s/ugp9mvbftxgc1e8/BetterBenefits.mp4?dl=0
   wget http://releases.ubuntu.com/16.04/ubuntu-16.04.4-server-amd64.iso
   cd ..
   x=`expr $x + 1`
done


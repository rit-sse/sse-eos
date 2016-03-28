#!/bin/bash

while read change;
do
  rsync -a ./ timbrook@sseprod.se.rit.edu:/home/timbrook/scripts
  echo "Updated files";
done< <(fswatch ./);


#!/bin/bash

rm -r bookdown
cp -r . ../bookdown && mv ../bookdown .

cp -r bookdown/.gitbook/assets bookdown 
mv bookdown/assets bookdown/images

cp -t bookdown .bookdown/{as_bookdown.R,index.Rmd,_bookdown.yml}

R --slave -e "setwd('bookdown'); source('as_bookdown.R')"
R --slave -e "setwd('bookdown'); bookdown::render_book('index.Rmd', 'bookdown::gitbook')"

cp -r bookdown/.bookdown/libs/* bookdown/output/libs


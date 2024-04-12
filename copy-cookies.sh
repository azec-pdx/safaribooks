#!/bin/bash

cp ~/Downloads/cookies.txt cookies.json && string=`cat cookies.json` && prefix='cookies = ' && cookies=${string#"$prefix"} && echo $cookies > cookies.json
rm ~/Downloads/cookies.txt

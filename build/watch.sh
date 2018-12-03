#!/bin/bash
filename = ls output/ | grep app
echo "filename"
chokidar 'src/elm/**/*.elm' -c 'if [ "{event}" = "change" ]; then npm run build-elm; fi;'

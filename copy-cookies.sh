#!/bin/bash

# STEPS
# 1. Install ExportThisCookie for Chrome: https://chromewebstore.google.com/detail/editthiscookie/fngmhnnpilhplaeedifhccceomclgfbg?hl=en&pli=1
# 2. Navigate to OReilly Profile page: https://learning.oreilly.com/profile/
# 3. Click on ExportThisCookie plugin icon in Chrome. Click on "Export". This will save "cookies.txt" to ~/Downloads directory
# 4. Run this script from project root: ./copy-cookies.sh
# 5. You now have "cookies.json" in the project root in the format expected by downloader to be able to authenticate


cp ~/Downloads/cookies.txt cookies.json && string=`cat cookies.json` && prefix='cookies = ' && cookies=${string#"$prefix"} && echo $cookies > cookies.json
rm ~/Downloads/cookies.txt

#!/bin/bash

# Open local url from CLI:
# https://productforums.google.com/forum/#!msg/chrome/5Olx61uw26Q/qMj0jYkkBQAJ

# auto "click" submit:
# https://stackoverflow.com/questions/5211328/clicking-submit-button-of-an-html-form-by-a-javascript-code

# incognito from CLI:
# https://askubuntu.com/questions/688295/launching-chrome-incognito-mode-from-terminal

# Auto submit idea, not used
# https://crunchify.com/automatic-html-login-using-post-method-autologin-a-website-on-double-click/

# app mode:
# chromium-browser --help

# Initial code analysis (form names etc.):
# https://email.nhs.net/

# TODO: more flags:
# https://webcache.googleusercontent.com/search?q=cache:Q0vRfPTxLbsJ:https://peter.sh/experiments/chromium-command-line-switches/+&cd=1&hl=en&ct=clnk&gl=uk
# https://peter.sh/experiments/chromium-command-line-switches/

# Find location of script:
# https://stackoverflow.com/questions/59895/get-the-source-directory-of-a-bash-script-from-within-the-script-itself
WD="$(dirname $(readlink -f $0))"
#echo "file://$WD/nhs.net.autologin.html"
#chromium-browser --incognito --app="file://$WD/nhs.net.autologin.html"

# Use temporary profile:
# https://gist.github.com/riyad/7553003 and
# https://blog.rabin.io/linux/start-chrome-temp-profile-with-preinstalled-extension
TEMP_DIR=$(mktemp -d /tmp/google-chome.XXXXXXX)
chromium-browser --user-data-dir=$TEMP_DIR --no-first-run \
	--disable-sync --disable-first-run-ui --no-default-browser-check \
	--incognito --app="file://$WD/nhs.net.autologin.html" \
	--password-store=basic --start-maximized
rm -rf $TEMP_DIR
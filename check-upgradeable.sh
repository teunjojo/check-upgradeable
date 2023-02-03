#!/bin/bash
version=1.4

lib="libteunjojo"
[ ! -f "$lib.sh" ] && curl -s -o $lib.sh https://files.teunjojo.com/$lib/latest/$lib.sh && chmod +x $lib.sh
source $lib.sh

if ((EUID)); then
   echo "This script must be run as root"
   exit 1
fi

apt-get update &> /dev/null
u=$(echo -n "$(sudo apt-get -V --no-download -s --fix-missing dist-upgrade | grep '^ .*' | cut -d'(' -f1 | tr -d '\n' | tr -s ' ' | sed 's/\([^ )]\) /\1, /g')")
u=${u:1:-1}
[ "$u" ] && pushover "Upgradeable package$([[ "$u" == *", "* ]] && echo s)!" "You can update: ${u%?}"

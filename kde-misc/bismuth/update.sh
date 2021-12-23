#!/usr/bin/env bash

my_ebuild=`ls "$(dirname $BASH_SOURCE)"/bismuth*.ebuild`
my_version="$(basename $my_ebuild | sed 's/bismuth-//g;s/.ebuild//g')"
echo "My version: $my_version"

remote_version=`curl --silent "https://api.github.com/repos/Bismuth-Forge/bismuth/releases/latest" | jq -r '.tag_name' | sed 's/v//g'`
echo "Remote version: $remote_version"

mv $my_ebuild $(dirname $my_ebuild)/bismuth-$remote_version.ebuild || echo "No updates found"
cd "$(dirname $my_ebuild)" && repoman manifest
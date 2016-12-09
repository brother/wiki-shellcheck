#!/bin/sh

# Will hold the path to the Shellcheck wiki clone.
path=UNKNOWN
# Boolean to tell if we should fetch the wiki before reading the files.
update=1
# The needle in the wiki haystack. Aka the SC code.
needle=${1:-}
# Default is verbose off and that only shows the title line of the page.
verbose=${2:-1}

if [ ! "$needle" ]; then
	echo "Nothing to search for. Aborting."
	echo "USAGE: $0 SC2005"
	exit 1
fi

# Find config
if [ -f "$SHELLCHECKWIKIPATH" ]; then
	path=$SHELLCHECKWIKIPATH
	update=${SHELLCHECKWIKIUPDATE:-1}
elif [ -f "$XDG_CONFIG_HOME/shellcheck.wiki.cfg" ]; then
	config="$XDG_CONFIG_HOME/shellcheck.wiki.cfg"
	# FIXME please do this native.
	path=$(awk -F= '/^path/{print $2}' "$config")
	update=$(awk -F= '/^update/{print $2}' "$config")
else
	cat <<-EOF
		Unable to find config file.
		Export SHELLCHECKWIKIPATH or edit the file \$XDG_CONFIG_HOME/shellcheck.wiki.cfg
		See Shellcheck wiki lookup README.md for information.
		Aborting.
	EOF
	exit 1
fi

if [ ! -d "$path" ]; then
	echo "Unable to find Shellcheck wiki path, check configuration. Aborting."
	exit 1
fi

if [ "$update" = always ]; then
	# Use something like
	#   git log --pretty=format:'%ct' -n 1
	# to fetch info on how long since last commit in the tree?
	# Is this the best way to find the git executable?
	if [ -x "$(whereis -b git | awk -F: '{print $1}')" ]; then
		if ! git -C "$path" pull -q; then
			echo "INFO: git pull requested in config but failed."
		fi
	fi
elif [ "$update" = bnackground ]; then
	if [ -x "$(whereis -b git | awk -F: '{print $1}')" ]; then
		git -C "$path" pull -q &
	fi
fi

if [ -f "/home/brother/git/other/shellcheck.wiki/$needle.md" ]; then
	# FIXME this should be converted to clean sh.
	echo "$needle: $(head -1 "/home/brother/git/other/shellcheck.wiki/$needle.md" | sed 's/^#\+ //')"
	export verbose # To silence the shellcheck warning until the feature is implemented.
else
	echo "$needle not found."
fi

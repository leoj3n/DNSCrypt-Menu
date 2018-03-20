#!/bin/bash

# <bitbar.author.github>JayBrown</bitbar.author.github>
# <bitbar.author>Joss Brown</bitbar.author>
# <bitbar.desc>Manage DNSCrypt from the macOS menu bar</bitbar.desc>
# <bitbar.image>https://raw.githubusercontent.com/JayBrown/DNSCrypt-Menu/master/img/screengrab.png</bitbar.image>
# <bitbar.title>DNSCrypt Menu</bitbar.title>
# <bitbar.url>https://github.com/JayBrown/DNSCrypt-Menu</bitbar.url>
# <bitbar.version>1.0.6</bitbar.version>

# DNSCrypt Menu
# version 1.0.6
# Copyright (c) 2018 Joss Brown (pseud.)
# License: MIT+
# derived from: dnscrypt-proxy-switcher by Frank Denis (jedisct1) https://github.com/jedisct1/bitbar-dnscrypt-proxy-switcher

dcmver="1.0.6"
dcmvadd=""

export LANG=en_US.UTF-8
export HISTIGNORE='*sudo -S*'
export PATH=$PATH:/usr/local/bin:/usr/local/sbin:/opt/local/bin:/opt/local/sbin:/sw/bin:/sw/sbin:$HOME/bin:$HOME/sbin

osversion=$(sw_vers -productVersion)
osmajor=$(echo "$osversion" | awk -F. '{print $2}')
[ $osmajor -lt 7 ] && exit 1

theme="classic"
if test -t 0 ; then
	theme="emoji"
fi

if [[ $theme == "classic" ]] ; then
	ERROR_ICON="| dropdown=false templateImage=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c2VkIDE1IDAgUiBdCmVuZG9iagozIDAgb2JqCjw8IC9UeXBlIC9QYWdlcyAvTWVkaWFCb3ggWzAgMCAxNiAxNl0gL0NvdW50IDEgL0tpZHMgWyAyIDAgUiBdID4+CmVuZG9iagoxNyAwIG9iago8PCAvVHlwZSAvQ2F0YWxvZyAvUGFnZXMgMyAwIFIgL1ZlcnNpb24gLzEuNCA+PgplbmRvYmoKMTggMCBvYmoKKE1hYyBPUyBYIDEwLjkuNSBRdWFydHogUERGQ29udGV4dCkKZW5kb2JqCjE5IDAgb2JqCihEOjIwMTYwMzAzMTkwNDI3WjAwJzAwJykKZW5kb2JqCjEgMCBvYmoKPDwgL1Byb2R1Y2VyIDE4IDAgUiAvQ3JlYXRpb25EYXRlIDE5IDAgUiAvTW9kRGF0ZSAxOSAwIFIgPj4KZW5kb2JqCnhyZWYKMCAyMAowMDAwMDAwMDAwIDY1NTM1IGYgCjAwMDAwMDU2NTkgMDAwMDAgbiAKMDAwMDAwMDUwNSAwMDAwMCBuIAowMDAwMDA1NDIwIDAwMDAwIG4gCjAwMDAwMDAwMjIgMDAwMDAgbiAKMDAwMDAwMDQ4NiAwMDAwMCBuIAowMDAwMDAwNjA3IDAwMDAwIG4gCjAwMDAwMDA3MzEgMDAwMDAgbiAKMDAwMDAwMTMwMyAwMDAwMCBuIAowMDAwMDAxMzIyIDAwMDAwIG4gCjAwMDAwMDUzODMgMDAwMDAgbiAKMDAwMDAwMTM5MSAwMDAwMCBuIAowMDAwMDAyNjEwIDAwMDAwIG4gCjAwMDAwMDE0MzkgMDAwMDAgbiAKMDAwMDAwMjU4OSAwMDAwMCBuIAowMDAwMDAyNjQ3IDAwMDAwIG4gCjAwMDAwMDUzNjIgMDAwMDAgbiAKMDAwMDAwNTUwMSAwMDAwMCBuIAowMDAwMDA1NTY1IDAwMDAwIG4gCjAwMDAwMDU2MTcgMDAwMDAgbiAKdHJhaWxlcgo8PCAvU2l6ZSAyMCAvUm9vdCAxNyAwIFIgL0luZm8gMSAwIFIgL0lEIFsgPDY3NGRkZmQ4MGY5ZTc3Yzg4ZDhjNjZhMTJhYTk4NTk0Pgo8Njc0ZGRmZDgwZjllNzdjODhkOGM2NmExMmFhOTg1OTQ+IF0gPj4Kc3RhcnR4cmVmCjU3MzQKJSVFT0YK"
elif [[ $theme == "emoji" ]] ; then
	ERROR_ICON="✖"︎
fi

interface=$(route get 0.0.0.0 2>/dev/null | awk '/interface: / {print $2}')
if ! [[ $interface ]] ; then
	echo "$ERROR_ICON"
	echo "---"
	echo "No Connection Available | color=red"
	echo "---"
	echo "Refresh… | refresh=true"
	exit 0
fi

dcpver=$(dnscrypt-proxy --version 2>/dev/null)
if ! [[ $dcpver ]] ; then
	echo "$ERROR_ICON"
	echo "---"
	echo "dnscrypt-proxy is not in your \$PATH | color=red"
	echo "Please make sure to install DNSCrypt correctly"
	echo "---"
	echo "Refresh… | refresh=true"
	exit 0
fi
dcploc=$(which dnscrypt-proxy 2>/dev/null)

read -d '' ltoml <<"EOF"
/usr/local/etc/dnscrypt-proxy.toml
/opt/local/etc/dnscrypt-proxy.toml
/sw/etc/dnscrypt-proxy.toml
$HOME/etc/dnscrypt-proxy.toml
/private/etc/dnscrypt-proxy.toml
EOF

while read -r TOML
do
	[[ -f $TOML ]] && break
done < <(echo "$ltoml")
if ! [[ $TOML ]] ; then
	echo "$ERROR_ICON"
	echo "---"
	echo "dnscrypt-proxy.toml not available | color=red"
	echo "Please make sure to install DNSCrypt correctly"
	echo "---"
	echo "Refresh… | refresh=true"
	exit 0
fi

process="DNSCrypt Menu"
account=$(id -un)

_notify () {
	if [[ $tn_status == "osa" ]] ; then
			osascript &>/dev/null << EOT
tell application "System Events"
	display notification "$2" with title "$process [" & "$account" & "]" subtitle "$1"
end tell
EOT
	elif [[ $tn_status == "tn-app-new" ]] || [[ $tn_status == "tn-app-old" ]] ; then
		"$tn_loc/Contents/MacOS/terminal-notifier" \
			-title "$process [$account]" \
			-subtitle "$1" \
			-message "$2" \
			-appIcon "$icon_loc" \
			>/dev/null
	elif [[ $tn_status == "tn-cli" ]] ; then
		"$tn" \
			-title "$process [$account]" \
			-subtitle "$1" \
			-message "$2" \
			-appIcon "$icon_loc" \
			>/dev/null
	fi
}

tn=$(which terminal-notifier 2>/dev/null)
if [[ $tn == "" ]] || [[ $tn == *"not found" ]] ; then
	tn_loc=$(mdfind "kMDItemCFBundleIdentifier == 'fr.julienxx.oss.terminal-notifier'" 2>/dev/null | awk 'NR==1')
	if [[ $tn_loc == "" ]] ; then
		tn_loc=$(mdfind "kMDItemCFBundleIdentifier == 'nl.superalloy.oss.terminal-notifier'" 2>/dev/null | awk 'NR==1')
		if ! [[ $tn_loc ]] ; then
			tn_status="osa"
		else
			tn_status="tn-app-old"
		fi
	else
		tn_status="tn-app-new"
	fi
else
	tn_vers=$("$tn" -help | head -1 | awk -F'[()]' '{print $2}' | awk -F. '{print $1"."$2}')
	if (( $(echo "$tn_vers >= 1.8" | bc -l) )) && (( $(echo "$tn_vers < 2.0" | bc -l) )) ; then
		tn_status="tn-cli"
	else
		tn_loc=$(mdfind "kMDItemCFBundleIdentifier == 'fr.julienxx.oss.terminal-notifier'" 2>/dev/null | awk 'NR==1')
		if ! [[ $tn_loc ]] ; then
			tn_loc=$(mdfind "kMDItemCFBundleIdentifier == 'nl.superalloy.oss.terminal-notifier'" 2>/dev/null | awk 'NR==1')
			if ! [[ $tn_loc ]] ; then
				tn_status="osa"
			else
				tn_status="tn-app-old"
			fi
		else
			tn_status="tn-app-new"
		fi
	fi
fi

service=$(networksetup -listnetworkserviceorder | grep -B1 "$interface" | head -1 | awk -F")" '{print substr($0, index($0,$2))}' | sed 's/^ //')

_flush () {
	if [[ $osmajor -le 8 ]] ; then
		killall -HUP mDNSResponder 2>/dev/null
	elif [[ $osmajor == 9 ]] ; then
		dscacheutil -flushcache 2>/dev/null
		killall -HUP mDNSResponder 2>/dev/null
	elif [[ $osmajor == 10 ]] ; then
		osminor=$(echo "$osversion" | awk -F. '{print $3}')
		if [[ $osminor -le 3 ]] ; then
			discoveryutil mdnsflushcache 2>/dev/null
			discoveryutil udnsflushcaches 2>/dev/null
		else
			dscacheutil -flushcache 2>/dev/null
			killall -HUP mDNSResponder 2>/dev/null
		fi
	elif [[ $osmajor == 11 ]] ; then
		dscacheutil -flushcache 2>/dev/null
		killall -HUP mDNSResponder 2>/dev/null
	elif [[ $osmajor == 12 ]] ; then
		osminor=$(echo "$osversion" | awk -F. '{print $3}')
		if [[ $osminor -le 2 ]] ; then
			killall -HUP mDNSResponder 2>/dev/null
		else
			killall -HUP mDNSResponder 2>/dev/null
			killall mDNSResponderHelper 2>/dev/null
			dscacheutil -flushcache 2>/dev/null
		fi
	else
		killall -HUP mDNSResponder 2>/dev/null
	fi
}

CONFIG=$(cat "$TOML")
DNSCRYPT_PROXY_IPS=$(echo "$CONFIG" | awk -F"'" '/^listen_addresses =/{print $2}' | awk -F: '{print $1}')
[[ $DNSCRYPT_PROXY_IPS == "" ]] && DNSCRYPT_PROXY_IPS="127.0.0.1"

localdns=$(ipconfig getoption $interface domain_name_server 2>/dev/null)

cfgdir="$HOME/.config/dnscrypt"
fbloc="$cfgdir/cdefault"
dfloc="$cfgdir/pdefault"
udfloc="$cfgdir/udefault"
dfb="# FALLBACK SERVER LIST FOR DNSCRYPT\n# Please enter the DNS IP address in column 1.\n# You may add a description in column 2.\n# Columns must be separated by a whitespace character.\n\n9.9.9.9 Quad9"
udf="# DNS LIST FOR DEFAULT DNS WITHOUT DNSCRYPT\n# Please enter the DNS IP address in column 1.\n# You may add a description in column 2.\n# Columns must be separated by a whitespace character.\n\nempty empty"
if ! [[ -d "$cfgdir" ]] ; then
	mkdir -p "$cfgdir"
	echo -e "$dfb" > "$fbloc"
	echo -e "$udf" > "$udfloc"
	echo ${DNSCRYPT_PROXY_IPS} > "$dfloc"
else
	! [[ -f "$fbloc" ]] && echo -e "$dfb" > "$fbloc"
	! [[ -f "$udfloc" ]] && echo -e "$udf" > "$udfloc"
	! [[ -f "$dfloc" ]] && echo "${DNSCRYPT_PROXY_IPS}" > "$dfloc"
fi

cachedir="$HOME/.cache/dnscrypt"
currloc="$cachedir/current"
if ! [[ -d "$cachedir" ]] ; then
	mkdir -p "$cachedir"
	echo "0.0.0.0 placeholder" > "$currloc"
else
	! [[ -f "$currloc" ]] && echo "0.0.0.0 placeholder" > "$currloc"
fi

fallbacks=$(cat "$fbloc" | grep -v "^#" | grep -v "^$" | awk '!seen[$0]++' | grep -v "$localdns")
fbips=$(echo "$fallbacks" | awk '{print $1}')
fbipss=$(echo "$fbips" | sort)
ADDITIONAL_IP=$(echo "$fbips" | xargs)
ADDITIONAL_IPS=$(echo "$fbipss" | xargs)

_service_resolvers () {
	fservice="$1"
	getdnsservers=$(networksetup -getdnsservers "$fservice" | awk '!seen[$0]++')
	if [[ $(echo "$getdnsservers" | grep "^There") != "" ]] ; then
		echo "None"
	else
		ips=""
		while read -r ip
		do
			[[ $ips ]] && ips="$ips "
			ips="$ips$ip"
		done < <(echo "$getdnsservers")
		echo "$ips" | sed 's/^ //'
	fi
}

bakloc="$cfgdir/backup-$service"
if ! [[ -f "$bakloc" ]] ; then
	iresolvers=$(_service_resolvers "$service")
	if [[ $iresolvers == "None" ]] ; then
		echo "# No $service DNS resolvers detected at initial run" > "$bakloc"
	else
		echo ${iresolvers} > "$bakloc"
	fi
fi

defaultdns=$(cat "$udfloc" | grep -v "^#" | grep -v "^$" | grep -v "^empty empty$" | awk '!seen[$0]++' | grep -v "$localdns")
if ! [[ $defaultdns ]] ; then
	UDEFAULT="empty"
	UDEFAULTS=""
else
	udfips=$(echo "$defaultdns" | awk '{print $1}')
	udfipss=$(echo "$udfips" | sort)
	UDEFAULT=$(echo "$udfips" | xargs)
	UDEFAULTS=$(echo "$udfipss" | xargs)
fi

[[ $localdns ]] && UDEFAULT="${UDEFAULT} $localdns"

proxystatus=$(pgrep -U 0 "dnscrypt-proxy")
! [[ $proxystatus ]] && proxy=false || proxy=true

service_resolvers=$(_service_resolvers "$service")

SCRNAME=$(basename $0)

_setdefault () {
	networksetup -setdnsservers "$service" ${UDEFAULT} && _flush 2>/dev/null
}

if ! $proxy && [[ $(echo "$service_resolvers" | grep "$DNSCRYPT_PROXY_IPS") != "" ]] ; then
	_notify "DNSCrypt Service Error!" "Resetting to Default DNS…"
	_setdefault && /usr/bin/open "bitbar://refreshPlugin?name=$SCRNAME"
	exit 0
fi

if [[ $service_resolvers == "None" ]] && [[ $UDEFAULTS ]] ; then
	_notify "Detected Network DNS Reset!" "Resetting to Default DNS…"
	_setdefault && /usr/bin/open "bitbar://refreshPlugin?name=$SCRNAME"
	exit 0
fi

dnsip=$(dig whoami.akamai.net +short 2>/dev/null)
if [[ $(echo "$dnsip" | wc -l | xargs) -gt 1 ]] ; then
	echo "$ERROR_ICON"
	echo "---"
	echo "No Connection Available | color=red"
	echo "---"
	echo "Refresh… | refresh=true"
	exit 0
fi

if [[ $1 == "default" ]] ; then
	if [[ $2 == "dcp" ]] ; then
		echo "${DNSCRYPT_PROXY_IPS}" > "$dfloc"
	elif [[ $2 == "dcpfb" ]] ; then
		echo "${DNSCRYPT_PROXY_IPS} ${ADDITIONAL_IP}" > "$dfloc"
	fi
	exit 0
fi

currentdns=$(cat "$currloc")
currentdnsip=$(echo "$currentdns" | awk '{print $1}')
currentdnsname=$(echo "$currentdns" | awk '{print $2}')

DEFAULT=$(cat "$dfloc")

_abspath () {
	python - "$1" << 'EOF'
import os.path
import sys
for arg in sys.argv[1:]:
    print os.path.realpath(os.path.abspath(arg))
EOF
}

if [[ $1 == "proxyservice" ]] ; then
	if [[ $2 == "start" ]] ; then
		mprompt="Start"
	elif [[ $2 == "stop" ]] ; then
		mprompt="Stop"
	fi
	rootpw=$(osascript 2>/dev/null << EOT
tell application "System Events"
	activate
	set theLogoPath to ((path to library folder from system domain) as text) & "PreferencePanes:Security.prefPane:Contents:Resources:FileVault.icns"
	set thePW to text returned of (display dialog "Enter your administrator password to $2 the DNSCrypt Service." & ¬
		return & return & ¬
		"Please wait for the process to finish. You will need to enter your password again to change the macOS Network configuration." ¬
		default answer "" ¬
		with hidden answer ¬
		buttons {"Cancel", "$mprompt"} ¬
		default button 2 ¬
		with title "DNSCrypt Service" ¬
		with icon file theLogoPath ¬
		giving up after 180)
	end tell
thePW
EOT
	)
	if [[ $rootpw != "" ]] ; then
		dcptloc=$(_abspath "$dcploc")
		brewed=false
		[[ $(echo "$dcptloc" | grep "/Cellar/") != "" ]] && brewed=true
		brewstatus=$(brew help 2>/dev/null)
		if [[ $brewstatus ]] && $brewed ; then
			if [[ $2 == "stop" ]] ; then
				echo "$rootpw" | sudo -S 2>/dev/null brew services stop dnscrypt-proxy \
					&& sudo -k && rootpw="" \
					&& networksetup -setdnsservers "$service" ${UDEFAULT} \
					&& _flush 2>/dev/null \
					&& /usr/bin/open "bitbar://refreshPlugin?name=$SCRNAME"
			elif [[ $2 == "start" ]] ; then
				echo "$rootpw" | sudo -S 2>/dev/null brew services start dnscrypt-proxy \
					&& sudo -k && rootpw=""
				sleep 1
				proxystatus=$(pgrep -U 0 "dnscrypt-proxy")
				if [[ $proxystatus ]] ; then
					networksetup -setdnsservers "$service" ${DEFAULT} \
						&& _flush 2>/dev/null \
						&& /usr/bin/open "bitbar://refreshPlugin?name=$SCRNAME"
				else
					_notify "DNSCrypt Service Error!" "Resetting to Default DNS…"
					_setdefault && /usr/bin/open "bitbar://refreshPlugin?name=$SCRNAME"
				fi
			fi
		else
			if [[ $dcpver ]] ; then
				if [[ $2 == "stop" ]] ; then
					echo "$rootpw" | sudo -S 2>/dev/null dnscrypt-proxy -service stop \
						&& sudo -k && rootpw="" \
						networksetup -setdnsservers "$service" ${UDEFAULT} \
						&& _flush 2>/dev/null \
						&& /usr/bin/open "bitbar://refreshPlugin?name=$SCRNAME"
				elif [[ $2 == "start" ]] ; then
					echo "$rootpw" | sudo -S 2>/dev/null dnscrypt-proxy -service start \
						&& sudo -k && rootpw=""
					sleep 1
					proxystatus=$(pgrep -U 0 "dnscrypt-proxy")
					if [[ $proxystatus ]] ; then
						networksetup -setdnsservers "$service" ${DEFAULT} \
							&& _flush 2>/dev/null \
							&& /usr/bin/open "bitbar://refreshPlugin?name=$SCRNAME"
					else
						_notify "DNSCrypt Service Error!" "Resetting to Default DNS…"
						_setdefault && /usr/bin/open "bitbar://refreshPlugin?name=$SCRNAME"
					fi
				fi
			fi
		fi
	fi
	exit 0
fi

if [[ $# -gt 0 ]] ; then
	resopt="$*"
	# shellcheck disable=2086
	networksetup -setdnsservers "$service" $resopt
	_flush 2>/dev/null
	exit 0
fi

if [[ $theme == "classic" ]] ; then
	CONNECTED_ICON="| dropdown=false templateImage=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agoyNjEyCmVuZG9iago3IDAgb2JqClsgL0lDQ0Jhc2VkIDggMCBSIF0KZW5kb2JqCjMgMCBvYmoKPDwgL1R5cGUgL1BhZ2VzIC9NZWRpYUJveCBbMCAwIDE2IDE2XSAvQ291bnQgMSAvS2lkcyBbIDIgMCBSIF0gPj4KZW5kb2JqCjEwIDAgb2JqCjw8IC9UeXBlIC9DYXRhbG9nIC9QYWdlcyAzIDAgUiA+PgplbmRvYmoKMTEgMCBvYmoKKE1hYyBPUyBYIDEwLjkuNSBRdWFydHogUERGQ29udGV4dCkKZW5kb2JqCjEyIDAgb2JqCihEOjIwMTYwMzA0MjExMjA0WjAwJzAwJykKZW5kb2JqCjEgMCBvYmoKPDwgL1Byb2R1Y2VyIDExIDAgUiAvQ3JlYXRpb25EYXRlIDEyIDAgUiAvTW9kRGF0ZSAxMiAwIFIgPj4KZW5kb2JqCnhyZWYKMCAxMwowMDAwMDAwMDAwIDY1NTM1IGYgCjAwMDAwMDM4NzQgMDAwMDAgbiAKMDAwMDAwMDcxMSAwMDAwMCBuIAowMDAwMDAzNjQ5IDAwMDAwIG4gCjAwMDAwMDAwMjIgMDAwMDAgbiAKMDAwMDAwMDY5MiAwMDAwMCBuIAowMDAwMDAwODEzIDAwMDAwIG4gCjAwMDAwMDM2MTQgMDAwMDAgbiAKMDAwMDAwMDg4MSAwMDAwMCBuIAowMDAwMDAzNTk0IDAwMDAwIG4gCjAwMDAwMDM3MzAgMDAwMDAgbiAKMDAwMDAwMzc4MCAwMDAwMCBuIAowMDAwMDAzODMyIDAwMDAwIG4gCnRyYWlsZXIKPDwgL1NpemUgMTMgL1Jvb3QgMTAgMCBSIC9JbmZvIDEgMCBSIC9JRCBbIDw1NGY5OWIwZmViMWMxNzViOGE0NmQ3NTM2MTdlNmFhMD4KPDU0Zjk5YjBmZWIxYzE3NWI4YTQ2ZDc1MzYxN2U2YWEwPiBdID4+CnN0YXJ0eHJlZgozOTQ5CiUlRU9GCg=="
	DISCONNECTED_ICON="| dropdown=false templateImage=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IC9QYWdlcyAvTWVkaWFCb3ggWzAgMCAxNiAxNl0gL0NvdW50IDEgL0tpZHMgWyAyIDAgUiBdID4+CmVuZG9iagoxNyAwIG9iago8PCAvVHlwZSAvQ2F0YWxvZyAvUGFnZXMgMyAwIFIgL1ZlcnNpb24gLzEuNCA+PgplbmRvYmoKMTggMCBvYmoKKE1hYyBPUyBYIDEwLjkuNSBRdWFydHogUERGQ29udGV4dCkKZW5kb2JqCjE5IDAgb2JqCihEOjIwMTYwMzA0MjA1OTAzWjAwJzAwJykKZW5kb2JqCjEgMCBvYmoKPDwgL1Byb2R1Y2VyIDE4IDAgUiAvQ3JlYXRpb25EYXRlIDE5IDAgUiAvTW9kRGF0ZSAxOSAwIFIgPj4KZW5kb2JqCnhyZWYKMCAyMAowMDAwMDAwMDAwIDY1NTM1IGYgCjAwMDAwMDU2MjMgMDAwMDAgbiAKMDAwMDAwMDU1MyAwMDAwMCBuIAowMDAwMDA1Mzg0IDAwMDAwIG4gCjAwMDAwMDAwMjIgMDAwMDAgbiAKMDAwMDAwMDUzNCAwMDAwMCBuIAowMDAwMDAwNjU1IDAwMDAwIG4gCjAwMDAwMDA3NzkgMDAwMDAgbiAKMDAwMDAwMTI2NyAwMDAwMCBuIAowMDAwMDAxMjg2IDAwMDAwIG4gCjAwMDAwMDUzNDcgMDAwMDAgbiAKMDAwMDAwMTM1NSAwMDAwMCBuIAowMDAwMDAyNTc0IDAwMDAwIG4gCjAwMDAwMDE0MDMgMDAwMDAgbiAKMDAwMDAwMjU1MyAwMDAwMCBuIAowMDAwMDAyNjExIDAwMDAwIG4gCjAwMDAwMDUzMjYgMDAwMDAgbiAKMDAwMDAwNTQ2NSAwMDAwMCBuIAowMDAwMDA1NTI5IDAwMDAwIG4gCjAwMDAwMDU1ODEgMDAwMDAgbiAKdHJhaWxlcgo8PCAvU2l6ZSAyMCAvUm9vdCAxNyAwIFIgL0luZm8gMSAwIFIgL0lEIFsgPDZlYTc3ZjkwNzY2OGY2YTkzY2UyNDliYWM1NzMyYWEwPgo8NmVhNzdmOTA3NjY4ZjZhOTNjZTI0OWJhYzU3MzJhYTA+IF0gPj4Kc3RhcnR4cmVmCjU2OTgKJSVFT0YK"
elif [[ $theme == "emoji" ]] ; then
	CONNECTED_ICON='✔️'
	DISCONNECTED_ICON='❕'
fi

_current_resolvers () {
	confrs=$(cat /etc/resolv.conf | awk '/^nameserver /{print $2}' | awk '!seen[$0]++' | sort)
	[[ $confrs == "" ]] && exit 0
	confrs=$(echo "$confrs" | grep -v "$localdns")
	ips=""
	while read -r confr
	do
		[[ $ips ]] && ips="$ips "
		ips="$ips$confr"
	done < <(echo "$confrs")
	echo "$ips"
}

_displayname () {
	resolvers="$1"
	if [[ $resolvers == $DNSCRYPT_PROXY_IPS ]] ; then
		echo "DNSCrypt"
	elif [[ $resolvers == "$DNSCRYPT_PROXY_IPS $ADDITIONAL_IPS" ]] ; then
		echo "DNSCrypt + Fallback"
	elif [[ $resolvers == $UDEFAULTS ]] ; then
		echo "Default DNS"
	else
		echo "Other DNS"
	fi
}

current_resolvers=$(_current_resolvers)
setting=$(_displayname "$current_resolvers")

if $proxy ; then
	if [[ $setting == "DNSCrypt" ]] ; then
		echo "$CONNECTED_ICON"
		dnsc=true
		dnscf=false
		dnsd=false
		dnso=false
	elif [[ $setting == "DNSCrypt + Fallback" ]] ; then
		echo "$CONNECTED_ICON"
		dnsc=false
		dnscf=true
		dnsd=false
		dnso=false
	elif [[ $setting == "Default DNS" ]] ; then
		echo "$DISCONNECTED_ICON"
		dnsc=false
		dnscf=false
		dnsd=true
		dnso=false
	elif [[ $setting == "Other DNS" ]] ; then
		echo "$DISCONNECTED_ICON"
		dnsc=false
		dnscf=false
		dnsd=false
		dnso=true
	fi
else
	echo "$ERROR_ICON"
	dnsc=false
	dnscf=false
	if [[ $setting == "Default DNS" ]] ; then
		dnsd=true
		dnso=false
	else
		dnsd=false
		dnso=true
	fi
fi

echo "---"

nstat=$(netstat -nr 2>/dev/null | awk '/^0\/1/ {print $6}')

if ! [[ $localdns ]] ; then
	localdns="None"
	ldnsname=""
else
	ldnsname=$(ipconfig getpacket $interface 2>/dev/null | awk -F": " '/^domain_name \(string\): /{print $2}')
	[[ "$ldnsname" == "" ]] && ldnsname="Unknown Hostname"
fi

_dnsinfo () {
	echo "--Service | size=11 color=gray"
	echo "--${service}"
	echo "-----"
	if [[ $nstat ]] ; then
		echo "--Devices | size=11 color=gray"
		echo "--$interface $nstat"
	else
		echo "--Device | size=11 color=gray"
		echo "--$interface"
	fi
	echo "-----"
	echo "--Current DNS Resolvers | size=11 color=gray"
	if ! [[ ${current_resolvers} ]] ; then
		echo "--None"
	else
		for cres in ${current_resolvers}
		do
			if $dnso ; then
				echo "--$cres"
			elif $dnsd ; then
				cresname=$(echo "$defaultdns" | grep -F "$cres" | awk '{print substr($0, index($0,$2))}')
				! [[ $cresname ]] && cresname="n/a"
				echo "--$cres ($cresname)"
			else
				if [[ $cres == $DNSCRYPT_PROXY_IPS ]] ; then
					cresname="DNSCrypt"
				else
					if $dnscf ; then
						cresname=$(echo "$fallbacks" | grep -F "$cres" | awk '{print substr($0, index($0,$2))}')
						! [[ $cresname ]] && cresname="n/a"
					else
						cresname="n/a"
					fi
				fi
				echo "--$cres ($cresname)"
			fi
		done
	fi
	echo "-----"
	if ! [[ $dnsip ]] ; then
		dnsip="Unknown IP"
		dnsname="Unknown Hostname"
	else
		if [[ $dnsip != $currentdnsip ]] ; then
			dnsname=$(curl -sL "https://ipinfo.io/$dnsip/hostname" 2>/dev/null)
			if [[ $(echo "$dnsname" | grep "requests") != "" ]] || [[ $dnsname == "" ]] ; then
				dnsname=$(curl -sL "https://www.robtex.com/ip/$dnsip.html" 2>/dev/null | grep -m1 "The PTR is" | awk -F"The PTR is " '{print $2}' | awk -F". " '{print $1}')
				! [[ $dnsname == "" ]] && dnsname="Unknown Hostname"
			fi
			echo "$dnsip $dnsname" > "$currloc"
		else
			dnsname="$currentdnsname"
		fi
	fi
	echo "--Public DNS Information | size=11 color=gray"
	echo "--$dnsip"
	echo "--$dnsname"
	millisecs=$(ping -c 2 -n -q "$dnsip" 2>/dev/null | tail -n 1 | awk -F/ '{print $5}')
	if ! [[ $millisecs ]] ; then
		echo "--No Ping Result"
	else
		echo "--$millisecs ms"
	fi
	if $dnsd ; then
		echo "-----"
		echo "--Local Area DNS | size=11 color=gray"
		if [[ $ldnsname != "" ]] ; then
			echo "--$localdns ($ldnsname)"
		else
			echo "--$localdns"
		fi
	fi
	echo "-----"
	echo "--Configured $service Resolvers | size=11 color=gray"
	for sresolv in ${service_resolvers}
	do
		echo "--$sresolv"
	done
}

_dnscmenu () {
	echo "--Configured Resolver | size=11 color=gray"
	for proxyip in ${DNSCRYPT_PROXY_IPS}
	do
		echo "--$proxyip"
	done
}

_fbmenu () {
	echo "--Configured DNSCrypt Resolver | size=11 color=gray"
	for proxyip in ${DNSCRYPT_PROXY_IPS}
	do
		echo "--$proxyip"
	done
	echo "-----"
	echo "--Configured Fallback Resolvers | size=11 color=gray"
	if ! [[ $fbipss ]] ; then
		echo "--None"
	else
		while read -r fbip
		do
			fbname=$(echo "$fallbacks" | grep -F "$fbip" | awk '{print substr($0, index($0,$2))}')
			[[ $fbname == "" ]] && fbname="n/a"
			echo "--$fbip ($fbname)"
		done < <(echo "$fbipss")
	fi
	echo "-----"
	echo "--Edit Fallback Resolvers… | terminal=false bash=/usr/bin/open param1=-a param2=TextEdit param3=$fbloc"
}

_dfmenu () {
	echo "--Configured Resolvers | size=11 color=gray"
	if ! [[ $udfipss ]] ; then
		echo "--None"
	else
		while read -r cddnsr
		do
			cddnsrname=$(echo "$defaultdns" | grep -F "$cddnsr" | awk '{print substr($0, index($0,$2))}')
			[[ $cddnsrname == "" ]] && fbname="n/a"
			echo "--$cddnsr ($cddnsrname)"
		done < <(echo "$udfipss")
	fi
	echo "-----"
	echo "--Available Local Area DNS | size=11 color=gray"
	if [[ $ldnsname != "" ]] ; then
		echo "--$localdns ($ldnsname)"
	else
		echo "--$localdns"
	fi
	echo "-----"
	echo "--Edit Default DNS Resolvers… | terminal=false bash=/usr/bin/open param1=-a param2=TextEdit param3=$udfloc"
}

echo "---"

if $proxy ; then
	if $dnsc ; then
		echo "DNSCrypt | checked=true"
		_dnsinfo
		echo "Set As DNSCrypt Default… | alternate=true refresh=true terminal=false checked=true bash=$0 param1=default param2=dcp"
		_dnsinfo
	else
		echo "DNSCrypt | terminal=false refresh=true bash=$0 param1='${DNSCRYPT_PROXY_IPS}'"
		_dnscmenu
		echo "Set As DNSCrypt Default… | alternate=true refresh=true terminal=false bash=$0 param1=default param2=dcp"
		_dnscmenu
	fi
	if $dnscf ; then
		echo "DNSCrypt + Fallback | checked=true"
		_dnsinfo
		echo "Set As DNSCrypt Default… | alternate=true refresh=true terminal=false checked=true bash=$0 param1=default param2=dcpfb"
		_dnsinfo
	else
		echo "DNSCrypt + Fallback | terminal=false refresh=true bash=$0 param1='${DNSCRYPT_PROXY_IPS} ${ADDITIONAL_IP}'"
		_fbmenu
		echo "Set As DNSCrypt Default… | alternate=true refresh=true terminal=false bash=$0 param1=default param2=dcpfb"
		_fbmenu
	fi
	if $dnsd ; then
		echo "Default DNS | checked=true"
		_dnsinfo
		echo "Other DNS"
	else
		if $dnso ; then
			echo "Default DNS"
			_dfmenu
			echo "Other DNS | checked=true"
			_dnsinfo
		else
			echo "Default DNS | terminal=false refresh=true bash=$0 param1='${UDEFAULT}'"
			_dfmenu
			echo "Other DNS"
		fi
	fi
else
	echo "DNSCrypt"
	echo "Set As DNSCrypt Default… | alternate=true refresh=true terminal=false bash=$0 param1=default param2=dcp"
	echo "DNSCrypt + Fallback"
	echo "Set As DNSCrypt Default… | alternate=true refresh=true terminal=false bash=$0 param1=default param2=dcpfb"
	if $dnsd ; then
		echo "Default DNS | checked=true"
		_dnsinfo
		echo "Other DNS"
	elif $dnso ; then
		echo "Default DNS"
		_dfmenu
		echo "Other DNS | checked=true"
		_dnsinfo
	fi
fi

echo "---"

servers=$(echo "$CONFIG" | grep "^server_names =" | awk -F'[][]' '{print $2}' | sed -e 's/, /\\n/g' -e "s/\\'//g")
if [[ $servers ]] ; then
	echo "Configured DNSCrypt Servers"
	while read -r server
	do
		echo "--$server"
	done < <(echo -e "$servers")
else
	echo "All DNSCrypt Servers Used"
fi
echo "DNSCrypt Public Server List… | href=https://dnscrypt.info/public-servers"

scrparent="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
scrpath="$scrparent/$SCRNAME"
scrshort="${scrpath/#$HOME/~}"

_serviceinfo () {
	echo "--Process | size=11 color=gray"
	if $proxy ; then
		echo "--$proxystatus (root)"
	else
		echo "--Disabled"
	fi
	echo "-----"
	echo "--Version | size=11 color=gray"
	if [[ $dcpver != "" ]] ; then
		echo "--$dcpver"
	else
		echo "--n/a"
	fi
	echo "-----"
	echo "--Path | size=11 color=gray"
	shortpath="${dcploc/#$HOME/~}"
	pathdir=$(dirname "$dcploc")
	echo "--$shortpath | terminal=false bash=/usr/bin/open param1=\"$pathdir\""
	if [[ -h $dcploc ]] ; then
		dcpaloc=$(_abspath "$dcploc")
		dcpashort="${dcpaloc/#$HOME/~}"
		dcpaparent=$(dirname "$dcpaloc")
		echo "--→ $dcpashort | terminal=false bash=/usr/bin/open param1=\"$dcpaparent\""
	fi
	echo "-----"
	echo "--Configuration | size=11 color=gray"
	shorttoml="${TOML/#$HOME/~}"
	tomldir=$(dirname "$TOML")
	echo "--$shorttoml | terminal=false bash=/usr/bin/open param1=\"$tomldir\""
	if [[ -h $TOML ]] ; then
		tomla=$(_abspath "$TOML")
		tomlashort="${tomla/#$HOME/~}"
		tomlaparent=$(dirname "$tomla")
		echo "--→ $tomlashort | terminal=false bash=/usr/bin/open param1=\"$tomlaparent\""
	fi
	echo "--Edit… | terminal=false bash=/usr/bin/open param1=\"$TOML\""
	echo "-----"
	echo "--Open Network Preferences… | terminal=false bash=/usr/bin/open param1=\"/System/Library/PreferencePanes/Network.prefPane\""
}

echo "---"

if $proxy ; then
	echo "DNSCrypt Service | checked=true terminal=false bash=$0 param1=proxyservice param2=stop"
	_serviceinfo
else
	echo "DNSCrypt Service | terminal=false bash=$0 param1=proxyservice param2=start"
	_serviceinfo
fi

echo "---"

echo "DNSCrypt Menu"
echo "--$scrshort | terminal=false bash=/usr/bin/open param1=\"$scrparent\""
if [[ -h $scrpath ]] ; then
	scrapath=$(_abspath "$scrpath")
	scrashort="${scrapath/#$HOME/~}"
	scraparent=$(dirname "$scrapath")
	echo "--→ $scrashort | terminal=false bash=/usr/bin/open param1=\"$scraparent\""
fi
echo "--Edit… | terminal=false bash=/usr/bin/open param1=\"$scrpath\""
echo "-----"
echo "--Version $dcmver$dcmvadd"
echo "-----"
echo "--GitHub Repository… | href=https://github.com/JayBrown/DNSCrypt-Menu"
echo "Refresh… | refresh=true"

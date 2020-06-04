#!/usr/bin/env bash

get_percent()
{
	case $(uname -s) in
		Linux)
			percent=$(free -m | awk 'NR==2{printf "%.1f%%\n", $3*100/$2}')
			echo $percent
		;;

		Darwin)
			percent=$(ps -A -o %mem | awk '{mem += $1} END {print mem}')
			echo $percent
		;;

		CYGWIN*|MINGW32*|MSYS*|MINGW*)
			# TODO - windows compatability
		;;
	esac
}

main()
{
	ram_percent=$(get_percent)
	echo "RAM $ram_percent"
	sleep 10
}

#run main driver
main

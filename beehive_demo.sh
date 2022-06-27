#!/bin/bash

echo "Welcome to the Beehive demo!"
echo
echo "Select demo type:"
echo

options=("Small" "Medium" "Large" "Custom" "Quit")
select opt in "${options[@]}"
do
	case $opt in
		"Small")
			time=5
			drones=2
			nectar=2
			pollen=2
			break
			;;
		"Medium")
			time=20
			drones=4
			nectar=4
			pollen=4
			break
			;;
		"Large")
			time=40
			drones=8
			nectar=8
			pollen=8
			break
			;;
		"Custom")
			echo "Custom simulation selected, enter in details..."
			echo
			echo "Time:"
			read time
			echo "Drones:"
			read drones
			echo "Nectar Workers:"
			read nectar
			echo "Pollen Workers:"
			read pollen
			echo
			break
			;;
		"Quit")
			exit
			;;
		*)
			echo "Invalid Option"
			;;
	esac
done

if( [ -d "bee" ] && [ -d "util" ] && [ -d "world" ] && [ -f "BeeMain.class" ] )
then
		echo
		echo "Files already compiled, would you like to recompile [ (y)es / (n)o ]?"
		read answer
		echo

		if [ ${answer,,} == "y" ] || [ ${answer,,} == "yes" ]
		then
			rm *.class bee/*.class util/*.class world/*.class
			rmdir bee util world
			javac -d bee src/bee/*.java -d util src/util/*.java -d world src/world/*.java -d . src/BeeMain.java
		fi
else
		javac -d bee src/bee/*.java -d util src/util/*.java -d world src/world/*.java -d . src/BeeMain.java
fi

echo "Beginning demo..."
echo
java BeeMain $time $drones $nectar $pollen
echo
echo "...demo complete!"
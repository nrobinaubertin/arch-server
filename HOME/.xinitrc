################
##  .xinitrc  ##
################


# Set the wallpaper
eval $(cat ~/.fehbg)

setxkbmap fr

##### BIG LOOP #####
##### shutdown if battery is too low (before the loud beep
##### DWM STATUS
while true
do

# Volume Level
#DWM_VOL=$(amixer | sed -n '5p' | cut -d' ' -f6 | sed 's/[^0-9%]//g')

# CPU load
DWM_CPU=$(w | sed -n '1p' | sed 's/^.*average:\ \(.*\),.*,.*/\1/')

# Date and Time
DWM_CLOCK=$( date '+%e %b %Y   %k:%M' );

# batStat will be used to manage battery warnings
DWM_BAT=$(echo `acpi -b` | cut -d, -f2 |  cut -d' '  -f2)

# Heat status of cpu
DWM_HEAT=$(sensors | grep "Core 1" | sed 's/[^\ .0-9]//g; s/[\ ]\+/ /g;' | cut -d' ' -f3 | sed 's/^\([0-9][0-9]\).*/\1/')

# Overall output command
DWM_STATUS="[$DWM_CPU] [$DWM_HEAT] [$DWM_BAT]  $DWM_CLOCK";
xsetroot -name "$DWM_STATUS";

# batStat will be used to manage battery warnings
batStat=$(echo `acpi -b` | cut -d, -f2 | cut -d% -f1 | cut -d' '  -f2)
if [[ -z $batStat ]]
then
	batStat=100
fi
if [[ $batStat -lt 11 ]]
then
	notify-send -u critical -t 1000 "BATTERY LOW !"
fi
if [[ $batStat -lt 6 ]]
then
	sudo umount /data
	sudo umount /mnt
	sudo umount /mnt2
	sudo shutdown -h now
fi
sleep 10s
	
done &

## Start xcompmgr in order to use transset-df (transparency)
xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &

# Stop bell
xset b off

# Merge Xresource
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

# Start WM
exec dwm

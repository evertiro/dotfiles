# Tweak touchpad
for i in $(xinput list | grep "Touchpad" | perl -n -e'/id=(\d+)/ && print "$1\n"')
do
    xinput set-prop $i 275 1
done

# Daemonize urxvt
urxvtd -q -f -o

# Network manager
wicd-gtk &

# Enable numlock
numlockx &

# Setup screen locking
betterlockscreen -w &
xautolock -time 15 -locker 'betterlockscreen -l' &

exec i3

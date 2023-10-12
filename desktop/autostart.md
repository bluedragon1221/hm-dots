# Make Hyprland launch on boot
https://www.reddit.com/r/hyprland/comments/127m3ef/starting_hyprland_directy_from_systemd_a_guide_to/

I don't like typing multiple passwords, waiting for the network to get online and other useless things so I've set systemd and autologin straight into hyprland.

If you want to do the same on Arch, you don't need gdm or any login manager, you just have to create 3 files. I also suggest you tweak your hyprland.conf to ask for a password at least once during boot.

## SystemD Service
Create a /etc/systemd/system/getty@tty1.service containing:

```systemd
[Unit]
Description=Start hyprland
After=sysinit.target
After=initrd-switch-root.service

Wants=systemd-udev-trigger.service
After=systemd-udev-trigger.service
Wants=seatd.service
After=seatd.service
Wants=systemd-logind.service
After=systemd-logind.service

ConditionPathExists=/home/YOUR_USERNAME OnFailure=emergency.target

[Service]
Type=simple
ExecStartPre=+/usr/sbin/rm -f /run/nologin
ExecStart=-/usr/sbin/agetty -o '-p -f -- \u' --noclear --autologin YOUR_USERNAME %I $TERM
StandardOutput=null
StandardError=journal

[Install]
WantedBy=graphical.target
WantedBy=initrd-switch-root.service
```

You'll notice how I'm starting hyprland as early as possible for a speedy boot. If you're careful, you'll use `After=graphical.target` and not remove the nologin file that's here to prevent you from logging in before the boot is "officially finished"

I'm not careful, I like speed and danger, so I've tried various early starts options like After=basic.target but I had some problems with proc-sys-fs-binfmt_misc.automount failing so I leave it like that for now with After=sysinit.target (but I may try again to start after basic.target shave like half a second lol)

## Shell `.profile`
Create ~/.profile containing:

```sh
sh hyprland.sh && echo "goodbye, now logging out" && exit 0 \
 || echo "$? hyperland.sh failed" && tty | grep tty1 \
  && echo "refusing autologin without hyprland on tty1" && exit 0 \
  || echo "not on tt1, letting in"
```

It will prevent exposing your autologin shell in case hyprland fails to start, while working normally outside autologin


## `~/hyprland.sh`
It's the most important file: it contains the commands to start hyprland even with some missings things, and starts iwd in the background to avoid slowing down the boot until the network is ready

```sh
#!/bin/sh
export USER=YOUR_USERNAME
[ -z $TERM ] && export TERM=linux
[ -z $LOGNAME ] && export LOGNAME=$USER
[ -z $HOME ] && export HOME=/home/$USER
[ -z $LANG ] && export LANG=C.UTF-8
[ -z $PATH ] && export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl
[ -z $XDG_SEAT ] && export XDG_SEAT=seat0
[ -z $XDG_SESSION_TYPE ]  && export XDG_SESSION_TYPE=tty
[ -z $XDG_SESSION_CLASS ] && export XDG_SESSION_CLASS=user
[ -z $XDG_VTNR ] && export XDG_VTNR=1
[ -z $XDG_RUNTIME_DIR ] && export XDG_RUNTIME_DIR=/run/user/1000
[ -z $DBUS_SESSION_BUS_ADDRESS ] && export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

export HYPRLAND_LOG_WLR=1

exec Hyprland > .hyprland.log.txt 2> .hyprland.err.txt
```

In case of errors, check ~/.hyprland.err.txt you may have to do a few other tweaks, but now I get to my desktop within seconds after the boot AND I LOVE THAT

BTW unless you have the name username as I do, you should probably replace csdvrx by your login :) Also make your UID match, I put 1000 in there as it's usually the default UID but my user is 1001 so replace that too by the value that matches your login UID!

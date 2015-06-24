#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/jmk
xset +fp /home/sanic/.fonts
xset fp rehash
xsetroot -cursor_name left_ptr &
/usr/bin/VBoxClient-all

[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources

hsetroot -fill /home/sanic/.config/awesome/themes/multicolor/wall.png &
compton &

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice
#exec awesome
exec $1

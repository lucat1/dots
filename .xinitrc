#!/bin/sh

[ -f ~/.xprofile ] && . ~/.xprofile

exec openbox-session

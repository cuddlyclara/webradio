#!/bin/sh
mpd --stdout --no-daemon &

until mpc status > /dev/null 2>&1; do
  sleep 1
done

mpc random on > /dev/null 2>&1
mpc repeat on > /dev/null 2>&1
mpc ls | mpc add > /dev/null 2>&1
mpc play > /dev/null 2>&1

wait

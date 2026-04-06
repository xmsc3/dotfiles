#!/bin/sh

# Interfaz usada por la ruta por defecto
iface="$(ip route show default 2>/dev/null | awk '{print $5}' | head -n1)"

# Sin interfaz activa -> offline
if [ -z "$iface" ]; then
    printf '%%{F#f7768e} %%{F#f7768e}Offline%%{F-}\n'
    exit 0
fi

# Lectura de bytes recibidos
rx1="$(cat "/sys/class/net/$iface/statistics/rx_bytes" 2>/dev/null)"
sleep 1
rx2="$(cat "/sys/class/net/$iface/statistics/rx_bytes" 2>/dev/null)"

# Si falla la lectura, offline
if [ -z "$rx1" ] || [ -z "$rx2" ]; then
    printf '%%{F#f7768e} %%{F#f7768e}Offline%%{F-}\n'
    exit 0
fi

down_bps=$((rx2 - rx1))

# Convertir bytes/s a megabits/s
speed_mbps=$((down_bps * 8 / 1000000))

case "$iface" in
    wl*|wlan*)
        icon=""
        ;;
    en*|eth*|eno*|ens*)
        icon="󰈀"
        ;;
    *)
        icon="󰈀"
        ;;
esac

# printf '%%{F#9ece6a}%s %%{F#e0af68}%sMbps%%{F-}\n' "$icon" "$speed_mbps"
printf '%%{F#9ece6a}%s %%{F#e0af68}%s%%{F-}\n' "$icon" "$speed_mbps"
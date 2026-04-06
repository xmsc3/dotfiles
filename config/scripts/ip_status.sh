#!/bin/sh

# Detecta la interfaz usada por la ruta por defecto
iface="$(ip route show default 2>/dev/null | awk '{print $5}' | head -n1)"

# Si no hay interfaz por defecto, no muestra nada
[ -n "$iface" ] || exit 0

# Obtiene la IPv4 global de esa interfaz en formato CIDR
cidr="$(ip -o -4 addr show dev "$iface" scope global 2>/dev/null | awk '{print $4}' | head -n1)"

# Si no hay IPv4, no muestra nada
[ -n "$cidr" ] || exit 0

ip="${cidr%/*}"
prefix="${cidr#*/}"

# Icono según tipo de interfaz
case "$iface" in
    wl*|wlan*)
        icon=""
        ;;
    en*|eth*|eno*|ens*)
        icon="󰈀"
        ;;
    *)
        icon=""
        ;;
esac

# Oculta /24 por ser lo habitual, pero muestra cualquier otra máscara
if [ "$prefix" = "24" ]; then
    display="$ip"
else
    display="$cidr"
fi

printf '%%{F#2495e7}%s %%{F#ffffff}%s%%{u-}\n' "$icon" "$display"

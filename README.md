# dotfiles

Personal Arch Linux dotfiles based on  
https://github.com/gh0stzk/dotfiles

Adapted for my **ROG Zephyrus G14** with NVIDIA support and custom scripts.

## Structure

```
config
├── bspwm
│   ├── bin
│   │   ├── MonitorSetupMirror
│   │   └── OpenApps
│   ├── bspwmrc
│   ├── eww
│   │   └── cheatsheet
│   │       └── cheatsheet.yuck
│   └── rices
│       └── emilia
│           ├── config.ini
│           └── modules.ini
├── gtk-3.0
│   └── settings.ini
├── kitty
│   ├── color.ini
│   └── kitty.conf
├── scripts
│   ├── gpu_polybar_toggle_click.sh
│   ├── gpu_polybar_toggle.sh
│   ├── ip_status.sh
│   └── network_status.sh
└── sxhkd
    └── sxhkdrc
```

## Install

> These dotfiles are configured for **ASUS ROG Zephyrus G14** with **NVIDIA hybrid graphics**.  
> You may need ASUS and NVIDIA related packages/scripts.

```bash
git clone https://github.com/xmsc3/dotfiles.git
cp -r dotfiles/config/* ~/.config/
```

*Only includes the files I modified or selected.*
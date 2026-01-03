#


## debug

```
# Which pins exist
ls /sys/kernel/debug/pinctrl/

# Tegra-specific
ls /sys/kernel/debug/pinctrl/tegra-pinctrl/

# Pin ownership + function
cat /sys/kernel/debug/pinctrl/tegra-pinctrl/pinmux-pins

# Electrical state
cat /sys/kernel/debug/pinctrl/tegra-pinctrl/pins

```

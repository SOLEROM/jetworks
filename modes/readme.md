# jetson modes


 **power modes** managed by **`nvpmodel`**. A *power mode* is a predefined **power/thermal envelope** that limits (or enables) things like:

* CPU core count and max frequency
* GPU/DLA/PVA availability and max frequency
* Memory/SOC clocks (platform-dependent)

The goal is a predictable trade-off between **performance**, **power draw**, and **thermals**. NVIDIA ships several preconfigured modes per module (for example 7W/10W/15W/25W/40W/MAXN), and you can also create custom ones. ([NVIDIA Developer][1])

## How to view and switch Jetson power modes

On the device:

```bash
# Show current mode + all available modes (recommended)
sudo nvpmodel -q --verbose

# Switch to a mode by its ID (IDs differ by platform/config)
sudo nvpmodel -m <mode_id>
```

Notes:

* The **mode IDs are not universal**; they depend on the Jetson module *and* the flashed configuration. Always query first. ([NVIDIA Developer][1])
* `jetson_clocks` is separate: it typically **locks clocks to the maximum allowed within the current power mode** (useful for repeatable benchmarks), but it does not magically bypass the mode’s power limits.

## What is “Super Mode”?

**Super Mode** is an NVIDIA JetPack feature (introduced for Orin Nano / Orin NX in **JetPack 6.2**) that **unlocks additional, higher-power reference modes** and higher clocks—primarily to boost performance on heavy AI workloads (notably generative AI). ([NVIDIA Developer][2])

Per NVIDIA’s JetPack 6.2 announcement:

* **Jetson Orin Nano** gains a **25W** mode and an **uncapped `MAXN SUPER`** mode.
* **Jetson Orin NX** gains a **40W** mode and an **uncapped `MAXN SUPER`** mode. ([NVIDIA Developer][2])

### What does `MAXN SUPER` mean in practice?

`MAXN SUPER` is described by NVIDIA as an **uncapped power mode** enabling the highest available cores and clocks; if your module exceeds what your cooling/thermal design can sustain, it will **throttle** to stay within thermal limits. ([NVIDIA Developer][2])

### Important practical point: Super Mode requires the right flashing configuration

NVIDIA notes that the new Super power modes are **only available with a “new flashing configuration”** (the default flash config remains unchanged). Example given: `jetson-orin-nano-devkit-super.conf`. ([NVIDIA Developer][2])

### Quick check: is Super Mode enabled?

Run:

```bash
sudo nvpmodel -q --verbose
```

If Super Mode is enabled for that image/config, you should see **`MAXN_SUPER`** (and the new 25W/40W modes where applicable) in the available mode list. ([NVIDIA Developer][2])

If you tell me which exact module you have (Orin Nano 4GB/8GB, Orin NX 8GB/16GB, AGX Orin, Xavier, Nano, etc.) and your JetPack version, I can map what “typical” mode names look like for that platform and what you should expect to see from `nvpmodel -q --verbose`.

[1]: https://developer.nvidia.com/blog/power-optimization-with-nvidia-jetson/ "Power Optimization with NVIDIA Jetson | NVIDIA Technical Blog"
[2]: https://developer.nvidia.com/blog/nvidia-jetpack-6-2-brings-super-mode-to-nvidia-jetson-orin-nano-and-jetson-orin-nx-modules/ "NVIDIA JetPack 6.2 Brings Super Mode to NVIDIA Jetson Orin Nano and Jetson Orin NX Modules | NVIDIA Technical Blog"

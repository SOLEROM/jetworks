# smoke test


## module test

```
> Device Drivers > Search (CONFIG_DUMMY) > Network core driver support
<M>   Dummy net driver support 

CONFIG_DUMMY
```

## build in test

```
 > Kernel hacking > Sample kernel code

<*>   Build kobject examples
```


before
```
uname -a
Linux ubuntu 5.15.148-tegra #1 SMP PREEMPT Mon Jun 16 08:24:48 PDT 2025 aarch64 aarch64 aarch64 GNU/Linux

/boot/extlinux/extlinux.conf
LABEL primary
      MENU LABEL primary kernel
      LINUX /boot/Image


```

after build

```
/out/kernel_out# ls arch/arm64/boot/
Image  dts


```
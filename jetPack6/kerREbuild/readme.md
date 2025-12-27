# rebuild

ref : https://ateh.tech/building-jetson-linux-r36-4-4-for-the-orin-nx-module/?utm_source=chatgpt.com

## 3644

```
docker build -t jetson-kernel-build:jp62 .
docker run --rm -it -v ./build_3644:/out jetson-kernel-build:jp62
```

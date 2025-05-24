# stack allignment

## Runnig onnx inference on jetson hw from docker container

### JetPack / L4T (on the host)	

* Includes the NVIDIA Linux driver and CUDA-X.Y
* e.g. JetPack 5.1.2 → L4T R36.2.0 → CUDA 11.4

### Host driver vs. container CUDA runtime

The driver on the host must be ≥ the CUDA runtime version in your container. If the container CUDA runtime is 12.2, the host driver must support CUDA 12.2 (otherwise you get “driver version is insufficient…”).

### cuXXX

* cuDNN, cuBLAS, cuFFT, cuSPARSE, etc.
* Must match roughly the CUDA version. For CUDA 11.x you’ll install libcudnn8 for 11.x, for CUDA 12.x libcudnn8 for 12.x, etc.

### ONNX Runtime GPU wheel
* Wheels are built against a particular CUDA version and Python ABI. E.g. onnxruntime_gpu-1.18.0-cp310-cp310-linux_aarch64.whl → CUDA 11.6, Python 3.10. 

### Python version

The wheel’s filename tells you: cp310 means it needs Python 3.10. Don’t install it into Python 3.8 or 3.9.

### NVIDIA Container Toolkit
* On the host you need the NVIDIA Container Runtime
* injects /usr/local/cuda into containers and exposes the driver.

# check

```
1. JetPack / L4T (on the host)	

                        head -n1 /etc/nv_tegra_release
                        cat /etc/jetson_release
                        dpkg-query -W nvidia-l4t-core

2. Host driver vs. container CUDA runtime

                        cat /proc/driver/nvidia/version
                        modinfo nvidia | grep ^version
                        grep -i cuda /usr/local/cuda/version.txt
                        nvcc --version  // in case toolkit is installed

3. cuXXX
                        install by dockerfile
                        apt-get install -y libcudnnXXXXX

4. ONNX Runtime GPU wheel
                        install by dockerfile
                        onnxruntime_gpu-1.18....
                                       !!!!!!!
5. Python version
                        python --version inside container
                        onnxruntime_gpu-...cp310...aarch64.whl
                                          !!!!!!!

6. NVIDIA Container Toolkit
                On Jetson boards with GPU acceleration, NVIDIA's nvidia-container-toolkit expects Docker to be docker-ce.
                .... sudo apt-get install -y nvidia-container-toolkit

```
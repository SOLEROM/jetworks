# add dockers

## deps

```
sudo apt-get update && sudo apt-get install -y curl gnupg lsb-releas nvtop
sudo pip3 install -U jetson-stats


Why I recommend docker-ce over docker.io here:
On Jetson boards with GPU acceleration, NVIDIA's nvidia-container-toolkit expects Docker to be docker-ce.

sudo apt-get purge -y docker docker.io
sudo apt-get autoremove -y


curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o \
  /usr/share/keyrings/docker.gpg

echo \
  "deb [arch=arm64 signed-by=/usr/share/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list

sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io
```

## nvidia toolkit

```
distribution=$(. /etc/os-release; echo ${ID}${VERSION_ID})

curl -s -L https://nvidia.github.io/libnvidia-container/gpgkey | \
  sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit.gpg

curl -s -L https://nvidia.github.io/libnvidia-container/$distribution/libnvidia-container.list | \
  sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit.gpg] https://#' | \
  sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit

```

```
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker

sudo usermod -aG docker $USER
```

## notes

```
NVIDIA runtime is default ; Use --gpus all?  Not needed
```


## test
sudo docker run --rm --runtime=nvidia --gpus all ubuntu nvidia-smi



## onnxruntime

```
the onnxruntime on jetson need older numpy than installed ; downgrade:

pip3 install --no-cache-dir numpy==1.26.3
```
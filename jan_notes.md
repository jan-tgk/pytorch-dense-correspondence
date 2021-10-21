### 1. Install yaml
`sudo apt-get install -y python-yaml`
### 2. Edit .gitignore
`pdc/*`
### 3. Download dataset
`python config/download_pdc_data.py config/dense_correspondence/dataset/composite/caterpillar_upright.yaml`
### 4. Install nvidia Docker
[https://docs.docker.com/engine/install/ubuntu/](https://docs.docker.com/engine/install/ubuntu/)

Unistall old version...
` sudo apt-get remove docker docker-engine docker.io containerd run`

Set up the repo:

`apt-get update`

`sudo apt-get install \
apt-transport-https \
ca-certificates \
curl \
gnupg \
lsb-release`

`curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg`

`echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`

Intall:

`sudo apt-get update`

`sudo apt-get install docker-ce docker-ce-cli containerd.io`

Test the docker image:

`sudo docker run hello-world`

### 4.1 Setup Docker 2.0 / Cuda 11.2
[https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker)

`curl https://get.docker.com | sh   && sudo systemctl --now enable docker`

`distribution=$(. /etc/os-release;echo $ID$VERSION_ID)    && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -    && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list`

`sudo apt-get update`

`sudo apt-get install -y nvidia-docker2`

`sudo systemctl restart docker`

`sudo docker run --rm --gpus all nvidia/cuda:11.0-base nvidia-smi`

```+-----------------------------------------------------------------------------+

| NVIDIA-SMI 460.91.03    Driver Version: 460.91.03    CUDA Version: 11.2     |

|-------------------------------+----------------------+----------------------+

| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |

| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |

|                               |                      |               MIG M. |

|===============================+======================+======================|

|   0  Quadro M2000M       Off  | 00000000:01:00.0  On |                  N/A |

| N/A   44C    P5    N/A /  N/A |    382MiB /  4043MiB |     34%      Default |

|                               |                      |                  N/A |

+-------------------------------+----------------------+----------------------+

                                                                               
+-----------------------------------------------------------------------------+

| Processes:                                                                  |

|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |

|        ID   ID                                                   Usage      |

|=============================================================================|

+-----------------------------------------------------------------------------+
```
`sudo usermod -aG docker jan` 

`nvidia-docker run --rm nvidia/cuda nvidia-smi`

`nvidia-docker run --rm nvidia/cuda:10.0-base nvidia-smi.`


`git submodule update --init --recursive`

### 5. Configure where your data is
Add to `docker_run_config.yaml`
```
jan-ThinkPad-P50:
  jan:
    path_to_data_directory: '/home/jan/pytorch-dense-correspondence/'
```
### 6. Build the docker image
Set secific versions to `install_dependencies.sh`
```
...
pip install \
  jupyter \
  opencv-python==4.1.0.25 \
  plyfile \
  pandas \
  tensorflow \
  future \
  typing \
  qtconsole==4.5.3 \
  nbconvert==5.4.0 \
  jsonschema==2.6.0
```
### 7.1 Build the docker image
```  
cd docker
./docker_build.py
```
Probleme noch mit `install_pytorch.sh`, diese Datei wird nicht installiert.
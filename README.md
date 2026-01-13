## Links

### Weights : https://drive.google.com/file/d/1ZfHF4Y-j6zA65V7YsDcRaiAaWsUIkIcV/view?usp=drive_link
### Pretrained : https://drive.google.com/file/d/1OBUZyfDwl-IC7wFwqPICjki-_XSU2GUT/view?usp=drive_link
### Dataset : https://drive.google.com/file/d/1QMWnfJsZEHM0qibOexPPxAV95jcfBpaE/view?usp=drive_link

#### Notice : Not really Celeb-DF-v1, Just Preprocessed AIHUB Deepfake manipulated Dataset by this tool's preprocess module
### Raw Dataset : https://aihub.or.kr/aihubdata/data/view.do?dataSetSn=55

```
weights : root/training/weights
pretrained : root/training/pretrained
dataset : root/datasets
```

## Structure of Preprocessed Dataset

```
# This image dataset is preprocessed by root/preprocessing/preprocess.py
# .mp4 -> .png
# added landmarks with filed numpy array

── Celeb-DF-v1
| ├── Celeb-real                # Korean's face Image dataset's labelled with raw                
| │ ├── frames
| │ │ ├── uuid_directories …
| │ │ │ └── *.png
| │ ├── landmarks
| │ │ ├── uuid_directories …
| │ │ │ └── *.npy
| │ │ └── 
| ├── Celeb-synthesis           # Korean's Image dataset's labelled with fake  
| │ ├── frames
| │ │ ├── uuid_directories …
| │ │ │ └── *.png
| │ ├── landmarks
| │ │ ├── uuid_directories …
| │ │ │ └── *.npy
| │ │ └──
| ├── Youtube-real              # Korean's Image dataset's labelled with true (which assumed to youtube source)  
| │ ├── frames
| │ │ ├── uuid_directories …
| │ │ │ └── *.png
| │ ├── landmarks
| │ │ ├── uuid_directories …
| │ │ │ └── *.npy
| │ │ └──
```

## Settings

### Requirements

- Python 3.7.12
- Docker Desktop (up to Engine Version 19.03.14) : https://docs.docker.com -> Get Docker
- 4GB + RAM
----

## 1. Install and build Dockerfile

```bash
# 1. clone repository
git clone https://github.com/IIVRIICOLKM/DeepfakeBench
cd DeepfakeBench

# 2. Build Dockerfile
docker build -t deepfakebench .

# 3. If, install finished, Run Container with this command
docker run --gpus all -itd --name con1 -p 8888:8888 --volume="$(pwd)"/:/deep_main --shm-size 64G deepfakebench
docker exec -it con1 bash
```

## 2. Install required packages
```bash
# Required Packages
pip install albumentations==1.1.0
pip install lmdb==1.7.3
```

## 3. Install jupyter notebook and Set Jupyter environment

```bash
# 1. Install jupyter notebook with pip
pip install jupyter notebook

# 2. Create General Config
jupyter notebook --generate-config -y

# 3. Run jupyter notebook
jupyter notebook --ip 0.0.0.0 --allow-root

# url : http://localhost:8888/?token=<your_access_token>
# initial_password : your_access_token
```

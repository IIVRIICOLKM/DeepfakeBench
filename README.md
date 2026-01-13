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
- Docker Desktop (up to Engine Version 19.03.14)
- 4GB + RAM
----

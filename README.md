### Apache Zeppelin Data Science and Machine Learning Essentials  

Script: `zeppelin.sh`  
* compiles a Docker image first time it's ran;  
* starts the image and listens port `8080` on `localhost` (open in browser [http://localhost:8080/](http://localhost:8080/));  
* use `Ctrl+C` to stop the notebook Docker image.  

or simply pull:  
```console
docker pull mxbnai/zeppelin
```

#### Requirements
- [Docker](https://download.docker.com/)

See Apache Zeppelin [documentation](https://zeppelin.apache.org/docs/0.8.2/) for more information.  

___


The Docker image includes Apache Zeppelin Data Science and Machine Learning Essentials:  
* Standard Apache Zeppelin interpreters
* Python 3.7 with:
    * numpy  
    * scipy  
    * pandas  
    * matplotlib  
    * tensorflow  
    * xgboost  
    * sklearn  

___

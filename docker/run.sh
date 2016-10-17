#!/bin/bash
sudo docker run -it --name c-nodejs-osf-webapp-template -p 3000:3000 -v ~/develop/osf-webapp-template:/opt/osf-webapp-template -d openstate/nodejs-osf-webapp-template

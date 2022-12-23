#!/bin/bash
git clone https://github.com/Szupee/fileread.git
sudo apt-get update -y &&
sudo apt-get install -y 
sudo apt install python3-pip -y
sudo pip3 install flask 
sudo pip3 install flask_wtf 
sudo pip3 install wtforms 
sudo pip3 install azure-storage-blob 
sudo pip3 install azure-storage-queue
cd fileread/python
sudo python3 webapp1.py

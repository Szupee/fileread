#!/bin/bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
git clone https://github.com/Szupee/fileread.git
sudo apt-get update -y &&
sudo apt-get install -y 
sudo apt install python3-pip -y
sudo pip3 install azure-storage-blob 
sudo pip3 install azure-storage-queue
sudo apt-get install -y python3-pyodbc
sudo apt install python3-pandas -y
sudo pip3 install azure-storage-blob
sudo apt install odbcinst -y
cd fileread/python
sudo python3 processfile.py


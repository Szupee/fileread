#!/bin/bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
git clone https://github.com/Szupee/fileread.git
curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
curl https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/prod.list > /etc/apt/sources.list.d/mssql-release.list
sudo apt install python3-pip -y
sudo pip3 install --upgrade pip
sudo pip3 install azure-storage-blob 
sudo pip3 install azure-storage-queue
sudo pip3 install azure-identity
sudo pip3 install azure-keyvault-secrets
sudo apt-get install -y python3-pyodbc
sudo apt install python3-pandas -y
sudo apt install odbcinst -y
sudo ACCEPT_EULA=Y apt-get install -y msodbcsql17
sudo ACCEPT_EULA=Y apt-get install -y mssql-tools
echo 'export PATH="$PATH:/opt/mssql-tools/bin"' >> ~/.bashrc
source ~/.bashrc
sudo apt-get install -y unixodbc-dev
cd fileread/python
sudo python3 createsql.py
sudo python3 processfile.py


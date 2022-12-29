FROM ubuntu



RUN apt-get update
RUN apt-get -y install curl
RUN apt-get -y install sudo 
RUN sudo apt install python3-pip -y
RUN sudo pip3 install --upgrade pip
RUN apt-get -y install git
RUN sudo pip3 install flask 
RUN sudo pip3 install flask_wtf 
RUN sudo pip3 install wtforms 
RUN sudo pip3 install azure-storage-blob 
RUN sudo pip3 install azure-storage-queue
RUN sudo pip3 install azure-identity
RUN sudo pip3 install azure-keyvault-secrets
RUN git clone https://github.com/Szupee/fileread.git
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
RUN az login --service-principal -u 956809a2-cac8-4d8d-a8ca-c074caf27408 -p p2Z8Q~5b9-yBdzForAGYI7QeEriBvu7EEzKTwb04 --tenant 464861ad-ba54-4af4-9caa-3e7502ae62de



CMD ["python3", "fileread/python/webapp1.py"]
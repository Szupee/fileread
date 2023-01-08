!!!!THE APPLICATION IS NOT BULLETPROF THE PURPOSE OF THIS APP IS IMPLEMENTING INFRASTUCRE AND FOCUSEING ON CICD AND LEVRAGE AZURE SERVECIES!!!!

Fileread

Every login details kept in Azure Key vault. Instance can connect to either managed identity or Service principal.

Webapp which is running on python flask.
The app accepts a file and save it in container and create a queue message in Azure storage Queue.

The backend python app is checking the queue and if there is message download the data from storage account and upload it to the SQL server.

If the upload succesful the message delete from the queue.


The application can be deployed in multiple way,

Frontend and backend:
-Using terraform which sets up a Linux VM and start the app once it's ready output the public IP.
-Github action can create a container file and upload it to the Azure Container registry and automatically deploy it to container instance.

Only Backend:
-Can be deployed to kubernetes using the YAML files.

SQL
-Use the terraform to set up the environment and with Github action we can create the table in the database.
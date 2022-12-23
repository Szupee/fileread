from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient

credential = DefaultAzureCredential()


client = SecretClient(
    vault_url="https://azszupee05.vault.azure.net/",
    credential=credential
)
secret = client.get_secret("secret2")

server = client.get_secret("sqlservername") + "database.windows.net"
database = client.get_secret("database") 
username = client.get_secret("DBlogin")
password = client.get_secret("dbpw")

account_name = client.get_secret("storageaccount")
account_key = client.get_secret("accountkey")
container= client.get_secret("container")
blobsc = client.get_secret("blobsc")

filelocation = ''
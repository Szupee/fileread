from azure.identity import DefaultAzureCredential
from azure.keyvault.secrets import SecretClient

credential = DefaultAzureCredential()


client = SecretClient(
    vault_url="https://azszupee05.vault.azure.net/",
    credential=credential
)


server = client.get_secret("sqlservername").value + "database.windows.net"
database = client.get_secret("database").value
username = client.get_secret("DBlogin").value
password = client.get_secret("dbpw").value

account_name = client.get_secret("storageaccount").value
account_key = client.get_secret("accountkey").value
container= client.get_secret("container").value
blobsc = client.get_secret("blobsc").value
connectionstringblob = client.get_secret("connectionstring").value

filelocation = ''
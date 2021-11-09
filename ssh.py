###### Use paramiko to connect to LINUX platform############
import paramiko

ip = input("Enter an IP address: ")
port = input("Enter a port: ")
username = input("Enter a username: ")
password = input("Enter a password: ")
ssh = paramiko.SSHClient()
ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
ssh.connect(ip,port,username,password)

print("\n--------Connection Established-----------------------------\n")

######To run shell commands on remote connection###########

cmd = "ls"

while(cmd != "quit"):
    cmd = input("Enter a command: ")

    stdin,stdout,stderr = ssh.exec_command(cmd)
    outlines = stdout.readlines()
    resp = ''.join(outlines)
    print(resp) # Output 
    print("===================================\n")
ssh.close()

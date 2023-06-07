# wireguard docker

## Before installation
You from inside the file
```.env```
> You can change the value of variables
```env
FILELOCATION= project path 
SERVERURL= domain or server address
CONTAINERNAME= container name
SERVERPORT= container and internet port
USERPEERS= number of users or names of users
DNS = dns address
INTERNAL_SUBNET= IP value and subnet
```
- For example, if<br>
```USERPEERS=3```<br>
- Suppose you have only three users <br>
Or you can use it like this <br>
``` USERPEERS=sam,josh ``` <br>
Now you have two users with different names<br> 
## install
For Docker, just upload the install folder to your server and then execute the following command in the entered folder 
```bash
bash install.sh
``` 
To install to ubutnu systems if you have Docker, use the following code 
```bash
bash install-on-ubuntu.sh
```
And use this code to install in cnetos systems  
```bash
bash install-on-centos.sh
```  
## use
After installation, the .env file is transferred to the project path  
After installation, enter the project path, which is the default address below  
```bash
cd /docker/wireguard
``` 
Then by running the command
```bash
bash run.sh
``` 
You have stopped and restarted the project once, do this every time after changing the .env file

by command
```bash
bsah stop.sh
``` 
Also, the container is turned off

And by command 
```bash
bash update.sh
``` 
The program will be updated to the latest version

All user files in the path where you placed the files in the folder 
config 
will come 
# get connection 
To see the qr code of each user, type the following command 
```bash
docker exec -it wireguard /app/show-peer 1
``` 
Instead of one, you can write the code of each user or the name of the users
Attention, if you change the ```CONTAINERNAME``` in the above command, replace the word wireguard with the name you gave

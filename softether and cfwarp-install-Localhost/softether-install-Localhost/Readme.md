## softehter installer on ubuntu

- one command installer
``` bash
git clone https://github.com/samsesh/softether-install && cd softether-install &&  bash install.sh
```
- install use tmux on one command 
``` bash
tmux -s softetherInstaller "git clone https://github.com/samsesh/softether-install && cd softether-install &&  bash install.sh"
```
>  It is better to use tmux so that if the ssh connection with the server is interrupted, the command will not be broken, If the connection is interrupted, you can return to the installation page with the following command after connecting to the server
```bash
tmux a -d -t softether
```
## cfwarp
- We use cfwarp so that we are inside the cloudflare network and the IP address of the server is not leaked and remains clean.
- To use it, just do the following
1. clone project :
``` bash 
git clone https://github.com/samsesh/softether-install.git
```
2. Go to the project directory :
``` bash 
cd softether-install
```
3. run cfwarp.sh 
``` bash
bash cfwarp.sh 
```
> Note: This feature is not recommended for more than 10-20 users and it causes a decrease in speed - [cfwarp repository link](https://gitlab.com/rwkgyg/CFwarp/)

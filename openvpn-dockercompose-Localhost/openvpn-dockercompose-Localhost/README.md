# OpenVPN docker compose
clone this project and go to directory
```bash
git clone https://github.com/samsesh/openvpn-dockercompose.git
cd openvpn-dockercompose
```
run setup for Initialize the configuration files and set port and porotcol 

```bash
bash fisrtconf.sh
```
and certificates
```bash
docker compose run --rm openvpn ovpn_initpki
```
* Start OpenVPN server process

```bash
docker compose up -d openvpn
```

* You can access the container logs with

```bash
docker compose logs -f
```

* Generate a client certificate for testUserName

```bash
# with a passphrase (recommended)
docker compose run --rm openvpn easyrsa build-client-full testUserName
# without a passphrase (not recommended)
docker compose run --rm openvpn easyrsa build-client-full testUserName nopass
```

* Retrieve the client configuration with embedded certificates

```bash
docker compose run --rm openvpn ovpn_getclient testUserName > testUserName.ovpn
```

* Revoke a client certificate

```bash
# Keep the corresponding crt, key and req files.
docker compose run --rm openvpn ovpn_revokeclient testUserName
# Remove the corresponding crt, key and req files.
docker compose run --rm openvpn ovpn_revokeclient testUserName remove
```

## Debugging Tips

* Create an environment variable with the name DEBUG and value of 1 to enable debug output (using "docker -e").

```bash
docker compose run -e DEBUG=1 openvpn
```

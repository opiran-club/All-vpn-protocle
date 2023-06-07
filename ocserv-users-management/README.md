Ocserv with User Management dashboard

copy and paste it with root previllage

```bash
wget -4 https://github.com/opiran-club/All-vpn-protocle/ocserv-users-management && cd ocserv-users-management && chmod +x install.sh && bash install.sh
```

login panel: 

   - username : admin
   - password : admin
    
to sync db with ocpasswd file in pannel:
```   
chmod +x /etc/ocserv/ocpasswd 
```  
to deactive expire users add this line to crontab :
```    
1 0 * * *  /var/www/html/ocserv_pannel/venv/bin/python3 /var/www/html/ocserv_pannel/./manage.py deactive_account
```


optional:
 - use google reCAPTCHA for login page:
```
nano /var/www/html/ocserv_pannel/ocserv/settings.py 
```
add your key instead of  'None' :
```
GOOGLE_CAPTCHA_SITE_KEY = None
GOOGLE_CAPTCHA_SECRET_KEY = None
```

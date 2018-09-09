@echo off
docker run -it -v %CD%:/export frapsoft/openssl req -newkey rsa:2048 -nodes -keyout /export/privateKey.pem -x509 -days 365 -out /export/public-key-certificate.cer
docker run -it -v %CD%:/export frapsoft/openssl pkcs12 -export -in /export/public-key-certificate.cer -inkey /export/privateKey.pem -out /export/private-key-certificate.pfx 
erase privateKey.pem
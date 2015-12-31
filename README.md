# docker-exo
This is docker image for eXo Platform 4.3 with LDAP support.

## Depends on:
 * MySQL: [mysql/mysql-server:latest]
 * MySQL Data: [teknologist/mysql-docker-data]
 * eXo Data: [teknologist/exo-data]

## Configuration
 * MySQL Configuration
  * eXo Database: exo
  * eXo User: exo
  * eXo Password: changeme
  * Root Password: changeme 
 * LDAP Configuration
  * LDAP_DNS: DC=example,DC=com,DC=mo
  * LDAP_HOST: dc.example.com.mo
  * LDAP_PORT: 268
  * LDAP_ACCOUNT: ldap
  * LDAP_PASSWORD: changeme  

## Usage
```
  docker-compose build
  docker-copose up -d
  
```

# Ansible Role: onet.certificat-generate


## Actions:

Actions performed by this role


#### Stat:
* Teste si la clé privée existe déjà. 
* Teste si la requête de certification existe déjà. 
* Teste si le certificat existe déjà. 
#### Openssl_privatekey:
* Generate an OpenSSL private key. 
#### Openssl_csr:
* Generate an OpenSSL Certificate Signing Request. 

## Tags:
## Variables:

* `key_name`: `{{ ansible_facts.ansible_hostname }}.pem` - Nom de la clé privée.



* `crt_name`: `{{ ansible_facts.ansible_hostname }}.crt` - Nom du certificat.




Documentation generated using: [Ansible-autodoc](https://github.com/AndresBott/ansible-autodoc)


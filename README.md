# awx-test

Test d'utilisation d'AWX : Génération d'un certificat via AWX.

## Badges

![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Fedora](https://img.shields.io/badge/Fedora-294172?style=for-the-badge&logo=fedora&logoColor=white)

## Installation

Pour l'installation, il faut récupérer les sources de Gitlab, créer les fichiers `.env.local` et `.env.secrets` et générer l'environnement virtuel :
(penser à mettre un token valide pour se connecter au Vault : `VAULT_TOKEN`)
Les variables `inv_vault_engine` et `inv_repository_url` sont désormais dans l'inventory pour AWX ou dans `group_vars\all\all.yml`.

```bash
git clone git@gitlab.com:darth-ansible/awx-test.git

cat << EOF > .env.local
export VAULT_ADDR="https://isi-forge.vault.siege.grouponet.com"
export VAULT_SKIP_VERIFY="false"
EOF

cat << EOF > .env.local
export VAULT_ADDR="https://magneto:8200"
export VAULT_SKIP_VERIFY="false"
EOF

cat << EOF > .env.secrets
export VAULT_TOKEN="<token>"
EOF

direnv allow .
make env

ansible-playbook playbooks/test_new.yml -k -K
```

## Vérifications

Connexion à la machine cible via `ssh` :

```bash
ssh-copy-id darthols@rincevent
```

```bash
ssh -F ssh.cfg rincevent
```

Vérifie que la configuration Ansible pointe bien sur cet inventaire :

```bash
$ env | grep ANSIBLE_INVENTORY
ANSIBLE_INVENTORY=inventory
```

Vérifie que la configuration Ansible prend en compte le fichier de configuration `ssh` :

```bash
$ env | grep ANSIBLE_SSH_ARGS
ANSIBLE_SSH_ARGS=-F ssh.cfg
```

Ce `ping` Ansible permet de valider que la connexion SSH est valide et qu’il y a au moins une version de Python sur le serveur auquel on se connecte :

```bash
ansible -m ping test_servers
```

Affiche les facts :

```bash
ansible -m setup test_servers
```

## Support

darthols <dartholco@gmail.com>

## Roadmap

n/a

## Authors and acknowledgment

darthols <dartholco@gmail.com> \
Merci à [WeScale.fr](https://training.wescale.fr/) pour le site [Ansible Ultimate Edition](https://ansible-ultimate-edition.readthedocs.io/en/latest/index.html) et en particulier à [Aurélien Maury](https://github.com/aurelienmaury) et [Gautier Loterman](https://github.com/gloterman) pour leur présentation lors du Devoxx 2022.\

## License

GPL-3.0-or-later

## Project status

In progress.

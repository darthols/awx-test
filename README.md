# awx-test

Test d'utilisation d'AWX.

## Getting started

To make it easy for you to get started with GitLab, here's a list of recommended next steps.

## Add your files

- [ ] [Create](https://docs.gitlab.com/ee/user/project/repository/web_editor.html#create-a-file) or [upload](https://docs.gitlab.com/ee/user/project/repository/web_editor.html#upload-a-file) files
- [ ] [Add files using the command line](https://docs.gitlab.com/ee/gitlab-basics/add-file.html#add-a-file-using-the-command-line) or push an existing Git repository with the following command:

``` bash
cd existing_repo
git remote add origin https://gitlab.com/darth-ansible/workstation.git
git branch -M main
git push -uf origin main
```

## Integrate with your tools

- [ ] [Set up project integrations](https://gitlab.com/darth-ansible/workstation/-/settings/integrations)

## Collaborate with your team

- [ ] [Invite team members and collaborators](https://docs.gitlab.com/ee/user/project/members/)
- [ ] [Create a new merge request](https://docs.gitlab.com/ee/user/project/merge_requests/creating_merge_requests.html)
- [ ] [Automatically close issues from merge requests](https://docs.gitlab.com/ee/user/project/issues/managing_issues.html#closing-issues-automatically)
- [ ] [Enable merge request approvals](https://docs.gitlab.com/ee/user/project/merge_requests/approvals/)
- [ ] [Automatically merge when pipeline succeeds](https://docs.gitlab.com/ee/user/project/merge_requests/merge_when_pipeline_succeeds.html)

## Test and Deploy

Use the built-in continuous integration in GitLab.

- [ ] [Get started with GitLab CI/CD](https://docs.gitlab.com/ee/ci/quick_start/index.html)
- [ ] [Analyze your code for known vulnerabilities with Static Application Security Testing(SAST)](https://docs.gitlab.com/ee/user/application_security/sast/)
- [ ] [Deploy to Kubernetes, Amazon EC2, or Amazon ECS using Auto Deploy](https://docs.gitlab.com/ee/topics/autodevops/requirements.html)
- [ ] [Use pull-based deployments for improved Kubernetes management](https://docs.gitlab.com/ee/user/clusters/agent/)
- [ ] [Set up protected environments](https://docs.gitlab.com/ee/ci/environments/protected_environments.html)

***

## Name

Test d'utilisation d'AWX.

## Description

Généraytion d'un certificat via AWX.

## Badges

![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Fedora](https://img.shields.io/badge/Fedora-294172?style=for-the-badge&logo=fedora&logoColor=white)

## Installation

```bash
git clone git@gitlab.com:darth-ansible/awx-test.git
direnv allow .
make env

ansible-playbook playbooks/test.yml -k -K
```

### Fichiers complémentaires (exemples de paramètres d'environnement)

- Fichier `.env.local`

```ini
export VAULT_ADDR="https://magneto:8200"
```

- Fichier `.env.secret`

```ini
export VAULT_TOKEN="s.123456789abcdefghijklmno"
```

## Vérifications

Connexion à la machine cible via `ssh` :

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
Thanks to [WeScale](https://www.wescale.fr/) for the ultimate site <https://ansible-ultimate-edition.readthedocs.io/en/latest/index.html>

## License

GPL-3.0-or-later

## Project status

In progress.

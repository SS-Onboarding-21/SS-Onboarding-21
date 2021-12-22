## Install Ansible
[[src](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-ubuntu-20-04-ru)]
```
sudo apt update
sudo apt install ansible

```
## Run Ansible playbook
```
git clone https://github.com/SS-Onboarding-21/SS-Onboarding-21.git
cd SS-Onboarding-21
git checkout SS-9-Kateryna-Ansible-for-Jenkins
ansible-playbook install-jenkins.yml

```
now, go to [jenkinslocalhost:8080](http://jenkinslocalhost:8080/)

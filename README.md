# Projet CV One Page - evOps Lab

## 1. Description du projet
Ce projet a pour objectif de mettre en place une **chaîne DevOps complète** pour déployer automatiquement un CV One Page (HTML5/CSS3) avec :
- Infrastructure as Code (Ansible, Terraform)
- CI/CD avec Jenkins
- Orchestration et GitOps (K3s + Argo CD)
- Monitoring (Grafana Cloud)
- Conteneurisation (Docker)

---

## 2. Structure du dépôt

cv-onepage/
├─ ansible/ # Playbooks et rôles Ansible pour installation et configuration
├─ docker/ # Dockerfile pour le CV
├─ jenkins/ # Jenkinsfile pour le pipeline CI/CD
├─ terraform/ # Scripts Terraform pour déployer le conteneur
├─ k8s/ # Manifests Kubernetes pour Argo CD
├─ grafana/ # Configuration Grafana Cloud / dashboards
├─ cv/ # Code source HTML/CSS du CV One Page
└─ README.md # Ce fichier explicatif

yaml
Copier le code

---

## 3. Prérequis

- VM Ubuntu Server 24.04 (`DEVOPS-LAB`)
- SSH configuré avec clé publique
- Accès à Docker Hub
- Compte Slack pour notifications (optionnel)
- Compte Grafana Cloud

---

## 4. Installation et configuration

### 4.1 Ansible

```bash
# Installer ansible
sudo apt update
sudo apt install ansible -y

# Vérifier la connexion
ansible -i ansible/inventory devops_lab -m ping

# Lancer le playbook pour installer Docker, Terraform et Jenkins
ansible-playbook -i ansible/inventory ansible/playbook.yml
4.2 Jenkins
Jenkinsfile se trouve dans jenkins/

Pipeline CI/CD :

Récupère le code du CV depuis GitHub

Génère l’image Docker

Push sur Docker Hub

Envoie notification Slack

4.3 Terraform
bash
Copier le code
cd terraform/
terraform init
terraform apply
Crée un conteneur Docker moncv sur DEVOPS-LAB

Expose le port 8585 pour accéder au CV

4.4 Kubernetes + Argo CD
Installer K3s (single node) sur DEVOPS-LAB

Déployer via Argo CD :

Deployment avec 2 replicas

Service NodePort

Tester accès au CV depuis navigateur

4.5 Grafana Cloud
Configurer dashboards pour surveiller :

VM DEVOPS-LAB

Instance Docker

Cluster K3s

Fournir captures écran et URL du dashboard

5. Commandes importantes
Lister containers Docker : docker ps

Vérifier pods Kubernetes : kubectl get pods -A

Vérifier Jenkins jobs : interface Jenkins

Vérifier état VM : top, htop

6. Captures d’écran et preuves
Ajouter ici des captures pour :

Pipeline Jenkins réussi

Container Docker accessible

CV déployé via Kubernetes

Dashboards Grafana Cloud

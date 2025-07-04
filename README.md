

# 3-Tier Deployment on Azure with Terraform + Ansible

![Architecture Diagram](./docs/architecture-diagram.png)
*Architecture 3-Tier : Frontend - Backend - Database*

---

## 🚀 Présentation

Ce projet déploie une infrastructure **3-tiers** complète sur **Microsoft Azure** en combinant :

* **Terraform** pour l’Infrastructure as Code (IaC) : provisionnement des VMs, réseaux, groupes de sécurité.
* **Ansible** pour la configuration et le déploiement applicatif sur chaque VM (Nginx, Spring Boot, MySQL).
* Une application **Meal Tracker** déployée sur cette infrastructure, avec :

  * Frontend Nginx qui sert une interface web Bootstrap moderne.
  * Backend Spring Boot pour la logique métier.
  * Base de données MySQL hébergée dans un réseau sécurisé.

---

## 📁 Structure du Projet

```plaintext
3-tier-deployment/
├── terraform/                     
├── ansible/                       
├── app/                           
├── docs/                         
│   ├── architecture-diagram.png  # Diagramme architecture 3-tier
│   ├── azure-resources.png       # Capture écran ressources Azure (VMs, réseaux, NSG)
│   └── meal-tracker/             # Screenshots site Meal Tracker
│       ├── meal-tracker-home.png
│       └── meal-tracker-add-meal.png
├── README.md                      
└── .gitignore                    
```

---

## 🖼️ Captures d’écran clés

| Description                              | Aperçu                                                          
| ---------------------------------------- | --------------------------------------------------------------- |
| **Architecture 3-Tier**                  | ![Architecture](./docs/architecture-diagram.png)                |
| **Ressources Azure déployées**           | ![Azure Resources](./docs/azure-resources.png)                  |
| **Site Meal Tracker - Accueil**          | ![Meal Tracker Home](./docs/meal-tracker/meal-tracker-home.png) |
| **Site Meal Tracker - Ajouter un repas** | ![Add Meal](./docs/meal-tracker/meal-tracker-add-meal.png)      |

---

## 🛠 Stack Technique

| Categorie          | Outils / Technologies             |
| ------------------ | --------------------------------- |
| Infrastructure IaC | Terraform (Azure Provider)        |
| Configuration      | Ansible (Playbooks + Roles)       |
| Serveurs           | Azure Virtual Machines            |
| Frontend Web       | Nginx + Bootstrap 5 + HTML5 + CSS |
| Backend            | Spring Boot (Java, app.jar)       |
| Base de données    | MySQL (installé via Ansible)      |

---

## ⚙️ Comment déployer ?

### 1. Provisionner l'infrastructure Azure avec Terraform

```bash
cd terraform
terraform init
terraform apply
./generate_inventory.sh > ../ansible/inventory.ini
```

### 2. Déployer et configurer les applications avec Ansible

```bash
cd ../ansible
ansible-playbook -i inventory.ini playbooks/db.yml
ansible-playbook -i inventory.ini playbooks/backend.yml
ansible-playbook -i inventory.ini playbooks/frontend.yml
```

### 3. Résultat

* Nginx sert la page web sur l’IP publique frontend
* Spring Boot tourne en backend, communiquant avec MySQL sécurisé
* Base de données accessible uniquement depuis backend

---

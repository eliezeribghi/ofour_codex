Créer un bon fichier `README.md` pour ton projet est essentiel pour aider les autres (et toi-même à l'avenir) à comprendre rapidement l'objectif, l'installation, et l'utilisation du projet. Voici un exemple de structure pour un fichier `README.md` adapté à ton projet Laravel et Svelte.

---

## **Ofour - Application de gestion de recettes**

### **Description**

Ofour est une application web de gestion de recettes qui permet aux utilisateurs de rechercher, afficher et gérer des recettes culinaires. Le projet est développé avec un backend en **Laravel** et un frontend en **Svelte**.

---

### **Table des matières**

1. [Technologies](#technologies)
2. [Prérequis](#prérequis)
3. [Installation](#installation)
4. [Configuration de la base de données](#configuration-de-la-base-de-données)
5. [Lancement du projet](#lancement-du-projet)
6. [Fonctionnalités](#fonctionnalités)
7. [API](#api)
8. [Contributions](#contributions)
9. [Contact](#contact)

---

### **Technologies**

- **Laravel 9.x** (Backend PHP Framework)
- **Svelte** (Frontend JavaScript Framework)
- **MySQL** (Base de données)
- **Sequel Ace** (Gestionnaire de base de données)
- **Thunder Client** (Client API pour tester les requêtes)

---

### **Prérequis**

- **PHP** >= 8.0
- **Node.js** >= 18
- **Composer** pour Laravel
- **MySQL** (ou MariaDB)
- **Sequel Ace** pour gérer ta base de données
- **Thunder Client** (ou Postman) pour tester l'API

---

### **Installation**

#### 1. Clone le dépôt

```bash
git clone https://github.com/root/ofour.git
cd ofour
```

#### 2. Backend (Laravel)

- Va dans le dossier `backend`.

```bash
cd backend
```

- Installe les dépendances Laravel via Composer.

```bash
composer install
```

#### 3. Frontend (Svelte)

- Va dans le dossier `frontend`.

```bash
cd ../frontend
```

- Installe les dépendances Node.js.

```bash
npm install
```

---

### **Configuration de la base de données**

1. Crée une base de données MySQL nommée `ofour` (ou selon ta configuration) via **Sequel Ace** ou un autre gestionnaire de base de données.

2. Modifie le fichier `.env` dans le dossier `backend` pour configurer l'accès à ta base de données :

```plaintext
DB_CONNECTION=mysql
DB_HOST=localhost
DB_PORT=3306
DB_DATABASE=ofour
DB_USERNAME=
DB_PASSWORD=MyP@ss11
```

3. Exécute les migrations Laravel pour créer les tables :

```bash
php artisan migrate
```

4. (Optionnel) Exécute les seeders si tu as des données de démarrage :

```bash
php artisan db:seed
```

---

### **Lancement du projet on local**

#### 1. Backend (Laravel)

- Va dans le dossier `backend`.

```bash
cd backend
```

- Lance le serveur Laravel.

```bash
php artisan serve
```

#### 2. Frontend (Svelte)

- Va dans le dossier `frontend`.

```bash
cd ../frontend
```

- Lance le serveur de développement Svelte.

```bash
npm run dev
```

- Accède à ton frontend via `http://localhost:5173` (ou un autre port si configuré différemment).

---

### **Fonctionnalités**

- Recherche de recettes par nom ou catégorie.
- Affichage des détails des recettes, y compris les ingrédients et les étapes de préparation.
- Système de catégories pour organiser les recettes.
- API REST pour interagir avec la base de données.

---

### **API**

L'application expose une API REST via Laravel pour interagir avec les recettes. Voici quelques exemples de routes :

- **GET /api/recettes** : Récupère toutes les recettes.
- **GET /api/recettes/{id}** : Récupère une recette spécifique par ID.


Pour tester ces routes, tu peux utiliser **Thunder Client** ou **Postman**.

---




### **Contributions**



---

### **Contact**

Si tu as des questions ou des suggestions, n'hésite pas à me contacter via [eliezer.ibghi@gmail.com](mailto:eliezer.ibghi@gmail.com).

---

### **Licences**


---


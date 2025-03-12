Voici une synthèse détaillée des commandes et étapes que nous avons réalisées pour déployer et configurer ta base de données MySQL dans Docker, afin de t'aider à reproduire l'ensemble du processus de manière claire et structurée.

### **Étape 1 : Création de l'image et configuration Docker**

1. **Définir le service MySQL dans `docker-compose.yml`**
   
   Nous avons créé une configuration de service pour MySQL avec Docker Compose. Ce fichier permet de spécifier les paramètres nécessaires pour le déploiement de la base de données.

   ```yaml
   db:
     image: mysql:8.0
     container_name: my-mysql
     restart: always
     environment:
       MYSQL_ROOT_PASSWORD: root
       MYSQL_DATABASE: ofour
       MYSQL_USER: appuser
       MYSQL_PASSWORD: apppassword
     ports:
       - "3306:3306"
     volumes:
       - mysql_data:/var/lib/mysql
       - ./bdd/init.sql:/docker-entrypoint-initdb.d/init.sql
     networks:
       - app_network
     command: --lower_case_table_names=2
     healthcheck:
       test: ["CMD", "mysqladmin", "ping", "--host=localhost", "--user=root", "--password=root"]
       interval: 30s
       timeout: 10s
       retries: 3
   ```

2. **Créer et démarrer le conteneur MySQL**
   
   Utilise la commande suivante pour démarrer ton conteneur MySQL en arrière-plan avec Docker Compose.

   ```bash
   docker-compose up -d db
   ```

   Cela démarrera uniquement le service `db` (MySQL) défini dans le fichier `docker-compose.yml`.

### **Étape 2 : Vérification de la base de données**

3. **Accéder au conteneur MySQL**
   
   Une fois le conteneur démarré, tu peux accéder à la ligne de commande MySQL à l'intérieur du conteneur avec la commande suivante :

   ```bash
   docker exec -it my-mysql mysql -u root -p
   ```

   Tu seras invité à entrer le mot de passe root (`root` dans ce cas).

4. **Vérifier les bases de données créées**
   
   Une fois dans MySQL, tu peux lister les bases de données avec :

   ```sql
   SHOW DATABASES;
   ```

   La base de données `ofour` doit être présente, ainsi que d'autres bases système (`mysql`, `information_schema`, etc.).

### **Étape 3 : Vérification des utilisateurs et des privilèges**

5. **Vérifier les utilisateurs MySQL**
   
   Pour lister les utilisateurs et leurs hôtes associés, tu peux exécuter cette commande dans MySQL :

   ```sql
   SELECT user, host FROM mysql.user;
   ```

   Cela te permettra de vérifier la présence des utilisateurs comme `appuser` et `root`, et de confirmer leurs hôtes (accès distant ou local).

6. **Vérifier les privilèges de `appuser`**
   
   Si tu rencontres des problèmes d'accès avec `appuser`, vérifie les privilèges attribués avec la commande suivante :

   ```sql
   SHOW GRANTS FOR 'appuser'@'%';
   ```

   Cette commande te permettra de voir les privilèges spécifiques de `appuser`.

7. **Accorder les privilèges nécessaires à `appuser`**
   
   Si `appuser` n'a pas les privilèges nécessaires pour interagir avec la base de données `ofour`, tu peux lui accorder tous les privilèges avec cette commande :

   ```sql
   GRANT ALL PRIVILEGES ON ofour.* TO 'appuser'@'%';
   FLUSH PRIVILEGES;
   ```

   Cela permet à `appuser` d'avoir tous les droits sur la base de données `ofour`.

### **Étape 4 : Vérification et utilisation du fichier SQL d'initialisation**

8. **Vérifier si le fichier `init.sql` a bien été monté**

   Nous avons vérifié que le fichier SQL d'initialisation a été correctement monté dans le conteneur en exécutant :

   ```bash
   docker exec -it my-mysql ls /docker-entrypoint-initdb.d/
   ```

   La sortie devrait inclure ton fichier `init.sql`, ce qui indique qu'il est bien pris en compte par MySQL lors de l'initialisation.

9. **Vérifier les tables créées dans la base `ofour`**

   Une fois dans MySQL, il est important de vérifier si les tables du fichier `init.sql` ont été créées. Pour cela, exécute :

   ```sql
   USE ofour;
   SHOW TABLES;
   ```

   Cela affichera toutes les tables présentes dans la base de données `ofour` après l'exécution du script SQL.

### **Étape 5 : Test de connexion à la base de données**

10. **Test de connexion à MySQL avec `appuser`**

    Une fois la configuration terminée, teste la connexion à la base de données en utilisant le compte `appuser`. Utilise cette commande :

    ```bash
    mysql -h localhost -P 3306 -u appuser -p
    ```

    Tu seras invité à entrer le mot de passe (`apppassword` dans ce cas). Cela te permettra de vérifier si l'utilisateur `appuser` peut bien se connecter à la base de données.

### **Étape 6 : Sécurisation et gestion des utilisateurs**

11. **Sécuriser l'accès à `root`**

    Si tu n'as pas besoin de l'utilisateur `root` accessible à distance, tu peux supprimer celui-ci en exécutant :

    ```sql
    DROP USER 'root'@'%';
    FLUSH PRIVILEGES;
    ```

    Cela supprimera l'utilisateur `root` qui peut se connecter depuis n'importe quel hôte, ce qui renforce la sécurité.

### **Étape 7 : Redémarrage du conteneur**

12. **Redémarrer le conteneur MySQL**

    Si tu as effectué des changements dans la configuration ou les utilisateurs, il est parfois nécessaire de redémarrer le conteneur pour que toutes les modifications prennent effet. Utilise cette commande pour redémarrer MySQL dans Docker :

    ```bash
    docker-compose restart my-mysql
    ```

---

### **Résumé des commandes principales :**

- **Démarrer MySQL avec Docker Compose** :
  ```bash
  docker-compose up -d db
  ```

- **Accéder à MySQL dans le conteneur** :
  ```bash
  docker exec -it my-mysql mysql -u root -p
  ```

- **Lister les bases de données** :
  ```sql
  SHOW DATABASES;
  ```

- **Lister les utilisateurs MySQL** :
  ```sql
  SELECT user, host FROM mysql.user;
  ```

- **Vérifier les privilèges de `appuser`** :
  ```sql
  SHOW GRANTS FOR 'appuser'@'%';
  ```

- **Accorder des privilèges à `appuser`** :
  ```sql
  GRANT ALL PRIVILEGES ON ofour.* TO 'appuser'@'%';
  FLUSH PRIVILEGES;
  ```

- **Vérifier les tables dans `ofour`** :
  ```sql
  USE ofour;
  SHOW TABLES;
  ```

- **Test de connexion avec `appuser`** :
  ```bash
  mysql -h localhost -P 3306 -u appuser -p
  ```

- **Redémarrer le conteneur** :
  ```bash
  docker-compose restart my-mysql
  ```

---

En suivant ces étapes, tu devrais être capable de déployer et configurer ta base de données MySQL dans un conteneur Docker, de gérer les utilisateurs et de vérifier que tout fonctionne correctement.

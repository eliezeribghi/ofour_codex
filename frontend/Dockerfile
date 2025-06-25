# Étape 1 : Construction du frontend
FROM node:23-alpine

WORKDIR /app

# Copier les fichiers package.json et package-lock.json
COPY package*.json ./

RUN npm install

# Copier tout le code source
COPY . .

# (Optionnel) Build pour la prod
RUN npm run build

EXPOSE 5173

# Pour le dev
CMD ["npm", "run", "dev"]
# Pour la prod (remplacer la ligne précédente)
# CMD ["npm", "run", "preview"]

# Étape 2 : Serveur Nginx pour servir les fichiers statiques
#FROM nginx:alpine

# Copier les fichiers générés par le build dans le dossier de Nginx
#COPY --from=build /app/dist /usr/share/nginx/html/

# Copier la configuration Nginx
# COPY ../nginx/nginx.conf /etc/nginx/conf.d/default.conf

# # Créer le dossier pour les certificats SSL et copier les fichiers
# RUN mkdir -p /etc/nginx/ssl
# COPY ../nginx/ssl/fullchain.pem /etc/nginx/ssl/fullchain.pem
# COPY ../nginx/ssl/privkey.pem /etc/nginx/ssl/privkey.pem




# # Remplacer la variable ${PORT} par 80 si aucune valeur n'est définie
# RUN sed -i 's/\${PORT}/80/g' /etc/nginx/conf.d/default.conf

# # Exposer les ports 80 et 443
# EXPOSE 80 443

# # Lancer Nginx
# CMD ["nginx", "-g", "daemon off;"]

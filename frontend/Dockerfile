# Étape 1 : Construction du frontend
FROM node:23-alpine AS build

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers package.json et package-lock.json
COPY package*.json  .

# Installer les dépendances
RUN npm install

# Copier le code source du frontend
COPY . .


# Construire l'application
RUN npm run build




# Final stage for serving the app with NGINX
FROM nginx:alpine

# Copy built frontend files from the build stage to NGINX
COPY --from=build /app/dist /usr/share/nginx/html

# Copy custom NGINX configuration (optional)
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

# Expose HTTP port
EXPOSE 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]




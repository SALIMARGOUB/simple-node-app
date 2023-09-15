# Utilisez une image Node.js officielle
FROM node:14

# Définir le répertoire de travail
WORKDIR /usr/src/app

# Copiez le fichier package.json et package-lock.json
COPY package*.json ./

# Installez les dépendances de l'application
RUN npm install

# Copiez le reste de l'application
COPY . .

# Exposez le port sur lequel l'application sera accessible
EXPOSE 3000

# Démarrez l'application
CMD ["node", "app.js"]

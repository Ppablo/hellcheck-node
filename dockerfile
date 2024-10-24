FROM node:18-alpine

# Instalar curl para el healthcheck
RUN apk add --no-cache curl

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar los archivos package.json y package-lock.json primero
COPY package*.json ./

# Instalar las dependencias
RUN npm install

# Copiar todo el resto del proyecto al contenedor
COPY . .

# Exponer el puerto en el que la aplicación escucha
EXPOSE 3000

# Comando por defecto para iniciar la aplicación
CMD ["npm", "start"]
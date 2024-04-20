# Use Node.js image with Alpine Linux
# Use Node.js image with Alpine Linux
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Install PM2 globally
RUN npm install -g pm2

# Copy the contents of the server directory to the working directory
COPY server ./server

# Expose the port where the app will run
EXPOSE 5000

# Command to run the application with PM2 in watch mode
CMD ["pm2-runtime", "server.js", "--watch"]

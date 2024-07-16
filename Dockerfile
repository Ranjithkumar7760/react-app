# Use an official Node runtime as a parent image
FROM node:14-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json /app/package.json
RUN npm install

# Copy the rest of the application
COPY . /app

# Build the app
RUN npm run build

# Install serve to serve the build
RUN npm install -g serve

# Set the command to start the app
CMD ["serve", "-s", "build"]

# Expose the port the app runs on
EXPOSE 5000

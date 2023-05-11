#Telling Docker to use the the node:17-alpine image as the base image
FROM node:17-alpine

# Layer 2: Telling Docker to create a directory called `/usr/src/app` in the container and set it as the working directory.
WORKDIR /usr/src/app

# Layer 3: Copying the package.json file from the root of the project to the `app` directory in the container.
COPY ./package.json ./
COPY ./package-lock.json ./

# Layer 4: Installing the dependencies listed in the package.json file.
RUN npm i --force

# Layer 5: Copying all the files from the root of the project to the `app` directory in the container.
COPY . .

# Layer 6: Telling Docker that the container will listen on port 3000.
EXPOSE 3000

# Layer 7: Telling Docker to run the `npm start` command when the container is started. \
CMD [ "npm", "start" ]
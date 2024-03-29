# base image
FROM node:12.2.0

# install chrome for protractor tests
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
RUN apt-get update && apt-get install -yq google-chrome-stable

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json
# install Angular first
RUN npm install -g @angular/cli@8.3.6
# proceed with installing Ionic globally
RUN npm install -g ionic
# then install contents of package.json
RUN npm install

# Copy the app folder to /app on the container
COPY . /app

# Below is the full command for the alias 'ionic serve'
# Port 8100 is mapped to 8101 based on the docker-compose.yml
CMD ng run app:serve --host=0.0.0.0 --port=8100

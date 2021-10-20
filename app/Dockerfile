FROM node:10

ENV SECRET_WORD=TwelveFactor

# Create app directory
WORKDIR /var/app

# Install app dependencies
COPY package*.json ./

RUN npm install

# copy app source
COPY . .

EXPOSE 3000
CMD [ "npm", "start" ]

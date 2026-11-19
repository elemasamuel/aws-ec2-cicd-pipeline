FROM node:18-alpine

WORKDIR /usr/app

# Copy dependency manifests first so the npm install layer is cached
# and only re-runs when dependencies change
COPY app/package.json /usr/app/
RUN npm install

COPY app/images/* /usr/app/images/
COPY app/index.html /usr/app/
COPY app/server*.js /usr/app/

EXPOSE 3000

CMD ["node", "server.js"]

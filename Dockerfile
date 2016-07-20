FROM node:5.8.0-wheezy
RUN npm install -g cloudflare-cli
ENTRYPOINT ["cfcli"]

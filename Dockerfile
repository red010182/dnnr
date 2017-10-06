FROM node:alpine

# user: "node"
#     working_dir: /home/node/app
#     environment:
#       - NODE_ENV=production
#     volumes:
#       - ./app:/home/node/app/:rw
#       - ./log/node/:/home/node/.forever/:rw
#     expose:
#       - "3000"
#     # command: 'forever s tart --uid app -a -c "npm start" /home/node/app/'
#     command: 'npm start'

USER node
WORKDIR /home/node/app
ENV NODE_ENV production
VOLUME [ "./app:/home/node/app/:rw" ]
EXPOSE 3000


RUN apk add --no-cache libc6-compat
RUN npm install -g pm2
RUN npm install -g mocha

# CMD forever start --uid app -a -c "npm start" /home/node/app/
# ENTRYPOINT forever start --uid app -a -c "npm start" /home/node/app/
CMD pm2 start npm --start
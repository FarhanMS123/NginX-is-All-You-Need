FROM nginx:1.25.0-alpine3.17

RUN apk add nodejs-current npm

EXPOSE 13485

CMD ["npm", "start"]
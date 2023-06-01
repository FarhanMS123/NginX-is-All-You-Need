FROM nginx:1.25.0-alpine3.17

RUN apk add nodejs-current npm

# ENV port=13485

EXPOSE ${port}

CMD ["npm", "start"]
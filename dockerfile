FROM nginx:1.25.0-alpine3.17

RUN apk add nodejs-current npm make

RUN node -v
RUN npm -v

WORKDIR /app
COPY . .
RUN npm ci

ENV PORT=13485

EXPOSE ${PORT}

# CMD ["make", "test"]

CMD ["npm", "start"]
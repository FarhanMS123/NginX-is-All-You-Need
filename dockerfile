FROM nginx:1.25.0-alpine3.17

RUN apk add nodejs-current npm make screen

WORKDIR /app
COPY . .
COPY ./nginx/*.conf /etc/nginx/conf.d

RUN cat /etc/nginx/conf.d/nginx.conf >> /etc/nginx/nginx.conf
RUN rm -f /etc/nginx/conf.d/nginx.conf
# RUN nginx -s reload

RUN node -v
RUN npm -v
RUN npm ci

ENV PORT=13485

EXPOSE 80 ${PORT}

# CMD ["make", "test"]
# CMD ["npm", "start"]
CMD ["make", "start"]
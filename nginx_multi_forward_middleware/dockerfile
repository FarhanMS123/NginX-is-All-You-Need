# https://docs.nginx.com/nginx/admin-guide/installing-nginx/installing-nginx-docker/#running-nginx-plus-in-a-docker-container
# https://docs.nginx.com/nginx/admin-guide/dynamic-modules/nginscript/
# https://docs.nginx.com/nginx/admin-guide/dynamic-modules/lua/
# https://nginx.org/en/linux_packages.html#Alpine
# https://superuser.com/questions/246837/how-do-i-add-text-to-the-beginning-of-a-file-in-bash
# https://openresty.org/en/linux-packages.html#alpine
# https://openresty.org/en/download.html#docker

# FROM nginx:1.25.0-alpine3.17
FROM openresty/openresty:1.21.4.1-7-alpine-fat

# RUN apk add nginx-plus-module-njs
# RUN apk add nginx-module-njs
# RUN apk add nginx-plus-module-lua
RUN apk add nodejs-current npm make screen

WORKDIR /app
COPY . .
COPY ./nginx /etc/nginx

RUN echo -e "include /etc/nginx/nginx_header.conf;\n$( cat /etc/nginx/nginx.conf )\n" > /etc/nginx/nginx.conf
RUN echo -e "include /etc/nginx/nginx_extends.conf;\n" >> /etc/nginx/nginx.conf
# RUN nginx -s reload

RUN node -v
RUN npm -v
RUN npm ci

ENV PORT=13485

EXPOSE 80 ${PORT}

# CMD ["make", "test"]
# CMD ["npm", "start"]
CMD ["make", "start"]
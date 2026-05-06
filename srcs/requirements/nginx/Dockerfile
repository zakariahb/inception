FROM alpine:3.22

RUN apk update && apk add nginx openssl

EXPOSE  443

CMD ["nginx", "-g" , "daemon off;"]
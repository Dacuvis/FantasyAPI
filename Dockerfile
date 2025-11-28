FROM alpine:latest

RUN apk update && apk add lua5.4 lua5.4-socket

WORKDIR /app

COPY src ./src

EXPOSE 3000

CMD ["lua5.4", "src/main.lua"]

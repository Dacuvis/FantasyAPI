FROM alpine:latest

RUN apk update && apk add lua5.4 lua5.4-socket wget

WORKDIR /app

# buat folder untuk lua modules
RUN mkdir -p /usr/local/share/lua/5.4

# download dkjson
RUN wget https://raw.githubusercontent.com/LuaDist/dkjson/master/dkjson.lua -O /usr/local/share/lua/5.4/dkjson.lua

# download json file kalau kamu perlu
# RUN wget https://raw.githubusercontent.com/.../c.json -O /app/c.json

CMD ["lua5.4", "main.lua"]

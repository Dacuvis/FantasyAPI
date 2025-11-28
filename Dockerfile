FROM alpine:latest

RUN apk update && apk add lua5.4 lua5.4-socket wget

WORKDIR /app

# buat folder untuk module luar
RUN mkdir -p /usr/local/share/lua/5.4

# download dkjson
RUN wget https://raw.githubusercontent.com/LuaDist/dkjson/master/dkjson.lua -O /usr/local/share/lua/5.4/dkjson.lua

COPY data/c.json /app/c.json

# copy main.lua ke dalam container
COPY src/main.lua /app/main.lua

CMD ["lua5.4", "main.lua"]

FROM alpine:latest

RUN apk update && apk add lua5.4 lua5.4-socket wget

WORKDIR /app

# download dkjson
RUN wget https://raw.githubusercontent.com/LuaDist/dkjson/master/dkjson.lua -O /usr/local/share/lua/5.4/dkjson.lua

# download JSON file
RUN mkdir -p src
RUN wget https://raw.githubusercontent.com/username/repo/main/c.json -O /app/src/c.json

COPY src ./src

EXPOSE 3000

CMD ["lua5.4", "src/main.lua"]

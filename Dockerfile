FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y lua5.4 luarocks curl && \
    luarocks install luasocket && \
    luarocks install dkjson

# Buat folder kerja
RUN mkdir -p /app
WORKDIR /app

# Copy file
COPY data/c.json /app/
COPY src/modules/Server.lua /app/

# Expose port Railway
EXPOSE 8080

# Jalankan server
CMD ["lua5.4", "Server.lua"]

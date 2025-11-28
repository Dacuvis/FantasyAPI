# Gunakan Ubuntu minimal
FROM ubuntu:22.04

# Install Lua & luarocks
RUN apt-get update && \
    apt-get install -y lua5.4 luarocks curl && \
    luarocks install luasocket && \
    luarocks install dkjson

# Copy project
COPY data/c.json /app
COPY src/modules/Server.lua /app
WORKDIR /app

# Expose port yang Railway pakai
EXPOSE 8080

# Jalankan server.lua
CMD ["lua5.4", "Server.lua"]

math.randomseed(os.time())
local http = require("socket.http")
local json = require("dkjson")

local url = "http://127.0.0.1:8080/"

local file = http.request(url)

if not file then
    print("Gagal mengambil data dari server!")
    return
end

local content,err = json.decode(file)

if not content then
    print("bukan file:",err)
    return
end

--you can add randomizer if you want 
--use while true if you want make a randomizer with math.random
--like math.random(1,#content.nick_npc)

--no random
local dataNick = content.nick_npc[1]
local dataItem = content.items[1]

--with random
local dataNick1 = content.nick_npc[math.random(1,#content.nick_npc)]
local dataItem1 = content.items[math.random(1,#content.items)]

--no randomizer
print(dataNick.nama)
print(dataItem.nama .. " | " .. "Grade:" .. dataItem.grade)

print("----------------------------")

--with randomizer
print(dataNick1.nama)
print(dataItem1.nama .. " | " .. "Grade:" .. dataItem1.grade)
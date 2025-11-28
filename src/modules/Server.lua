local socket = require("socket")
local json = require("dkjson")

local server = assert(socket.bind("127.0.0.1",8080))
print("server berjalan di http://127.0.0.1:8080")

local function read_data()
    local file,err = io.open("./data/c.json","r")
    if not file then
        print("File Gagal:",err)
        return
    end

    local reads = file:read("*a")
    file:close()
    
    return json.decode(reads)
end

while true do
    local client = server:accept()
    client:settimeout(1)

    local request = client:receive()
    print("req: ", request)

    local data = read_data()
    local body = json.encode(data,{intend=true})
    local response = table.concat({
        "HTTP/1.1 200 OK",
        "Content-Type: application/json",
        "Content-Length: " .. #body,
        "",
        body
    }, "\r\n")

    client:send(response)
    client:close()
end
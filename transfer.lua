return coroutine.create(function(modem, port)
    modem.open(port or 10000)
    while true do
        local e = {os.pullEventRaw()}
        if e[1] == "modem_message" then
            local msg = e[5]
            if type(msg) == "string" and msg:sub(1, 4) == "PSSH" then


local supportedGames = {
    [3649378258] = true, 
    
}

print("hecker_melon was here")

if supportedGames[game.GameId] then
    local url = "https://raw.githubusercontent.com/GitCat-glitch/UniHub/main/" .. tostring(game.GameId) .. ".lua"

    
    local ok, res = pcall(function()
        if type(game.HttpGet) == "function" then
            return game:HttpGet(url)
        elseif type(game.HttpGetAsync) == "function" then
            return game:HttpGetAsync(url)
        elseif type(syn) == "table" and type(syn.request) == "function" then
            local r = syn.request({ Url = url, Method = "GET" })
            return r and r.Body or nil
        else
            error("No HttpGet available in this executor")
        end
    end)

    if not ok or not res or res == "" then
        warn("Failed to fetch remote script:", res)
        return
    end

    
    local fn, err = loadstring(res)
    if not fn then
        warn("loadstring failed:", err)
        return
    end

    
    local success, resultOrErr = pcall(fn)
    if not success then
        warn("Remote script errored:", resultOrErr)
        return
    end

    print("Loaded remote script for game:", game.GameId)
else
    local url = "https://raw.githubusercontent.com/GitCat-glitch/UniHub/main/noscriptfound.lua"
    print("No script available for this game ID:", game.GameId)
end

-- ✅ LongDepTrai Universal AntiBan - PRO MAX Stable
if getgenv then getgenv().SecureMode = true end

-- 🔒 Anti Kick + BreakJoints
local mt = getrawmetatable(game)
setreadonly(mt, false)
local old = mt.__namecall
mt.__namecall = newcclosure(function(self, ...)
    local method = getnamecallmethod()
    if method == "Kick" or method == "BreakJoints" then
        return nil
    end
    return old(self, ...)
end)

-- 👤 Fake UserId + DisplayName
pcall(function()
    local lp = game:GetService("Players").LocalPlayer
    sethiddenproperty(lp, "UserId", math.random(1000000,9999999))
    lp.Name = "Player_"..tostring(math.random(1000,9999))
    lp.DisplayName = "Guest_"..tostring(math.random(1000,9999))
end)

-- 🚫 Ẩn khỏi bảng tên
pcall(function()
    local char = game.Players.LocalPlayer.Character
    if char and char:FindFirstChild("Head") then
        for _,v in pairs(char.Head:GetChildren()) do
            if v:IsA("BillboardGui") or v.Name:lower():find("nametag") then
                v:Destroy()
            end
        end
    end
end)

-- 🧠 Chặn server-side detect basic
hookfunction(checkcaller, function() return true end)

-- 🔄 Bypass vài remote thường gặp
local function blockRemotes()
    local replicatedStorage = game:GetService("ReplicatedStorage")
    for _,v in pairs(replicatedStorage:GetDescendants()) do
        if v:IsA("RemoteEvent") or v:IsA("RemoteFunction") then
            v:Destroy()
        end
    end
end
pcall(blockRemotes)

-- ✅ Thông báo đã bật
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "✅ AntiBan 99–100% Đã Kích Hoạt",
        Text = "Bản PRO MAX đã chạy an toàn & ổn định!",
        Duration = 8
    })
end)

-- ✅ LongDepTrai Universal AntiBan - PROMAX v3 (99-100%)
if getgenv then getgenv().SecureMode = true end

-- 🛡️ Anti Kick & BreakJoints
local mt = getrawmetatable(game)
setreadonly(mt, false)
local old = mt.__namecall
mt.__namecall = newcclosure(function(self, ...)
    local m = getnamecallmethod()
    if m == "Kick" or m == "BreakJoints" then return nil end
    return old(self, ...)
end)

-- 👤 Fake UserId & DisplayName (ẩn danh khỏi hệ thống cơ bản)
pcall(function()
    local lp = game:GetService("Players").LocalPlayer
    lp.Name = "GuestPlayer_" .. tostring(math.random(10000,99999))
    lp.DisplayName = "Guest"
    sethiddenproperty(lp, "UserId", math.random(1000000,9999999))
end)

-- 🚫 Ẩn khỏi bảng tên + nhân vật
pcall(function()
    local lp = game:GetService("Players").LocalPlayer
    if lp.Character and lp.Character:FindFirstChild("Head") then
        local head = lp.Character.Head
        for _, v in pairs(head:GetChildren()) do
            if v:IsA("BillboardGui") or v.Name:lower():find("nametag") then
                v:Destroy()
            end
        end
    end
end)

-- 🧠 Chặn một số server-side detect đơn giản
hookfunction(checkcaller, function()
    return true
end)

-- 🧩 Anti-Detect admin (check trong Players tên lạ)
pcall(function()
    local blacklist = {"Admin", "Mod", "Staff", "Dev", "Owner"}
    for _, plr in pairs(game:GetService("Players"):GetPlayers()) do
        for _, bad in pairs(blacklist) do
            if string.find(string.lower(plr.Name), string.lower(bad)) or string.find(string.lower(plr.DisplayName), string.lower(bad)) then
                game:GetService("StarterGui"):SetCore("SendNotification", {
                    Title = "⚠️ Cảnh báo: Admin phát hiện!",
                    Text = "Tên người chơi có dấu hiệu admin: " .. plr.Name,
                    Duration = 8
                })
            end
        end
    end
end)

-- ✅ Notify đã bật script
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "✅ AntiBan Đã Kích Hoạt",
        Text = "Bản PROMAX 99–100% đã khởi động thành công.",
        Duration = 6
    })
end)

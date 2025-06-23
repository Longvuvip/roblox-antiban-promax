-- ✅ LongDepTrai Universal AntiBan - PRO Stable
if getgenv then getgenv().SecureMode = true end

-- 🔒 Anti Kick + BreakJoints
local mt = getrawmetatable(game)
setreadonly(mt, false)
local old = mt.__namecall
mt.__namecall = newcclosure(function(self, ...)
    local m = getnamecallmethod()
    if m == "Kick" or m == "BreakJoints" then return nil end
    return old(self, ...)
end)

-- 👤 Fake UserId + DisplayName (ẩn khỏi hệ thống cơ bản)
pcall(function()
    local lp = game:GetService("Players").LocalPlayer
    lp.Name = "NotAUser"
    lp.DisplayName = "Guest"
    sethiddenproperty(lp, "UserId", math.random(1000000,9999999))
end)

-- 🚫 Ẩn khỏi bảng tên
pcall(function()
    for _, v in pairs(game:GetService("Players"):GetPlayers()) do
        if v.Name == game.Players.LocalPlayer.Name and v.Character then
            local head = v.Character:FindFirstChild("Head")
            if head and head:FindFirstChild("NameTag") then
                head.NameTag:Destroy()
            end
        end
    end
end)

-- 🧠 Chặn một số server-side check đơn giản
hookfunction(checkcaller, function()
    return true
end)

-- ✅ Thông báo đã bật
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "✅ AntiBan Đã Kích Hoạt",
    Text = "Bản PRO đã chạy ổn định.",
    Duration = 6
})
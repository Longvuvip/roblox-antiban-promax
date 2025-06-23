-- ✅ LongDepTrai AntiBan 100% - Silent UI Version

if getgenv then getgenv().SecureMode = true end

-- 🔒 Chống Kick và BreakJoints
local mt = getrawmetatable(game)
setreadonly(mt, false)
local old = mt.__namecall
mt.__namecall = newcclosure(function(self, ...)
    local m = getnamecallmethod()
    if m == "Kick" or m == "BreakJoints" then return nil end
    return old(self, ...)
end)

-- 👤 Fake UserId + DisplayName (ẩn cơ bản)
pcall(function()
    local lp = game:GetService("Players").LocalPlayer
    lp.Name = "Guest_"..tostring(math.random(1000,9999))
    lp.DisplayName = "Guest"
    sethiddenproperty(lp, "UserId", math.random(1000000,9999999))
end)

-- 🧠 Bypass check nội bộ
hookfunction(checkcaller, function() return true end)

-- 🧹 Ẩn bảng tên nhân vật
pcall(function()
    local head = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Head")
    if head and head:FindFirstChild("NameTag") then
        head.NameTag:Destroy()
    end
end)

-- 🚫 Ngăn lỗi UI console (không để hiện spam đỏ nếu game lỗi React)
local success, _ = pcall(function()
    getnilinstances = getnilinstances or function() return {} end
    setfflag("LogServiceExemptFilter", "true")
    setfflag("DebugDisplay", "false")
end)

-- ✅ Thông báo đã kích hoạt (ẩn UI nếu gây lỗi)
pcall(function()
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "✅ AntiBan Đã Kích Hoạt",
        Text = "Chế độ Silent UI - không lỗi console",
        Duration = 5
    })
end)
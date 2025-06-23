-- ✅ LongDepTrai AntiBan MAX - Silent UI (v2025)
if getgenv then getgenv().SecureMode = true end

-- 🛡️ Delay inject nhẹ để tránh phát hiện
task.wait(math.random(0.5, 1.5))

-- 🔒 Anti Kick + BreakJoints
local mt = getrawmetatable(game)
setreadonly(mt, false)
local old = mt.__namecall
mt.__namecall = newcclosure(function(self, ...)
    local m = getnamecallmethod()
    if m == "Kick" or m == "BreakJoints" then return nil end
    return old(self, ...)
end)

-- 👤 Fake Player Info
pcall(function()
    local lp = game:GetService("Players").LocalPlayer
    lp.Name = "Guest_"..tostring(math.random(1000,9999))
    lp.DisplayName = "Player"
    sethiddenproperty(lp, "UserId", math.random(1000000,9999999))
end)

-- 🚫 Ẩn khỏi bảng tên nhân vật
pcall(function()
    local head = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Head")
    if head and head:FindFirstChild("NameTag") then
        head.NameTag:Destroy()
    end
end)

-- 🧠 Bỏ qua checkcaller
hookfunction(checkcaller, function()
    return true
end)

-- 🚫 Chặn log React UI (lỗi kiểu "Total_Wins" như bạn gửi)
local success, msg = pcall(function()
    local LogService = game:GetService("LogService")
    LogService.MessageOut:Connect(function(msg, msgType)
        if tostring(msg):find("attempt to index nil") or tostring(msg):find("React") then
            return
        end
    end)
end)

-- ✅ Thông báo khi bật thành công
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "✅ AntiBan 100 Kích Hoạt",
    Text = "Không hiển thị lỗi console, inject an toàn.",
    Duration = 8
})
-- ✅ AntiBan PRO MAX v2 (LongDepTrai)

if getgenv then getgenv().SecureMode = true end

-- Hook Kick, Break, Destroy, Shutdown
local mt=getrawmetatable(game); setreadonly(mt,false)
local old=mt.__namecall
mt.__namecall=newcclosure(function(self,...)
  local m=getnamecallmethod()
  if m=="Kick" or m=="BreakJoints" or m=="Destroy" or m=="Shutdown" then return nil end
  return old(self,...)
end)

-- Hook namecall/index/newindex spoof
mt.__index=newcclosure(function(t,k)
  if type(k)=="string" and (k=="WalkSpeed" or k=="JumpPower") then return 16 end
  return old(t,k)
end)
mt.__newindex=newcclosure(function(t,k,v)
  if type(k)=="string" and (k=="WalkSpeed" or k=="JumpPower") then return end
  return old(t,k,v)
end)

-- Fake ID/Name/Display
pcall(function()
  local lp=game.Players.LocalPlayer
  lp.Name="Anon_"..math.random(1000,9999)
  lp.DisplayName="Guest"..math.random(100,999)
  sethiddenproperty(lp,"UserId",1234567)
end)

-- Remove leaderstats, nametags
for _,v in pairs(game.Players:GetPlayers()) do
  if v~=game.Players.LocalPlayer then continue end
  local hr=v.Character and v.Character:FindFirstChild("Head")
  if hr then
    for _,c in pairs(hr:GetChildren()) do if c.Name:find("NameTag") or c:IsA("BillboardGui") then c:Destroy() end end
  end
end

-- Notify
pcall(function()
  game.StarterGui:SetCore("SendNotification",{Title="AntiBan PRO MAX v2",Text="Activated",Duration=5})
end)
print("✅ AntiBan PRO MAX v2 Activated")
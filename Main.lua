local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local lighting = game:GetService("Lighting")
local workspace = game:GetService("Workspace")

-- [[ NAKAMURA INTRO (STILL COOL) ]]
local player = players.LocalPlayer
local pgui = player:WaitForChild("PlayerGui")
local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = pgui
local frame = Instance.new("Frame")
frame.Size = UDim2.new(1, 0, 1, 0)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BackgroundTransparency = 1
frame.Parent = screenGui
local text = Instance.new("TextLabel")
text.Size = UDim2.new(1, 0, 0.2, 0)
text.Position = UDim2.new(0, 0, 0.4, 0)
text.BackgroundTransparency = 1
text.TextColor3 = Color3.new(1, 1, 1)
text.Text = "NAKAMURA'S SETTINGS: THE STRONGEST"
text.Font = Enum.Font.Code
text.TextSize = 35
text.TextTransparency = 1
text.Parent = frame
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://156353900"
sound.Volume = 0.5
sound.Parent = frame

task.spawn(function()
    sound:Play()
    tweenService:Create(frame, TweenInfo.new(0.3), {BackgroundTransparency = 0.4}):Play()
    tweenService:Create(text, TweenInfo.new(0.5), {TextTransparency = 0}):Play()
    task.wait(1.5)
    tweenService:Create(text, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
    tweenService:Create(frame, TweenInfo.new(0.3), {BackgroundTransparency = 1}):Play()
    task.wait(0.5)
    screenGui:Destroy()
end)

-- [[ THE OVERPOWERED NULLIFICATION ]]
-- 1. Rendering Engine Override
settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
settings().Rendering.MeshCacheSize = 0

-- 2. Ultimate Fast-Cleanup (No Loop, No Lag)
local function totalAnnihilation(v)
    -- Particles & Visual Assets (Total Disable)
    if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Explosion") or v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
        v.Enabled = false
        v.Texture = "" -- Wipes the image data instantly
        v.Transparency = NumberSequence.new(1)
        v.Lifetime = NumberRange.new(0)
    
    -- High-Performance Mesh/Part Wipe
    elseif v:IsA("MeshPart") or v:IsA("SpecialMesh") then
        local name = v.Name:lower()
        -- Targeted removal only for non-map items
        if name:find("effect") or name:find("skill") or name:find("aura") or name:find("slash") or name:find("shock") or name:find("hit") or v.Parent.Name:lower():find("effect") then
            if v:IsA("MeshPart") then
                v.Transparency = 1
                v.LocalTransparencyModifier = 1
                v.TextureID = ""
                v.MeshId = "" -- Physical shape destruction
            else
                v.TextureId = ""
                v.MeshId = ""
            end
        end
    end
end

-- 3. The "Silent Guard" - Watchers
-- Monitor Camera, Workspace, and Characters (Zero-Lag Event-driven)
workspace.DescendantAdded:Connect(totalAnnihilation)
workspace.CurrentCamera.DescendantAdded:Connect(totalAnnihilation)

for _, p in pairs(players:GetPlayers()) do
    if p.Character then p.Character.DescendantAdded:Connect(totalAnnihilation) end
    p.CharacterAdded:Connect(function(c) c.DescendantAdded:Connect(totalAnnihilation) end)
end

-- 4. Environment Freeze
lighting.GlobalShadows = false
lighting.Brightness = 0
lighting.FogEnd = 9e9
for _, v in pairs(lighting:GetChildren()) do
    if v:IsA("PostEffect") or v:IsA("BloomSize") or v:IsA("BlurEffect") or v:IsA("SunRaysEffect") then
        v.Enabled = false
    end
end

-- 5. One-time Global Sweep (Optimized for speed)
for _, v in pairs(workspace:GetDescendants()) do totalAnnihilation(v) end
for _, v in pairs(workspace.CurrentCamera:GetDescendants()) do totalAnnihilation(v) end

print("THE STRONGEST EDITION LOADED")

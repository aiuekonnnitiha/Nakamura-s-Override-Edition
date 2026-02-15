local players = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local runService = game:GetService("RunService")
local lighting = game:GetService("Lighting")
local workspace = game:GetService("Workspace")

-- [[ NAKAMURA CUSTOM INTRO UI & SOUND ]]
local player = players.LocalPlayer
local pgui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "NakamuraIntro"
screenGui.IgnoreGuiInset = true
screenGui.DisplayOrder = 999
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
text.Text = "NAKAMURA'S SETTINGS LOADED"
text.Font = Enum.Font.Code
text.TextSize = 35
text.TextTransparency = 1
text.Parent = frame

-- Windows Startup Sound Logic (Vol 50%)
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://156353900" -- Windows XP/7 Style Startup Sound
sound.Volume = 0.5
sound.Parent = frame

-- Animation & Sound Execution
task.spawn(function()
    sound:Play()
    tweenService:Create(frame, TweenInfo.new(0.5), {BackgroundTransparency = 0.3}):Play()
    tweenService:Create(text, TweenInfo.new(1), {TextTransparency = 0}):Play()
    task.wait(2.5)
    tweenService:Create(text, TweenInfo.new(1), {TextTransparency = 1}):Play()
    tweenService:Create(frame, TweenInfo.new(0.5), {BackgroundTransparency = 1}):Play()
    task.wait(1)
    screenGui:Destroy()
end)

-- [[ ORIGINAL OVERRIDE SETTINGS ]]
settings().Rendering.QualityLevel = 1
lighting.GlobalShadows = false
lighting.Brightness = 0
lighting.FogEnd = 9e9

local function forceClean(v)
    if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Beam") or v:IsA("Explosion") then
        v.Enabled = false
        v.Lifetime = NumberRange.new(0)
        v.Transparency = NumberSequence.new(1)
    end

    if v:IsA("BasePart") or v:IsA("MeshPart") then
        v.CastShadow = false
        v.Material = Enum.Material.SmoothPlastic
        v.Reflectance = 0
        
        for _, child in pairs(v:GetChildren()) do
            if child:IsA("Decal") or child:IsA("Texture") then
                child:Destroy()
            end
        end

        local name = v.Name:lower()
        if name:find("effect") or name:find("particle") or name:find("slash") or name:find("beam") or name:find("aura") or name:find("glow") or name:find("skill") then
            v.Transparency = 1
            v.LocalTransparencyModifier = 1
        end

        if v:IsA("MeshPart") then
            v.TextureID = ""
        end
        local mesh = v:FindFirstChildOfClass("SpecialMesh")
        if mesh then
            mesh.TextureId = ""
            mesh.MeshId = ""
        end
    end
end

task.spawn(function()
    while task.wait(1) do
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") or v:IsA("ParticleEmitter") then
                forceClean(v)
            end
        end
    end
end)

workspace.DescendantAdded:Connect(function(v)
    forceClean(v)
end)

for _, v in pairs(lighting:GetChildren()) do
    if v:IsA("PostEffect") or v:IsA("BloomSize") or v:IsA("BlurEffect") then
        v.Enabled = false
    end
end

print("Override Edition Loaded - Nakamura Custom with Sound")

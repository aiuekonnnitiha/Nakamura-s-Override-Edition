local _0xP=game:GetService("Players")repeat task.wait() until _0xP.LocalPlayer
local _0xT=game:GetService("TweenService")local _0xL=game:GetService("Lighting")local _0xW=game:GetService("Workspace")
local _0xPL=_0xP.LocalPlayer local _0xPG=_0xPL:WaitForChild("PlayerGui")local _0xSG=Instance.new("ScreenGui")_0xSG.IgnoreGuiInset=true _0xSG.Parent=_0xPG
local _0xF=Instance.new("Frame")_0xF.Size=UDim2.new(1,0,1,0) _0xF.BackgroundColor3=Color3.new(0,0,0) _0xF.BackgroundTransparency=1 _0xF.Parent=_0xSG
local _0xTX=Instance.new("TextLabel")_0xTX.Size=UDim2.new(1,0,0.2,0) _0xTX.Position=UDim2.new(0,0,0.4,0) _0xTX.BackgroundTransparency=1 _0xTX.TextColor3=Color3.new(1,1,1) _0xTX.Text="NAKAMURA'S SETTINGS: CLEAR VIEW" _0xTX.Font=Enum.Font.Code _0xTX.TextSize=35 _0xTX.TextTransparency=1 _0xTX.Parent=_0xF
local _0xSND=Instance.new("Sound")_0xSND.SoundId="rbxasset://sounds/action_get_up.mp3" _0xSND.Volume=0.5 _0xSND.Parent=_0xF
task.spawn(function()pcall(function()_0xSND:Play()end)_0xT:Create(_0xF,TweenInfo.new(0.3),{BackgroundTransparency=0.4}):Play()_0xT:Create(_0xTX,TweenInfo.new(0.5),{TextTransparency=0}):Play()task.wait(1.5)_0xT:Create(_0xTX,TweenInfo.new(0.5),{TextTransparency=1}):Play()_0xT:Create(_0xF,TweenInfo.new(0.3),{BackgroundTransparency=1}):Play()task.wait(0.5)_0xSG:Destroy()end)
local function _0xANN(_0xV)
if _0xV:IsA("ParticleEmitter") or _0xV:IsA("Trail") or _0xV:IsA("Beam") or _0xV:IsA("Explosion") or _0xV:IsA("Fire") or _0xV:IsA("Smoke") or _0xV:IsA("Sparkles") then
_0xV.Enabled=false _0xV.Texture="" _0xV.Transparency=NumberSequence.new(1) _0xV.Lifetime=NumberRange.new(0)
elseif _0xV:IsA("MeshPart") or _0xV:IsA("SpecialMesh") or _0xV:IsA("BasePart") then
local _0xNM=_0xV.Name:lower()if _0xNM:find("effect") or _0xNM:find("skill") or _0xNM:find("aura") or _0xNM:find("slash") or _0xNM:find("shock") or _0xNM:find("hit") or _0xV.Parent.Name:lower():find("effect") then
if not _0xV:IsDescendantOf(_0xPL.Character) and _0xV.CanCollide==false then
if _0xV:IsA("MeshPart") or _0xV:IsA("BasePart") then _0xV.Transparency=1 _0xV.LocalTransparencyModifier=1 if _0xV:IsA("MeshPart") then _0xV.TextureID="" end end
local _0xMSH=_0xV:FindFirstChildOfClass("SpecialMesh")if _0xMSH then _0xMSH.TextureId="" _0xMSH.MeshId="" end end end end end
_0xW.DescendantAdded:Connect(_0xANN) _0xW.CurrentCamera.DescendantAdded:Connect(_0xANN)
for _,_0xP2 in pairs(_0xP:GetPlayers()) do if _0xP2.Character then _0xP2.Character.DescendantAdded:Connect(_0xANN) end _0xP2.CharacterAdded:Connect(function(_0xCH) _0xCH.DescendantAdded:Connect(_0xANN) end) end
_0xL.GlobalShadows=false _0xL.Brightness=0 _0xL.FogEnd=100000
for _,_0xLE in pairs(_0xL:GetChildren()) do if _0xLE:IsA("PostEffect") or _0xLE:IsA("BloomSize") or _0xLE:IsA("BlurEffect") or _0xLE:IsA("SunRaysEffect") then _0xLE.Enabled=false end end
for _,_0xWD in pairs(_0xW:GetDescendants()) do _0xANN(_0xWD) end
for _,_0xCD in pairs(_0xW.CurrentCamera:GetDescendants()) do _0xANN(_0xCD) end

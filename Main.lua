local _0x1=game:GetService("\80\108\97\121\101\114\115")repeat task.wait() until _0x1.LocalPlayer
local _0x2=game:GetService("\84\119\101\101\110\83\101\114\118\105\99\101")local _0x3=game:GetService("\76\105\103\104\116\105\110\103")local _0x4=game:GetService("\87\111\114\107\115\112\97\99\101")
local _0x5=_0x1.LocalPlayer;local _0x6=_0x5:WaitForChild("\80\108\97\121\101\114\71\117\105")
local _0x7=Instance.new("\83\99\114\101\101\110\71\117\105")_0x7.IgnoreGuiInset=true;_0x7.Parent=_0x6
local _0x8=Instance.new("\70\114\97\109\101")_0x8.Size=UDim2.new(1,0,1,0)_0x8.BackgroundColor3=Color3.new(0,0,0)_0x8.BackgroundTransparency=1;_0x8.Parent=_0x7
local _0x9=Instance.new("\84\101\120\116\76\97\98\101\108")_0x9.Size=UDim2.new(1,0,0.2,0)_0x9.Position=UDim2.new(0,0,0.4,0)_0x9.BackgroundTransparency=1;_0x9.TextColor3=Color3.new(1,1,1)
_0x9.Text="速度6.8か6.9がマックス" _0x9.Font=Enum.Font.Code;_0x9.TextSize=35;_0x9.TextTransparency=1;_0x9.Parent=_0x8
local _0xA=Instance.new("\83\111\117\110\100")_0xA.SoundId="rbxassetid://156353900";_0xA.Volume=0.5;_0xA.Parent=_0x8
task.spawn(function()pcall(function()_0xA:Play()end)_0x2:Create(_0x8,TweenInfo.new(0.3),{BackgroundTransparency=0.4}):Play()_0x2:Create(_0x9,TweenInfo.new(0.5),{TextTransparency=0}):Play()task.wait(1.5)_0x2:Create(_0x9,TweenInfo.new(0.5),{TextTransparency=1}):Play()_0x2:Create(_0x8,TweenInfo.new(0.3),{BackgroundTransparency=1}):Play()task.wait(0.5)_0x7:Destroy()end)
local function _0xB(_0xC)
if _0xC:IsA("\80\97\114\116\105\99\108\101\69\109\105\116\116\101\114") or _0xC:IsA("\84\114\97\105\108") or _0xC:IsA("\66\101\97\109") or _0xC:IsA("\69\120\112\108\111\115\105\111\110") or _0xC:IsA("\70\105\114\101") or _0xC:IsA("\83\109\111\107\101") or _0xC:IsA("\83\112\97\114\107\108\101\115")then
_0xC.Enabled=false;_0xC.Texture="";_0xC.Transparency=NumberSequence.new(1)_0xC.Lifetime=NumberRange.new(0)
elseif _0xC:IsA("\77\101\115\104\80\97\114\116") or _0xC:IsA("\83\112\101\99\105\97\108\77\101\115\104") or _0xC:IsA("\66\97\115\101\80\97\114\116")then
local _0xD=_0xC.Name:lower()if _0xD:find("effect") or _0xD:find("skill") or _0xD:find("aura") or _0xD:find("slash") or _0xD:find("shock") or _0xD:find("hit") or _0xC.Parent.Name:lower():find("effect") then
if not _0xC:IsDescendantOf(_0x5.Character) and _0xC.CanCollide==false then
if _0xC:IsA("\77\101\115\104\80\97\114\116") or _0xC:IsA("\66\97\115\101\80\97\114\116")then _0xC.Transparency=1;_0xC.LocalTransparencyModifier=1;if _0xC:IsA("\77\101\115\104\80\97\114\116")then _0xC.TextureID="" end end
local _0xE=_0xC:FindFirstChildOfClass("\83\112\101\99\105\97\108\77\101\115\104")if _0xE then _0xE.TextureId="";_0xE.MeshId="" end end end end end
_0x4.DescendantAdded:Connect(_0xB)_0x4.CurrentCamera.DescendantAdded:Connect(_0xB)
for _,_0xF in pairs(_0x1:GetPlayers())do if _0xF.Character then _0xF.Character.DescendantAdded:Connect(_0xB)end;_0xF.CharacterAdded:Connect(function(_0x10)_0x10.DescendantAdded:Connect(_0xB)end)end
_0x3.GlobalShadows=false;_0x3.Brightness=0;_0x3.FogEnd=(100000)
for _,_0x11 in pairs(_0x3:GetChildren())do if _0x11:IsA("\80\111\115\116\69\102\102\101\99\116") or _0x11:IsA("\66\108\111\111\109\83\105\122\101") or _0x11:IsA("\66\108\117\114\69\102\102\101\99\116") or _0x11:IsA("\83\117\110\82\97\121\115\69\102\102\101\99\116")then _0x11.Enabled=false end end
for _,_0x12 in pairs(_0x4:GetDescendants())do _0xB(_0x12)end;for _,_0x13 in pairs(_0x4.CurrentCamera:GetDescendants())do _0xB(_0x13)end

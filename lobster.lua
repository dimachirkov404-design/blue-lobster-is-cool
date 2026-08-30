-- Крч скрипт говнище ебаное написаное тупорылым долбоёбом и китайской нейросетью. Используйте на свой страх и риск.

local player = game:GetService("Players")
local plr = player.LocalPlayer
local character = plr.Character or plr.CharacterAdded:Wait()
local hum = character:WaitForChild("Humanoid")
local LocalPlayer = player.LocalPlayer

---- part of the interface ----
local screen = Instance.new("ScreenGui")
screen.ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets

local on_button = Instance.new("ImageButton")
on_button.Image = "rbxassetid://10676284042"

local window_cht = Instance.new("Frame")

screen.Parent = plr.PlayerGui
---- 				 ----

---- frame ----
local uidetector_fr = Instance.new("UIDragDetector")

window_cht.Parent = screen
uidetector_fr.Parent = window_cht

window_cht.Visible = false
window_cht.Position = UDim2.new(0.063, 0,0.161, 0)
window_cht.Size = UDim2.new(0, 500,0, 300)

-- text on frame --
local text1 = Instance.new("TextLabel")
local text2 = Instance.new("TextLabel")
local text3 = Instance.new("TextLabel")
local text4 = Instance.new("TextLabel")
local text5 = Instance.new("TextLabel")

text1.Parent = window_cht
text2.Parent = window_cht
text3.Parent = window_cht
text4.Parent = window_cht
text5.Parent = window_cht

text1.Size = UDim2.new(0, 300,0, 50)
text2.Size = UDim2.new(0, 300,0, 50)
text3.Size = UDim2.new(0, 300,0, 50)
text4.Size = UDim2.new(0, 300,0, 50)
text5.Size = UDim2.new(0, 300,0, 50)

text1.Position = UDim2.new(0.022, 0,0.023, 0)
text2.Position = UDim2.new(0.02, 0,0.213, 0)
text3.Position = UDim2.new(0.02, 0,0.397, 0)
text4.Position = UDim2.new(0.02, 0,0.581, 0)
text5.Position = UDim2.new(0.02, 0,0.768, 0)

text1.Text = "Скорость игрока(16)"
text2.Text = "Здоровье игрока"
text3.Text = "Гравитация(196.2)"
text4.Text = "ESP"
text5.Text = "Включи чтобы стать крутым"
-- 				--

-- text box and buttons --
local box1 = Instance.new("TextBox")
local box2 = Instance.new("TextBox")
local box3 = Instance.new("TextBox")

box1.Parent = window_cht
box2.Parent = window_cht
box3.Parent = window_cht

box1.Size = UDim2.new(0, 175,0, 50)
box2.Size = UDim2.new(0, 175,0, 50)
box3.Size = UDim2.new(0, 175,0, 50)

box1.Position = UDim2.new(0.636, 0,0.023, 0)
box2.Position = UDim2.new(0.636, 0,0.213, 0)
box3.Position = UDim2.new(0.636, 0,0.397, 0)

box1.Text = "16"
box2.Text = "100"
box3.Text = "196.2"

local wh_btn = Instance.new("TextButton")
wh_btn.Parent = window_cht
wh_btn.Size = UDim2.new(0, 175,0, 50)
wh_btn.Position = UDim2.new(0.636, 0,0.581, 0)
wh_btn.Text = "Вкл"

local sigma_btn = Instance.new("TextButton")
sigma_btn.Parent = window_cht
sigma_btn.Size = UDim2.new(0, 175,0, 50)
sigma_btn.Position = UDim2.new(0.636, 0,0.768, 0)
sigma_btn.Text = "Вкл"

local sigma_window = Instance.new("ImageLabel")
sigma_window.Parent = screen
sigma_window.Size = UDim2.new(1, 0,1, 0)
sigma_window.Image = "rbxassetid://10676284042"
sigma_window.Visible = false

local sigma_sound = Instance.new("Sound")
sigma_sound.Parent = game.Workspace
sigma_sound.Volume = 1000
sigma_sound.SoundId = "rbxassetid://109612577784803"
--				--

---- 				 ----

---- on button ----
on_button.Parent = screen

on_button.Position = UDim2.new(0.925, 0,0.078, 0)
on_button.Size = UDim2.new(0, 50,0, 50)

on_button.MouseButton1Click:Connect(function()

	if window_cht.Visible == false then

		window_cht.Visible = true

	elseif window_cht.Visible == true then	

		window_cht.Visible = false

	end

end)
----				----

---- speed stetings ----
box1:GetPropertyChangedSignal("Text"):Connect(function()

	local speed = tonumber(box1.Text)

	if speed and speed > 0 then

		hum.WalkSpeed = speed

	end

end)
----				----

---- health stetings ----
box2:GetPropertyChangedSignal("Text"):Connect(function()

	local hlth = tonumber(box2.Text)

	if hlth and hlth > 0 then

		hum.MaxHealth = hlth
		hum.Health = hlth

	end

end)
----				----

---- gravity stetings ----
box3:GetPropertyChangedSignal("Text"):Connect(function()

	local grvt = tonumber(box3.Text)

	if grvt and grvt > 0 then

		game.Workspace.Gravity = grvt

	end

end)
----				 ----

---- sigma stetings ----

sigma_btn.MouseButton1Click:Connect(function()
	
	sigma_window.Visible = true
	sigma_sound:Play()
	wait(6.0)
	
	sigma_window.Visible = false
	
end)

---- 				 ----

---- create ESP ----
wh_btn.MouseButton1Click:Connect(function()

	function createESP(player)
		if player == LocalPlayer then return end

		local character = player.Character
		if not character then return end

		-- создание хиглихт
		local highlight = Instance.new("Highlight")
		highlight.Parent = character
		highlight.Adornee = character
		highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
		highlight.FillColor = Color3.fromRGB(255, 0, 0)
		highlight.OutlineColor = Color3.fromRGB(140, 0, 0)
		highlight.FillTransparency = 0.5
	end

	player.PlayerAdded:Connect(function(player)
		player.CharacterAdded:Connect(function(character)
			wait(1)
			createESP(player)
		end)
	end)

	for _, player in pairs(player:GetPlayers()) do
		if player.Character then
			createESP(player)
		end
		player.CharacterAdded:Connect(function(character)
			wait(1)
			createESP(player)
		end)
	end
end)
---- 				 ----

---- обход грязного, тупого, нищего, несуразного, отвратительного, уродливого античита ----
while wait(0.05) do
	
	-- обход грязного, тупого, нищего, несуразного, отвратительного, уродливого античита для скорости--
	local speed = tonumber(box1.Text)

	if speed and speed > 0 then

		hum.WalkSpeed = speed

	end
	-- 				 --
	
	-- обход грязного, тупого, нищего, несуразного, отвратительного, уродливого античита для здоровья --
	local hlth = tonumber(box2.Text)

	if hlth and hlth > 0 then

		hum.MaxHealth = hlth
		hum.Health = hlth

	end
	-- 				 --
	
	-- обход грязного, тупого, нищего, несуразного, отвратительного, уродливого античита для гравитации --
	local grvt = tonumber(box3.Text)

	if grvt and grvt > 0 then

		game.Workspace.Gravity = grvt

	end
	-- 				 --
	
end
---- 				 ----

setclipboard("https://discord.com/fartsaken")
local RayfieldLib = (function(...) -- ../Libraries/Rayfield.lua
    --[[
    
    	Rayfield Interface Suite
    	by Sirius
    	edited by SadLeaf for LeafHub
    
    	shlex | Designing + Programming
    	iRay  | Programming
    	Max   | Programming
    
    ]]
    
    if debugX then
    	warn('Initialising Rayfield')
    end
    
    local function getService(name)
        local service = game:GetService(name)
        return if cloneref then cloneref(service) else service
    end
    
    local requestsDisabled = getgenv and getgenv().DISABLE_RAYFIELD_REQUESTS
    local InterfaceBuild = '3K3W'
    local Release = "Build 1.672"
    local RayfieldFolder = "Rayfield"
    local ConfigurationFolder = RayfieldFolder.."/Configurations"
    local ConfigurationExtension = ".rfld"
    local settingsTable = {
    	General = {
    		-- if needs be in order just make getSetting(name)
    		rayfieldOpen = {Type = 'bind', Value = 'K', Name = 'Rayfield Keybind'},
    		-- buildwarnings
    		-- rayfieldprompts
    
    	},
    	System = {
    		usageAnalytics = {Type = 'toggle', Value = true, Name = 'Anonymised Analytics'},
    	}
    }
    
    local HttpService = getService('HttpService')
    local RunService = getService('RunService')
    
    -- Environment Check
    local useStudio = RunService:IsStudio() or false
    
    local settingsCreated = false
    local cachedSettings
    local prompt = (function(...) -- ../Libraries/RayfieldPrompt.lua
        local promptRet = {}
        
        local useStudio
        
        local runService = game:GetService("RunService")
        local coreGui = game:GetService('CoreGui')
        local fin
        local tweenService = game:GetService('TweenService')
        
        if runService:IsStudio() then
        	useStudio = true
        end
        
        local debounce = false
        
        local function open(prompt)
        	debounce = true
        	prompt.Policy.Size = UDim2.new(0, 450, 0, 120)
        
        	prompt.Policy.BackgroundTransparency = 1
        	prompt.Policy.Shadow.Image.ImageTransparency = 1
        	prompt.Policy.Title.TextTransparency = 1
        	prompt.Policy.Notice.TextTransparency = 1
        	prompt.Policy.Actions.Primary.BackgroundTransparency = 1
        	prompt.Policy.Actions.Primary.Shadow.ImageTransparency = 1
        	prompt.Policy.Actions.Primary.Title.TextTransparency = 1
        	prompt.Policy.Actions.Secondary.Title.TextTransparency = 1
        	
        	-- Show the prompt
        	prompt.Policy.Visible = true
        	prompt.Enabled = true
        	
        	tweenService:Create(prompt.Policy, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
        	tweenService:Create(prompt.Policy.Shadow.Image, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {ImageTransparency = 0.6}):Play()
        
        	tweenService:Create(prompt.Policy, TweenInfo.new(0.6, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(0, 520, 0, 150)}):Play()
        
        	task.wait(0.15)
        
        	tweenService:Create(prompt.Policy.Title, TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
        	task.wait(0.03)
        	tweenService:Create(prompt.Policy.Notice, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextTransparency = 0.5}):Play()
        	
        	task.wait(0.15)
        
        	tweenService:Create(prompt.Policy.Actions.Primary, TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundTransparency = 0.3}):Play()
        	tweenService:Create(prompt.Policy.Actions.Primary.Title, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextTransparency = 0.2}):Play()
        	tweenService:Create(prompt.Policy.Actions.Primary.Shadow, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {ImageTransparency = 0.7}):Play()
        
        	task.wait(5)
        	
        	if not fin then
        		tweenService:Create(prompt.Policy.Actions.Secondary.Title, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextTransparency = 0.6}):Play()
        		debounce = false
        	end
        end
        
        local function close(prompt)
        	debounce = true
        	tweenService:Create(prompt.Policy, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0, 430, 0, 110)}):Play()
        
        	tweenService:Create(prompt.Policy.Title, TweenInfo.new(0.35, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
        	tweenService:Create(prompt.Policy.Notice, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
        
        	tweenService:Create(prompt.Policy.Actions.Secondary.Title, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
        
        	tweenService:Create(prompt.Policy.Actions.Primary, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
        	tweenService:Create(prompt.Policy.Actions.Primary.Title, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextTransparency = 1}):Play()
        	tweenService:Create(prompt.Policy.Actions.Primary.Shadow, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
        	
        	tweenService:Create(prompt.Policy, TweenInfo.new(0.2, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
        	tweenService:Create(prompt.Policy.Shadow.Image, TweenInfo.new(0.25, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
        	
        	task.wait(1)
        	
        	prompt:Destroy()
        	fin = true
        end
        
        
        function promptRet.create(title, description, primary, secondary, callback)
        	local prompt = useStudio and script.Parent:FindFirstChild('Prompt') or game:GetObjects("rbxassetid://97206084643256")[1]
        
        	prompt.Enabled = false
        
        	if gethui then
        		prompt.Parent = gethui()
        	elseif syn and syn.protect_gui then 
        		syn.protect_gui(prompt)
        		prompt.Parent = coreGui
        	elseif not useStudio and coreGui:FindFirstChild("RobloxGui") then
        		prompt.Parent = coreGui:FindFirstChild("RobloxGui")
        	elseif not useStudio then
        		prompt.Parent = coreGui
        	end
        
        	-- Disable other instances of the prompt
        	if gethui then
        		for _, Interface in ipairs(gethui():GetChildren()) do
        			if Interface.Name == prompt.Name and Interface ~= prompt then
        				Interface.Enabled = false
        				Interface.Name = "Prompt-Old"
        			end
        		end
        	elseif not useStudio then
        		for _, Interface in ipairs(coreGui:GetChildren()) do
        			if Interface.Name == prompt.Name and Interface ~= prompt then
        				Interface.Enabled = false
        				Interface.Name = "Prompt-Old"
        			end
        		end
        	end
        
        	-- Set the prompt text
        	prompt.Policy.Title.Text = title
        	prompt.Policy.Notice.Text = description
        	prompt.Policy.Actions.Primary.Title.Text = primary
        	prompt.Policy.Actions.Secondary.Title.Text = secondary
        	
        	-- Handle the button clicks and trigger the callback
        	prompt.Policy.Actions.Primary.Interact.MouseButton1Click:Connect(function()
        		close(prompt)
        		if callback then callback(true) end
        	end)
        
        	prompt.Policy.Actions.Secondary.Interact.MouseButton1Click:Connect(function()
        		close(prompt)
        		if callback then callback(false) end
        	end)
        	
        	prompt.Policy.Actions.Primary.Interact.MouseEnter:Connect(function()
        		if debounce then return end
        		tweenService:Create(prompt.Policy.Actions.Primary, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
        		tweenService:Create(prompt.Policy.Actions.Primary.Title, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextTransparency = 0}):Play()
        		tweenService:Create(prompt.Policy.Actions.Primary.Shadow, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {ImageTransparency = 0.45}):Play()
        	end)
        	
        	prompt.Policy.Actions.Primary.Interact.MouseLeave:Connect(function()
        		if debounce then return end
        		tweenService:Create(prompt.Policy.Actions.Primary, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundTransparency = 0.2}):Play()
        		tweenService:Create(prompt.Policy.Actions.Primary.Title, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextTransparency = 0.2}):Play()
        		tweenService:Create(prompt.Policy.Actions.Primary.Shadow, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {ImageTransparency = 0.7}):Play()
        	end)
        
        	prompt.Policy.Actions.Secondary.Interact.MouseEnter:Connect(function()
        		if debounce then return end
        		tweenService:Create(prompt.Policy.Actions.Secondary.Title, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextTransparency = 0.3}):Play()
        	end)
        	
        	prompt.Policy.Actions.Secondary.Interact.MouseLeave:Connect(function()
        		if debounce then return end
        		tweenService:Create(prompt.Policy.Actions.Secondary.Title, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {TextTransparency = 0.6}):Play()
        	end)
        	
        	task.wait(0.5)
        
        	task.spawn(open, prompt)
        end
        
        return promptRet
    end)()
    local request = (syn and syn.request) or (fluxus and fluxus.request) or (http and http.request) or http_request or request
    
    
    
    local function loadSettings()
    	local file = nil
    
    	local success, result =	pcall(function()
    		task.spawn(function()
    			if isfolder and isfolder(RayfieldFolder) then
    				if isfile and isfile(RayfieldFolder..'/settings'..ConfigurationExtension) then
    					file = readfile(RayfieldFolder..'/settings'..ConfigurationExtension)
    				end
    			end
    
    			-- for debug in studio
    			if useStudio then
    				file = [[
    		{"General":{"rayfieldOpen":{"Value":"K","Type":"bind","Name":"Rayfield Keybind","Element":{"HoldToInteract":false,"Ext":true,"Name":"Rayfield Keybind","Set":null,"CallOnChange":true,"Callback":null,"CurrentKeybind":"K"}}},"System":{"usageAnalytics":{"Value":false,"Type":"toggle","Name":"Anonymised Analytics","Element":{"Ext":true,"Name":"Anonymised Analytics","Set":null,"CurrentValue":false,"Callback":null}}}}
    	]]
    			end
    
    
    			if file then
    				local success, decodedFile = pcall(function() return HttpService:JSONDecode(file) end)
    				if success then
    					file = decodedFile
    				else
    					file = {}
    				end
    			else
    				file = {}
    			end
    
    
    			if not settingsCreated then
    				cachedSettings = file
    				return
    			end
    
    			if file ~= {} then
    				for categoryName, settingCategory in pairs(settingsTable) do
    					if file[categoryName] then
    						for settingName, setting in pairs(settingCategory) do
    							if file[categoryName][settingName] then
    								setting.Value = file[categoryName][settingName].Value
    								setting.Element:Set(setting.Value)
    							end
    						end
    					end
    				end
    			end
    		end)
    	end)
    
    	if not success then
    		if writefile then
    			warn('Rayfield had an issue accessing configuration saving capability.')
    		end
    	end
    end
    
    if debugX then
    	warn('Now Loading Settings Configuration')
    end
    
    loadSettings()
    
    if debugX then
    	warn('Settings Loaded')
    end
    
    --if not cachedSettings or not cachedSettings.System or not cachedSettings.System.usageAnalytics then
    --	local fileFunctionsAvailable = isfile and writefile and readfile
    
    --	if not fileFunctionsAvailable and not useStudio then
    --		warn('Rayfield Interface Suite | Sirius Analytics:\n\n\nAs you don\'t have file functionality with your executor, we are unable to save whether you want to opt in or out to analytics.\nIf you do not want to take part in anonymised usage statistics, let us know in our Discord at sirius.menu/discord and we will manually opt you out.')
    --		analytics = true
    --	else
    --		prompt.create(
    --			'Help us improve',
    --	            [[Would you like to allow Sirius to collect usage statistics?
    
    --<font transparency='0.4'>No data is linked to you or your personal activity.</font>]],
    --			'Continue',
    --			'Cancel',
    --			function(result)
    --				settingsTable.System.usageAnalytics.Value = result
    --				analytics = result
    --			end
    --		)
    --	end
    
    --	repeat task.wait() until analytics ~= nil
    --end
    
    if not requestsDisabled then
    
    end
    
    if debugX then
    	warn('Moving on to continue initialisation')
    end
    
    local RayfieldLibrary = {
    	Flags = {},
    	Theme = {
    		Default = {
    			TextColor = Color3.fromRGB(240, 240, 240),
    
    			Background = Color3.fromRGB(25, 25, 25),
    			Topbar = Color3.fromRGB(34, 34, 34),
    			Shadow = Color3.fromRGB(20, 20, 20),
    
    			NotificationBackground = Color3.fromRGB(20, 20, 20),
    			NotificationActionsBackground = Color3.fromRGB(230, 230, 230),
    
    			TabBackground = Color3.fromRGB(80, 80, 80),
    			TabStroke = Color3.fromRGB(85, 85, 85),
    			TabBackgroundSelected = Color3.fromRGB(210, 210, 210),
    			TabTextColor = Color3.fromRGB(240, 240, 240),
    			SelectedTabTextColor = Color3.fromRGB(50, 50, 50),
    
    			ElementBackground = Color3.fromRGB(35, 35, 35),
    			ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
    			SecondaryElementBackground = Color3.fromRGB(25, 25, 25),
    			ElementStroke = Color3.fromRGB(50, 50, 50),
    			SecondaryElementStroke = Color3.fromRGB(40, 40, 40),
    
    			SliderBackground = Color3.fromRGB(50, 138, 220),
    			SliderProgress = Color3.fromRGB(50, 138, 220),
    			SliderStroke = Color3.fromRGB(58, 163, 255),
    
    			ToggleBackground = Color3.fromRGB(30, 30, 30),
    			ToggleEnabled = Color3.fromRGB(0, 146, 214),
    			ToggleDisabled = Color3.fromRGB(100, 100, 100),
    			ToggleEnabledStroke = Color3.fromRGB(0, 170, 255),
    			ToggleDisabledStroke = Color3.fromRGB(125, 125, 125),
    			ToggleEnabledOuterStroke = Color3.fromRGB(100, 100, 100),
    			ToggleDisabledOuterStroke = Color3.fromRGB(65, 65, 65),
    
    			DropdownSelected = Color3.fromRGB(40, 40, 40),
    			DropdownUnselected = Color3.fromRGB(30, 30, 30),
    
    			InputBackground = Color3.fromRGB(30, 30, 30),
    			InputStroke = Color3.fromRGB(65, 65, 65),
    			PlaceholderColor = Color3.fromRGB(178, 178, 178)
    		},
    
    		Ocean = {
    			TextColor = Color3.fromRGB(230, 240, 240),
    
    			Background = Color3.fromRGB(20, 30, 30),
    			Topbar = Color3.fromRGB(25, 40, 40),
    			Shadow = Color3.fromRGB(15, 20, 20),
    
    			NotificationBackground = Color3.fromRGB(25, 35, 35),
    			NotificationActionsBackground = Color3.fromRGB(230, 240, 240),
    
    			TabBackground = Color3.fromRGB(40, 60, 60),
    			TabStroke = Color3.fromRGB(50, 70, 70),
    			TabBackgroundSelected = Color3.fromRGB(100, 180, 180),
    			TabTextColor = Color3.fromRGB(210, 230, 230),
    			SelectedTabTextColor = Color3.fromRGB(20, 50, 50),
    
    			ElementBackground = Color3.fromRGB(30, 50, 50),
    			ElementBackgroundHover = Color3.fromRGB(40, 60, 60),
    			SecondaryElementBackground = Color3.fromRGB(30, 45, 45),
    			ElementStroke = Color3.fromRGB(45, 70, 70),
    			SecondaryElementStroke = Color3.fromRGB(40, 65, 65),
    
    			SliderBackground = Color3.fromRGB(0, 110, 110),
    			SliderProgress = Color3.fromRGB(0, 140, 140),
    			SliderStroke = Color3.fromRGB(0, 160, 160),
    
    			ToggleBackground = Color3.fromRGB(30, 50, 50),
    			ToggleEnabled = Color3.fromRGB(0, 130, 130),
    			ToggleDisabled = Color3.fromRGB(70, 90, 90),
    			ToggleEnabledStroke = Color3.fromRGB(0, 160, 160),
    			ToggleDisabledStroke = Color3.fromRGB(85, 105, 105),
    			ToggleEnabledOuterStroke = Color3.fromRGB(50, 100, 100),
    			ToggleDisabledOuterStroke = Color3.fromRGB(45, 65, 65),
    
    			DropdownSelected = Color3.fromRGB(30, 60, 60),
    			DropdownUnselected = Color3.fromRGB(25, 40, 40),
    
    			InputBackground = Color3.fromRGB(30, 50, 50),
    			InputStroke = Color3.fromRGB(50, 70, 70),
    			PlaceholderColor = Color3.fromRGB(140, 160, 160)
    		},
    
    		AmberGlow = {
    			TextColor = Color3.fromRGB(255, 245, 230),
    
    			Background = Color3.fromRGB(45, 30, 20),
    			Topbar = Color3.fromRGB(55, 40, 25),
    			Shadow = Color3.fromRGB(35, 25, 15),
    
    			NotificationBackground = Color3.fromRGB(50, 35, 25),
    			NotificationActionsBackground = Color3.fromRGB(245, 230, 215),
    
    			TabBackground = Color3.fromRGB(75, 50, 35),
    			TabStroke = Color3.fromRGB(90, 60, 45),
    			TabBackgroundSelected = Color3.fromRGB(230, 180, 100),
    			TabTextColor = Color3.fromRGB(250, 220, 200),
    			SelectedTabTextColor = Color3.fromRGB(50, 30, 10),
    
    			ElementBackground = Color3.fromRGB(60, 45, 35),
    			ElementBackgroundHover = Color3.fromRGB(70, 50, 40),
    			SecondaryElementBackground = Color3.fromRGB(55, 40, 30),
    			ElementStroke = Color3.fromRGB(85, 60, 45),
    			SecondaryElementStroke = Color3.fromRGB(75, 50, 35),
    
    			SliderBackground = Color3.fromRGB(220, 130, 60),
    			SliderProgress = Color3.fromRGB(250, 150, 75),
    			SliderStroke = Color3.fromRGB(255, 170, 85),
    
    			ToggleBackground = Color3.fromRGB(55, 40, 30),
    			ToggleEnabled = Color3.fromRGB(240, 130, 30),
    			ToggleDisabled = Color3.fromRGB(90, 70, 60),
    			ToggleEnabledStroke = Color3.fromRGB(255, 160, 50),
    			ToggleDisabledStroke = Color3.fromRGB(110, 85, 75),
    			ToggleEnabledOuterStroke = Color3.fromRGB(200, 100, 50),
    			ToggleDisabledOuterStroke = Color3.fromRGB(75, 60, 55),
    
    			DropdownSelected = Color3.fromRGB(70, 50, 40),
    			DropdownUnselected = Color3.fromRGB(55, 40, 30),
    
    			InputBackground = Color3.fromRGB(60, 45, 35),
    			InputStroke = Color3.fromRGB(90, 65, 50),
    			PlaceholderColor = Color3.fromRGB(190, 150, 130)
    		},
    
    		Light = {
    			TextColor = Color3.fromRGB(40, 40, 40),
    
    			Background = Color3.fromRGB(245, 245, 245),
    			Topbar = Color3.fromRGB(230, 230, 230),
    			Shadow = Color3.fromRGB(200, 200, 200),
    
    			NotificationBackground = Color3.fromRGB(250, 250, 250),
    			NotificationActionsBackground = Color3.fromRGB(240, 240, 240),
    
    			TabBackground = Color3.fromRGB(235, 235, 235),
    			TabStroke = Color3.fromRGB(215, 215, 215),
    			TabBackgroundSelected = Color3.fromRGB(255, 255, 255),
    			TabTextColor = Color3.fromRGB(80, 80, 80),
    			SelectedTabTextColor = Color3.fromRGB(0, 0, 0),
    
    			ElementBackground = Color3.fromRGB(240, 240, 240),
    			ElementBackgroundHover = Color3.fromRGB(225, 225, 225),
    			SecondaryElementBackground = Color3.fromRGB(235, 235, 235),
    			ElementStroke = Color3.fromRGB(210, 210, 210),
    			SecondaryElementStroke = Color3.fromRGB(210, 210, 210),
    
    			SliderBackground = Color3.fromRGB(150, 180, 220),
    			SliderProgress = Color3.fromRGB(100, 150, 200),
    			SliderStroke = Color3.fromRGB(120, 170, 220),
    
    			ToggleBackground = Color3.fromRGB(220, 220, 220),
    			ToggleEnabled = Color3.fromRGB(0, 146, 214),
    			ToggleDisabled = Color3.fromRGB(150, 150, 150),
    			ToggleEnabledStroke = Color3.fromRGB(0, 170, 255),
    			ToggleDisabledStroke = Color3.fromRGB(170, 170, 170),
    			ToggleEnabledOuterStroke = Color3.fromRGB(100, 100, 100),
    			ToggleDisabledOuterStroke = Color3.fromRGB(180, 180, 180),
    
    			DropdownSelected = Color3.fromRGB(230, 230, 230),
    			DropdownUnselected = Color3.fromRGB(220, 220, 220),
    
    			InputBackground = Color3.fromRGB(240, 240, 240),
    			InputStroke = Color3.fromRGB(180, 180, 180),
    			PlaceholderColor = Color3.fromRGB(140, 140, 140)
    		},
    
    		Amethyst = {
    			TextColor = Color3.fromRGB(240, 240, 240),
    
    			Background = Color3.fromRGB(30, 20, 40),
    			Topbar = Color3.fromRGB(40, 25, 50),
    			Shadow = Color3.fromRGB(20, 15, 30),
    
    			NotificationBackground = Color3.fromRGB(35, 20, 40),
    			NotificationActionsBackground = Color3.fromRGB(240, 240, 250),
    
    			TabBackground = Color3.fromRGB(60, 40, 80),
    			TabStroke = Color3.fromRGB(70, 45, 90),
    			TabBackgroundSelected = Color3.fromRGB(180, 140, 200),
    			TabTextColor = Color3.fromRGB(230, 230, 240),
    			SelectedTabTextColor = Color3.fromRGB(50, 20, 50),
    
    			ElementBackground = Color3.fromRGB(45, 30, 60),
    			ElementBackgroundHover = Color3.fromRGB(50, 35, 70),
    			SecondaryElementBackground = Color3.fromRGB(40, 30, 55),
    			ElementStroke = Color3.fromRGB(70, 50, 85),
    			SecondaryElementStroke = Color3.fromRGB(65, 45, 80),
    
    			SliderBackground = Color3.fromRGB(100, 60, 150),
    			SliderProgress = Color3.fromRGB(130, 80, 180),
    			SliderStroke = Color3.fromRGB(150, 100, 200),
    
    			ToggleBackground = Color3.fromRGB(45, 30, 55),
    			ToggleEnabled = Color3.fromRGB(120, 60, 150),
    			ToggleDisabled = Color3.fromRGB(94, 47, 117),
    			ToggleEnabledStroke = Color3.fromRGB(140, 80, 170),
    			ToggleDisabledStroke = Color3.fromRGB(124, 71, 150),
    			ToggleEnabledOuterStroke = Color3.fromRGB(90, 40, 120),
    			ToggleDisabledOuterStroke = Color3.fromRGB(80, 50, 110),
    
    			DropdownSelected = Color3.fromRGB(50, 35, 70),
    			DropdownUnselected = Color3.fromRGB(35, 25, 50),
    
    			InputBackground = Color3.fromRGB(45, 30, 60),
    			InputStroke = Color3.fromRGB(80, 50, 110),
    			PlaceholderColor = Color3.fromRGB(178, 150, 200)
    		},
    
    		Green = {
    			TextColor = Color3.fromRGB(30, 60, 30),
    
    			Background = Color3.fromRGB(235, 245, 235),
    			Topbar = Color3.fromRGB(210, 230, 210),
    			Shadow = Color3.fromRGB(200, 220, 200),
    
    			NotificationBackground = Color3.fromRGB(240, 250, 240),
    			NotificationActionsBackground = Color3.fromRGB(220, 235, 220),
    
    			TabBackground = Color3.fromRGB(215, 235, 215),
    			TabStroke = Color3.fromRGB(190, 210, 190),
    			TabBackgroundSelected = Color3.fromRGB(245, 255, 245),
    			TabTextColor = Color3.fromRGB(50, 80, 50),
    			SelectedTabTextColor = Color3.fromRGB(20, 60, 20),
    
    			ElementBackground = Color3.fromRGB(225, 240, 225),
    			ElementBackgroundHover = Color3.fromRGB(210, 225, 210),
    			SecondaryElementBackground = Color3.fromRGB(235, 245, 235),
    			ElementStroke = Color3.fromRGB(180, 200, 180),
    			SecondaryElementStroke = Color3.fromRGB(180, 200, 180),
    
    			SliderBackground = Color3.fromRGB(90, 160, 90),
    			SliderProgress = Color3.fromRGB(70, 130, 70),
    			SliderStroke = Color3.fromRGB(100, 180, 100),
    
    			ToggleBackground = Color3.fromRGB(215, 235, 215),
    			ToggleEnabled = Color3.fromRGB(60, 130, 60),
    			ToggleDisabled = Color3.fromRGB(150, 175, 150),
    			ToggleEnabledStroke = Color3.fromRGB(80, 150, 80),
    			ToggleDisabledStroke = Color3.fromRGB(130, 150, 130),
    			ToggleEnabledOuterStroke = Color3.fromRGB(100, 160, 100),
    			ToggleDisabledOuterStroke = Color3.fromRGB(160, 180, 160),
    
    			DropdownSelected = Color3.fromRGB(225, 240, 225),
    			DropdownUnselected = Color3.fromRGB(210, 225, 210),
    
    			InputBackground = Color3.fromRGB(235, 245, 235),
    			InputStroke = Color3.fromRGB(180, 200, 180),
    			PlaceholderColor = Color3.fromRGB(120, 140, 120)
    		},
    
    		Bloom = {
    			TextColor = Color3.fromRGB(60, 40, 50),
    
    			Background = Color3.fromRGB(255, 240, 245),
    			Topbar = Color3.fromRGB(250, 220, 225),
    			Shadow = Color3.fromRGB(230, 190, 195),
    
    			NotificationBackground = Color3.fromRGB(255, 235, 240),
    			NotificationActionsBackground = Color3.fromRGB(245, 215, 225),
    
    			TabBackground = Color3.fromRGB(240, 210, 220),
    			TabStroke = Color3.fromRGB(230, 200, 210),
    			TabBackgroundSelected = Color3.fromRGB(255, 225, 235),
    			TabTextColor = Color3.fromRGB(80, 40, 60),
    			SelectedTabTextColor = Color3.fromRGB(50, 30, 50),
    
    			ElementBackground = Color3.fromRGB(255, 235, 240),
    			ElementBackgroundHover = Color3.fromRGB(245, 220, 230),
    			SecondaryElementBackground = Color3.fromRGB(255, 235, 240),
    			ElementStroke = Color3.fromRGB(230, 200, 210),
    			SecondaryElementStroke = Color3.fromRGB(230, 200, 210),
    
    			SliderBackground = Color3.fromRGB(240, 130, 160),
    			SliderProgress = Color3.fromRGB(250, 160, 180),
    			SliderStroke = Color3.fromRGB(255, 180, 200),
    
    			ToggleBackground = Color3.fromRGB(240, 210, 220),
    			ToggleEnabled = Color3.fromRGB(255, 140, 170),
    			ToggleDisabled = Color3.fromRGB(200, 180, 185),
    			ToggleEnabledStroke = Color3.fromRGB(250, 160, 190),
    			ToggleDisabledStroke = Color3.fromRGB(210, 180, 190),
    			ToggleEnabledOuterStroke = Color3.fromRGB(220, 160, 180),
    			ToggleDisabledOuterStroke = Color3.fromRGB(190, 170, 180),
    
    			DropdownSelected = Color3.fromRGB(250, 220, 225),
    			DropdownUnselected = Color3.fromRGB(240, 210, 220),
    
    			InputBackground = Color3.fromRGB(255, 235, 240),
    			InputStroke = Color3.fromRGB(220, 190, 200),
    			PlaceholderColor = Color3.fromRGB(170, 130, 140)
    		},
    
    		DarkBlue = {
    			TextColor = Color3.fromRGB(230, 230, 230),
    
    			Background = Color3.fromRGB(20, 25, 30),
    			Topbar = Color3.fromRGB(30, 35, 40),
    			Shadow = Color3.fromRGB(15, 20, 25),
    
    			NotificationBackground = Color3.fromRGB(25, 30, 35),
    			NotificationActionsBackground = Color3.fromRGB(45, 50, 55),
    
    			TabBackground = Color3.fromRGB(35, 40, 45),
    			TabStroke = Color3.fromRGB(45, 50, 60),
    			TabBackgroundSelected = Color3.fromRGB(40, 70, 100),
    			TabTextColor = Color3.fromRGB(200, 200, 200),
    			SelectedTabTextColor = Color3.fromRGB(255, 255, 255),
    
    			ElementBackground = Color3.fromRGB(30, 35, 40),
    			ElementBackgroundHover = Color3.fromRGB(40, 45, 50),
    			SecondaryElementBackground = Color3.fromRGB(35, 40, 45),
    			ElementStroke = Color3.fromRGB(45, 50, 60),
    			SecondaryElementStroke = Color3.fromRGB(40, 45, 55),
    
    			SliderBackground = Color3.fromRGB(0, 90, 180),
    			SliderProgress = Color3.fromRGB(0, 120, 210),
    			SliderStroke = Color3.fromRGB(0, 150, 240),
    
    			ToggleBackground = Color3.fromRGB(35, 40, 45),
    			ToggleEnabled = Color3.fromRGB(0, 120, 210),
    			ToggleDisabled = Color3.fromRGB(70, 70, 80),
    			ToggleEnabledStroke = Color3.fromRGB(0, 150, 240),
    			ToggleDisabledStroke = Color3.fromRGB(75, 75, 85),
    			ToggleEnabledOuterStroke = Color3.fromRGB(20, 100, 180),
    			ToggleDisabledOuterStroke = Color3.fromRGB(55, 55, 65),
    
    			DropdownSelected = Color3.fromRGB(30, 70, 90),
    			DropdownUnselected = Color3.fromRGB(25, 30, 35),
    
    			InputBackground = Color3.fromRGB(25, 30, 35),
    			InputStroke = Color3.fromRGB(45, 50, 60),
    			PlaceholderColor = Color3.fromRGB(150, 150, 160)
    		},
    
    		Serenity = {
    			TextColor = Color3.fromRGB(50, 55, 60),
    			Background = Color3.fromRGB(240, 245, 250),
    			Topbar = Color3.fromRGB(215, 225, 235),
    			Shadow = Color3.fromRGB(200, 210, 220),
    
    			NotificationBackground = Color3.fromRGB(210, 220, 230),
    			NotificationActionsBackground = Color3.fromRGB(225, 230, 240),
    
    			TabBackground = Color3.fromRGB(200, 210, 220),
    			TabStroke = Color3.fromRGB(180, 190, 200),
    			TabBackgroundSelected = Color3.fromRGB(175, 185, 200),
    			TabTextColor = Color3.fromRGB(50, 55, 60),
    			SelectedTabTextColor = Color3.fromRGB(30, 35, 40),
    
    			ElementBackground = Color3.fromRGB(210, 220, 230),
    			ElementBackgroundHover = Color3.fromRGB(220, 230, 240),
    			SecondaryElementBackground = Color3.fromRGB(200, 210, 220),
    			ElementStroke = Color3.fromRGB(190, 200, 210),
    			SecondaryElementStroke = Color3.fromRGB(180, 190, 200),
    
    			SliderBackground = Color3.fromRGB(200, 220, 235),  -- Lighter shade
    			SliderProgress = Color3.fromRGB(70, 130, 180),
    			SliderStroke = Color3.fromRGB(150, 180, 220),
    
    			ToggleBackground = Color3.fromRGB(210, 220, 230),
    			ToggleEnabled = Color3.fromRGB(70, 160, 210),
    			ToggleDisabled = Color3.fromRGB(180, 180, 180),
    			ToggleEnabledStroke = Color3.fromRGB(60, 150, 200),
    			ToggleDisabledStroke = Color3.fromRGB(140, 140, 140),
    			ToggleEnabledOuterStroke = Color3.fromRGB(100, 120, 140),
    			ToggleDisabledOuterStroke = Color3.fromRGB(120, 120, 130),
    
    			DropdownSelected = Color3.fromRGB(220, 230, 240),
    			DropdownUnselected = Color3.fromRGB(200, 210, 220),
    
    			InputBackground = Color3.fromRGB(220, 230, 240),
    			InputStroke = Color3.fromRGB(180, 190, 200),
    			PlaceholderColor = Color3.fromRGB(150, 150, 150)
    		},
    	}
    }
    
    
    -- Services
    local UserInputService = getService("UserInputService")
    local TweenService = getService("TweenService")
    local Players = getService("Players")
    local CoreGui = getService("CoreGui")
    
    -- Interface Management
    
    local Rayfield = useStudio and script.Parent:FindFirstChild('Rayfield') or game:GetObjects("rbxassetid://10804731440")[1]
    local buildAttempts = 0
    local correctBuild = false
    local warned
    local globalLoaded
    
    repeat
    	if Rayfield:FindFirstChild('Build') and Rayfield.Build.Value == InterfaceBuild then
    		correctBuild = true
    		break
    	end
    
    	correctBuild = false
    
    	if not warned then
    		warn('Rayfield | Build Mismatch')
    		print('Rayfield may encounter issues as you are running an incompatible interface version ('.. ((Rayfield:FindFirstChild('Build') and Rayfield.Build.Value) or 'No Build') ..').\n\nThis version of Rayfield is intended for interface build '..InterfaceBuild..'.')
    		warned = true
    	end
    
    	toDestroy, Rayfield = Rayfield, useStudio and script.Parent:FindFirstChild('Rayfield') or game:GetObjects("rbxassetid://10804731440")[1]
    	if toDestroy and not useStudio then toDestroy:Destroy() end
    
    	buildAttempts = buildAttempts + 1
    until buildAttempts >= 2
    
    Rayfield.Enabled = false
    
    if gethui then
    	Rayfield.Parent = gethui()
    elseif syn and syn.protect_gui then
    	syn.protect_gui(Rayfield)
    	Rayfield.Parent = CoreGui
    elseif not useStudio and CoreGui:FindFirstChild("RobloxGui") then
    	Rayfield.Parent = CoreGui:FindFirstChild("RobloxGui")
    elseif not useStudio then
    	Rayfield.Parent = CoreGui
    end
    
    if gethui then
    	for _, Interface in ipairs(gethui():GetChildren()) do
    		if Interface.Name == Rayfield.Name and Interface ~= Rayfield then
    			Interface.Enabled = false
    			Interface.Name = "Rayfield-Old"
    		end
    	end
    elseif not useStudio then
    	for _, Interface in ipairs(CoreGui:GetChildren()) do
    		if Interface.Name == Rayfield.Name and Interface ~= Rayfield then
    			Interface.Enabled = false
    			Interface.Name = "Rayfield-Old"
    		end
    	end
    end
    
    
    local minSize = Vector2.new(1024, 768)
    local useMobileSizing
    
    if Rayfield.AbsoluteSize.X < minSize.X and Rayfield.AbsoluteSize.Y < minSize.Y then
    	useMobileSizing = true
    end
    
    if UserInputService.TouchEnabled then
    	useMobilePrompt = true
    end
    
    
    -- Object Variables
    
    local Main = Rayfield.Main
    local updateDragBar
    local MPrompt = Rayfield:FindFirstChild('Prompt')
    local Topbar = Main.Topbar
    local Elements = Main.Elements
    local LoadingFrame = Main.LoadingFrame
    local TabList = Main.TabList
    local dragBar = Rayfield:FindFirstChild('Drag')
    local dragInteract = dragBar and dragBar.Interact or nil
    local dragBarCosmetic = dragBar and dragBar.Drag or nil
    
    local dragOffset = 255
    local dragOffsetMobile = 150
    
    Rayfield.DisplayOrder = 100
    LoadingFrame.Version.Text = Release
    
    -- Thanks to Latte Softworks for the Lucide integration for Roblox
    local Icons = (function(...) -- ../Libraries/RayfieldIcons.lua
        --!nocheck
        return {["48px"]={rewind={16898613699,{48,48},{563,967}},fuel={16898613353,{48,48},{196,967}},["square-arrow-out-up-right"]={16898613777,{48,48},{967,514}},["table-cells-split"]={16898613777,{48,48},{771,955}},gavel={16898613353,{48,48},{967,808}},["dna-off"]={16898613044,{48,48},{453,967}},["refresh-ccw-dot"]={16898613699,{48,48},{869,404}},bean={16898612629,{48,48},{967,906}},["arrow-up-right-from-circle"]={16898612629,{48,48},{563,967}},["table-columns-split"]={16898613777,{48,48},{967,808}},bolt={16898612819,{48,48},{306,820}},["square-asterisk"]={16898613777,{48,48},{710,771}},feather={16898613353,{48,48},{771,98}},["align-horizontal-distribute-center"]={16898612629,{48,48},{771,355}},["align-center"]={16898612629,{48,48},{0,869}},["grip-vertical"]={16898613509,{48,48},{0,869}},["person-standing"]={16898613699,{48,48},{563,771}},["badge-swiss-franc"]={16898612629,{48,48},{771,857}},["between-horizontal-end"]={16898612819,{48,48},{771,306}},["rotate-cw"]={16898613699,{48,48},{869,453}},framer={16898613353,{48,48},{661,967}},["bus-front"]={16898612819,{48,48},{869,612}},["shield-ellipsis"]={16898613777,{48,48},{771,306}},["file-lock-2"]={16898613353,{48,48},{257,918}},["between-vertical-end"]={16898612819,{48,48},{257,820}},["globe-lock"]={16898613509,{48,48},{820,514}},["toggle-left"]={16898613869,{48,48},{869,49}},["concierge-bell"]={16898613044,{48,48},{869,147}},video={16898613869,{48,48},{355,967}},["arrow-left-square"]={16898612629,{48,48},{196,820}},["file-down"]={16898613353,{48,48},{98,820}},["picture-in-picture"]={16898613699,{48,48},{257,869}},["messages-square"]={16898613613,{48,48},{306,869}},grab={16898613509,{48,48},{514,820}},["phone-call"]={16898613699,{48,48},{514,820}},["chevron-up-circle"]={16898612819,{48,48},{820,808}},["server-crash"]={16898613699,{48,48},{918,955}},["heading-3"]={16898613509,{48,48},{869,306}},squircle={16898613777,{48,48},{820,759}},["wifi-off"]={16898613869,{48,48},{918,759}},["sun-medium"]={16898613777,{48,48},{661,967}},ungroup={16898613869,{48,48},{257,967}},["cloud-download"]={16898613044,{48,48},{612,820}},["sigma-square"]={16898613777,{48,48},{869,514}},["folder-plus"]={16898613353,{48,48},{661,918}},["hard-drive-download"]={16898613509,{48,48},{918,0}},["scatter-chart"]={16898613699,{48,48},{196,967}},pointer={16898613699,{48,48},{661,771}},ligature={16898613509,{48,48},{612,967}},["chevrons-up-down"]={16898612819,{48,48},{918,759}},["iteration-cw"]={16898613509,{48,48},{869,147}},["rail-symbol"]={16898613699,{48,48},{967,514}},["square-stack"]={16898613777,{48,48},{453,869}},parentheses={16898613613,{48,48},{869,906}},["book-up-2"]={16898612819,{48,48},{306,869}},flame={16898613353,{48,48},{967,306}},["chevrons-up"]={16898612819,{48,48},{869,808}},["chevron-right-square"]={16898612819,{48,48},{918,710}},["square-mouse-pointer"]={16898613777,{48,48},{869,661}},superscript={16898613777,{48,48},{918,759}},signal={16898613777,{48,48},{918,0}},["file-warning"]={16898613353,{48,48},{967,514}},hexagon={16898613509,{48,48},{967,0}},["navigation-2-off"]={16898613613,{48,48},{918,612}},unlock={16898613869,{48,48},{771,710}},["arrows-up-from-line"]={16898612629,{48,48},{918,404}},["square-gantt-chart"]={16898613777,{48,48},{453,820}},["square-chevron-left"]={16898613777,{48,48},{967,49}},scaling={16898613699,{48,48},{967,661}},["inspection-panel"]={16898613509,{48,48},{563,918}},["arrow-left-from-line"]={16898612629,{48,48},{869,147}},ship={16898613777,{48,48},{771,98}},["ticket-percent"]={16898613869,{48,48},{257,869}},["arrow-right-square"]={16898612629,{48,48},{869,404}},["calendar-clock"]={16898612819,{48,48},{918,98}},x={16898613869,{48,48},{869,906}},voicemail={16898613869,{48,48},{869,710}},presentation={16898613699,{48,48},{771,196}},["tree-palm"]={16898613869,{48,48},{820,612}},popsicle={16898613699,{48,48},{563,869}},["captions-off"]={16898612819,{48,48},{661,869}},["align-vertical-justify-center"]={16898612629,{48,48},{49,869}},theater={16898613869,{48,48},{98,771}},tent={16898613869,{48,48},{49,771}},["repeat-1"]={16898613699,{48,48},{918,612}},stethoscope={16898613777,{48,48},{147,967}},["screen-share-off"]={16898613699,{48,48},{771,906}},["arrow-big-up"]={16898612629,{48,48},{918,306}},["volume-x"]={16898613869,{48,48},{710,869}},["mouse-pointer-click"]={16898613613,{48,48},{771,710}},["square-m"]={16898613777,{48,48},{306,967}},["hard-drive"]={16898613509,{48,48},{820,98}},["package-minus"]={16898613613,{48,48},{771,808}},cloud={16898613044,{48,48},{918,306}},["mouse-pointer-square-dashed"]={16898613613,{48,48},{710,771}},["flip-horizontal"]={16898613353,{48,48},{306,967}},["alert-circle"]={16898612629,{48,48},{869,0}},unplug={16898613869,{48,48},{710,771}},["badge-cent"]={16898612629,{48,48},{612,967}},["check-square-2"]={16898612819,{48,48},{820,759}},["monitor-check"]={16898613613,{48,48},{196,771}},trello={16898613869,{48,48},{612,820}},["paintbrush-2"]={16898613613,{48,48},{967,404}},["bar-chart-horizontal"]={16898612629,{48,48},{710,967}},["book-plus"]={16898612819,{48,48},{771,404}},torus={16898613869,{48,48},{147,771}},["panel-right-close"]={16898613613,{48,48},{453,967}},["heart-handshake"]={16898613509,{48,48},{869,563}},trees={16898613869,{48,48},{661,771}},ham={16898613509,{48,48},{355,771}},text={16898613869,{48,48},{771,98}},["nut-off"]={16898613613,{48,48},{98,967}},["bean-off"]={16898612629,{48,48},{869,955}},rat={16898613699,{48,48},{869,612}},["separator-horizontal"]={16898613699,{48,48},{918,906}},["square-arrow-up-right"]={16898613777,{48,48},{820,661}},["signal-zero"]={16898613777,{48,48},{514,869}},citrus={16898613044,{48,48},{306,820}},["phone-missed"]={16898613699,{48,48},{771,98}},["user-round-check"]={16898613869,{48,48},{869,404}},["battery-medium"]={16898612629,{48,48},{869,906}},["square-minus"]={16898613777,{48,48},{918,612}},hotel={16898613509,{48,48},{98,869}},["folder-output"]={16898613353,{48,48},{771,808}},["ice-cream"]={16898613509,{48,48},{869,355}},menu={16898613613,{48,48},{49,820}},["arrow-up-left-square"]={16898612629,{48,48},{710,820}},lightbulb={16898613509,{48,48},{918,196}},["badge-help"]={16898612629,{48,48},{147,967}},angry={16898612629,{48,48},{257,918}},outdent={16898613613,{48,48},{918,661}},["circle-dot-dashed"]={16898613044,{48,48},{771,514}},speech={16898613777,{48,48},{820,147}},["cake-slice"]={16898612819,{48,48},{661,820}},["git-graph"]={16898613509,{48,48},{0,771}},armchair={16898612629,{48,48},{820,147}},["qr-code"]={16898613699,{48,48},{967,257}},copy={16898613044,{48,48},{918,612}},goal={16898613509,{48,48},{563,771}},["trending-down"]={16898613869,{48,48},{563,869}},haze={16898613509,{48,48},{98,820}},nfc={16898613613,{48,48},{612,918}},["receipt-russian-ruble"]={16898613699,{48,48},{514,967}},disc={16898613044,{48,48},{661,967}},["notebook-tabs"]={16898613613,{48,48},{967,98}},["panels-left-bottom"]={16898613613,{48,48},{820,906}},videotape={16898613869,{48,48},{967,612}},["sun-moon"]={16898613777,{48,48},{967,196}},calendar={16898612819,{48,48},{355,918}},["minus-circle"]={16898613613,{48,48},{869,98}},sunset={16898613777,{48,48},{967,710}},["navigation-2"]={16898613613,{48,48},{869,661}},["message-square-heart"]={16898613613,{48,48},{771,147}},["rectangle-ellipsis"]={16898613699,{48,48},{820,196}},["badge-plus"]={16898612629,{48,48},{918,710}},["indian-rupee"]={16898613509,{48,48},{710,771}},["monitor-dot"]={16898613613,{48,48},{147,820}},delete={16898613044,{48,48},{661,918}},["clipboard-pen-line"]={16898613044,{48,48},{918,0}},["folder-search"]={16898613353,{48,48},{918,196}},["utensils-crossed"]={16898613869,{48,48},{918,147}},dices={16898613044,{48,48},{918,710}},reply={16898613699,{48,48},{612,918}},["flask-round"]={16898613353,{48,48},{404,869}},pause={16898613699,{48,48},{0,771}},shrub={16898613777,{48,48},{306,820}},flag={16898613353,{48,48},{98,918}},underline={16898613869,{48,48},{820,404}},["align-horizontal-distribute-end"]={16898612629,{48,48},{355,771}},newspaper={16898613613,{48,48},{661,869}},table={16898613777,{48,48},{820,955}},["move-vertical"]={16898613613,{48,48},{820,453}},["file-pen-line"]={16898613353,{48,48},{612,820}},["badge-russian-ruble"]={16898612629,{48,48},{820,808}},radius={16898613699,{48,48},{257,967}},["loader-2"]={16898613509,{48,48},{820,857}},pilcrow={16898613699,{48,48},{612,771}},["scan-face"]={16898613699,{48,48},{820,808}},spade={16898613777,{48,48},{514,918}},["book-user"]={16898612819,{48,48},{918,514}},["flip-vertical"]={16898613353,{48,48},{918,612}},["square-arrow-down"]={16898613777,{48,48},{453,771}},["circle-plus"]={16898613044,{48,48},{869,0}},view={16898613869,{48,48},{918,661}},cctv={16898612819,{48,48},{355,967}},["more-horizontal"]={16898613613,{48,48},{257,967}},["file-key-2"]={16898613353,{48,48},{404,771}},["pause-octagon"]={16898613699,{48,48},{771,0}},["circle-arrow-out-down-left"]={16898612819,{48,48},{771,955}},volume={16898613869,{48,48},{661,918}},facebook={16898613353,{48,48},{563,771}},["octagon-alert"]={16898613613,{48,48},{918,404}},["panel-bottom-dashed"]={16898613613,{48,48},{918,710}},["book-a"]={16898612819,{48,48},{820,563}},["align-end-vertical"]={16898612629,{48,48},{820,306}},["user-x-2"]={16898613869,{48,48},{771,759}},chrome={16898612819,{48,48},{820,857}},["receipt-japanese-yen"]={16898613699,{48,48},{612,869}},rabbit={16898613699,{48,48},{869,355}},["scissors-square"]={16898613699,{48,48},{869,808}},["check-square"]={16898612819,{48,48},{771,808}},["train-front-tunnel"]={16898613869,{48,48},{771,404}},["panel-left-dashed"]={16898613613,{48,48},{661,967}},fish={16898613353,{48,48},{869,147}},slack={16898613777,{48,48},{0,918}},sliders={16898613777,{48,48},{404,771}},["message-circle-warning"]={16898613613,{48,48},{771,612}},map={16898613613,{48,48},{306,771}},route={16898613699,{48,48},{404,918}},["arrow-up-left"]={16898612629,{48,48},{661,869}},award={16898612629,{48,48},{918,661}},["message-square-plus"]={16898613613,{48,48},{49,869}},["unfold-horizontal"]={16898613869,{48,48},{355,869}},["area-chart"]={16898612629,{48,48},{869,98}},["music-4"]={16898613613,{48,48},{306,967}},["shield-x"]={16898613777,{48,48},{514,820}},["plane-landing"]={16898613699,{48,48},{771,147}},["disc-3"]={16898613044,{48,48},{771,857}},["columns-4"]={16898613044,{48,48},{710,771}},["archive-x"]={16898612629,{48,48},{967,0}},["square-dashed-kanban"]={16898613777,{48,48},{98,918}},["users-2"]={16898613869,{48,48},{612,918}},["shield-off"]={16898613777,{48,48},{820,514}},compass={16898613044,{48,48},{514,967}},vegan={16898613869,{48,48},{967,355}},["message-circle-plus"]={16898613613,{48,48},{257,869}},["stop-circle"]={16898613777,{48,48},{453,918}},nut={16898613613,{48,48},{967,355}},search={16898613699,{48,48},{918,857}},files={16898613353,{48,48},{771,710}},["send-to-back"]={16898613699,{48,48},{820,955}},["alarm-clock"]={16898612629,{48,48},{257,820}},["shopping-basket"]={16898613777,{48,48},{0,869}},send={16898613699,{48,48},{967,857}},["chevron-left-square"]={16898612819,{48,48},{453,918}},["terminal-square"]={16898613869,{48,48},{0,820}},wifi={16898613869,{48,48},{869,808}},["skip-back"]={16898613777,{48,48},{147,771}},["wrap-text"]={16898613869,{48,48},{869,857}},["file-scan"]={16898613353,{48,48},{820,147}},["message-square-dashed"]={16898613613,{48,48},{918,0}},trophy={16898613869,{48,48},{820,147}},umbrella={16898613869,{48,48},{869,355}},touchpad={16898613869,{48,48},{49,869}},["clipboard-copy"]={16898613044,{48,48},{820,563}},pentagon={16898613699,{48,48},{771,306}},["arrow-up-from-line"]={16898612629,{48,48},{820,710}},["circle-chevron-up"]={16898613044,{48,48},{771,0}},worm={16898613869,{48,48},{918,808}},["lamp-desk"]={16898613509,{48,48},{355,918}},["circle-arrow-up"]={16898612819,{48,48},{967,857}},zap={16898613869,{48,48},{918,906}},boxes={16898612819,{48,48},{196,771}},["swiss-franc"]={16898613777,{48,48},{820,857}},["move-left"]={16898613613,{48,48},{98,918}},["chevron-up"]={16898612819,{48,48},{710,918}},instagram={16898613509,{48,48},{514,967}},["pen-tool"]={16898613699,{48,48},{820,0}},["pencil-ruler"]={16898613699,{48,48},{0,820}},["grid-2x2"]={16898613509,{48,48},{771,98}},["arrow-big-down-dash"]={16898612629,{48,48},{771,196}},["clipboard-edit"]={16898613044,{48,48},{771,612}},mic={16898613613,{48,48},{820,612}},["file-minus-2"]={16898613353,{48,48},{869,563}},gitlab={16898613509,{48,48},{820,257}},["rotate-3d"]={16898613699,{48,48},{147,918}},["spell-check"]={16898613777,{48,48},{196,771}},popcorn={16898613699,{48,48},{612,820}},blocks={16898612819,{48,48},{49,820}},["washing-machine"]={16898613869,{48,48},{918,710}},siren={16898613777,{48,48},{771,147}},["cloud-sun"]={16898613044,{48,48},{0,967}},circle={16898613044,{48,48},{771,355}},["shield-alert"]={16898613777,{48,48},{49,771}},rainbow={16898613699,{48,48},{918,563}},["separator-vertical"]={16898613699,{48,48},{869,955}},ampersands={16898612629,{48,48},{355,820}},["user-search"]={16898613869,{48,48},{918,612}},fence={16898613353,{48,48},{98,771}},["square-user-round"]={16898613777,{48,48},{355,967}},sunrise={16898613777,{48,48},{453,967}},strikethrough={16898613777,{48,48},{869,759}},["calendar-days"]={16898612819,{48,48},{869,147}},["dollar-sign"]={16898613044,{48,48},{820,857}},["message-square-quote"]={16898613613,{48,48},{0,918}},["list-minus"]={16898613509,{48,48},{820,808}},["cloud-hail"]={16898613044,{48,48},{967,0}},upload={16898613869,{48,48},{612,869}},["app-window-mac"]={16898612629,{48,48},{661,771}},ellipsis={16898613353,{48,48},{771,49}},["copy-check"]={16898613044,{48,48},{453,820}},history={16898613509,{48,48},{869,98}},satellite={16898613699,{48,48},{147,967}},["bookmark-plus"]={16898612819,{48,48},{612,820}},["folder-key"]={16898613353,{48,48},{355,967}},["lamp-ceiling"]={16898613509,{48,48},{404,869}},["circle-power"]={16898613044,{48,48},{820,49}},hourglass={16898613509,{48,48},{49,918}},keyboard={16898613509,{48,48},{453,820}},triangle={16898613869,{48,48},{869,98}},["layers-2"]={16898613509,{48,48},{196,869}},["battery-full"]={16898612629,{48,48},{967,808}},["user-minus"]={16898613869,{48,48},{49,967}},["x-octagon"]={16898613869,{48,48},{967,808}},["folder-tree"]={16898613353,{48,48},{967,404}},command={16898613044,{48,48},{563,918}},["badge-dollar-sign"]={16898612629,{48,48},{918,196}},["align-start-vertical"]={16898612629,{48,48},{820,98}},["chevrons-down"]={16898612819,{48,48},{967,196}},["bluetooth-off"]={16898612819,{48,48},{869,257}},cannabis={16898612819,{48,48},{710,820}},book={16898612819,{48,48},{820,612}},hammer={16898613509,{48,48},{306,820}},["circle-minus"]={16898613044,{48,48},{771,306}},["audio-waveform"]={16898612629,{48,48},{967,612}},["moon-star"]={16898613613,{48,48},{355,869}},["arrow-right"]={16898612629,{48,48},{453,820}},sparkle={16898613777,{48,48},{967,0}},wand={16898613869,{48,48},{404,967}},["calendar-minus-2"]={16898612819,{48,48},{147,869}},["copy-minus"]={16898613044,{48,48},{404,869}},["folder-input"]={16898613353,{48,48},{453,869}},["book-image"]={16898612819,{48,48},{771,147}},shirt={16898613777,{48,48},{98,771}},["server-off"]={16898613699,{48,48},{967,955}},["move-up"]={16898613613,{48,48},{869,404}},["plug-2"]={16898613699,{48,48},{869,306}},radio={16898613699,{48,48},{306,918}},brackets={16898612819,{48,48},{98,869}},["calendar-heart"]={16898612819,{48,48},{196,820}},["list-ordered"]={16898613509,{48,48},{710,918}},["mic-off"]={16898613613,{48,48},{918,514}},["arrow-big-left"]={16898612629,{48,48},{98,869}},["square-split-horizontal"]={16898613777,{48,48},{918,404}},["tree-deciduous"]={16898613869,{48,48},{869,563}},["sun-snow"]={16898613777,{48,48},{196,967}},["user-2"]={16898613869,{48,48},{514,967}},["help-circle"]={16898613509,{48,48},{563,869}},["clock-2"]={16898613044,{48,48},{771,404}},["calendar-fold"]={16898612819,{48,48},{820,196}},["fish-off"]={16898613353,{48,48},{967,49}},baby={16898612629,{48,48},{771,808}},leaf={16898613509,{48,48},{918,661}},["fold-vertical"]={16898613353,{48,48},{661,869}},hop={16898613509,{48,48},{196,771}},paperclip={16898613613,{48,48},{918,857}},cigarette={16898612819,{48,48},{967,759}},minus={16898613613,{48,48},{771,196}},["smile-plus"]={16898613777,{48,48},{918,514}},["chevron-right-circle"]={16898612819,{48,48},{967,661}},["star-off"]={16898613777,{48,48},{612,967}},["git-pull-request-closed"]={16898613509,{48,48},{771,514}},["badge-check"]={16898612629,{48,48},{967,147}},["test-tube-2"]={16898613869,{48,48},{771,306}},["kanban-square"]={16898613509,{48,48},{98,918}},["plug-zap"]={16898613699,{48,48},{771,404}},["heading-4"]={16898613509,{48,48},{820,355}},["git-pull-request-create"]={16898613509,{48,48},{820,0}},["replace-all"]={16898613699,{48,48},{771,759}},["receipt-swiss-franc"]={16898613699,{48,48},{967,49}},["square-dashed-bottom-code"]={16898613777,{48,48},{196,820}},["clock-7"]={16898613044,{48,48},{918,514}},["scan-text"]={16898613699,{48,48},{661,967}},["shower-head"]={16898613777,{48,48},{771,355}},["equal-not"]={16898613353,{48,48},{49,771}},["move-down"]={16898613613,{48,48},{196,820}},["ticket-slash"]={16898613869,{48,48},{820,563}},ruler={16898613699,{48,48},{710,869}},["circle-user-round"]={16898613044,{48,48},{0,869}},subscript={16898613777,{48,48},{820,808}},["alarm-minus"]={16898612629,{48,48},{820,514}},["layout-grid"]={16898613509,{48,48},{918,404}},cog={16898613044,{48,48},{918,563}},dog={16898613044,{48,48},{869,808}},swords={16898613777,{48,48},{967,759}},["panel-right-dashed"]={16898613613,{48,48},{967,710}},["ship-wheel"]={16898613777,{48,48},{820,49}},bot={16898612819,{48,48},{869,98}},["trash-2"]={16898613869,{48,48},{257,918}},["chevron-down-square"]={16898612819,{48,48},{918,196}},dot={16898613044,{48,48},{918,808}},["file-symlink"]={16898613353,{48,48},{967,257}},["clipboard-paste"]={16898613044,{48,48},{514,869}},plug={16898613699,{48,48},{404,771}},["book-heart"]={16898612819,{48,48},{820,98}},["circle-parking"]={16898613044,{48,48},{820,514}},["volume-1"]={16898613869,{48,48},{820,759}},["circle-chevron-right"]={16898612819,{48,48},{967,955}},speaker={16898613777,{48,48},{869,98}},timer={16898613869,{48,48},{918,0}},forward={16898613353,{48,48},{771,857}},["file-up"]={16898613353,{48,48},{453,771}},["between-vertical-start"]={16898612819,{48,48},{820,514}},database={16898613044,{48,48},{710,869}},["panel-right"]={16898613613,{48,48},{820,857}},["log-out"]={16898613509,{48,48},{820,955}},["git-branch-plus"]={16898613353,{48,48},{967,857}},["clipboard-minus"]={16898613044,{48,48},{563,820}},["file-text"]={16898613353,{48,48},{869,355}},["arrow-right-circle"]={16898612629,{48,48},{49,967}},["table-rows-split"]={16898613777,{48,48},{869,906}},watch={16898613869,{48,48},{869,759}},["cloud-upload"]={16898613044,{48,48},{967,257}},banknote={16898612629,{48,48},{453,967}},["folder-up"]={16898613353,{48,48},{918,453}},["list-checks"]={16898613509,{48,48},{404,967}},bug={16898612819,{48,48},{257,967}},["circle-chevron-left"]={16898612819,{48,48},{918,955}},["arrow-down"]={16898612629,{48,48},{967,49}},["arrow-up-down"]={16898612629,{48,48},{918,612}},["file-audio"]={16898613353,{48,48},{771,355}},["whole-word"]={16898613869,{48,48},{967,710}},monitor={16898613613,{48,48},{404,820}},["flag-off"]={16898613353,{48,48},{820,196}},["align-right"]={16898612629,{48,48},{918,0}},["circle-stop"]={16898613044,{48,48},{49,820}},infinity={16898613509,{48,48},{661,820}},["arrow-big-down"]={16898612629,{48,48},{196,771}},["circle-parking-off"]={16898613044,{48,48},{257,820}},["calendar-x-2"]={16898612819,{48,48},{453,820}},["user-plus"]={16898613869,{48,48},{918,355}},["move-diagonal-2"]={16898613613,{48,48},{967,49}},["gallery-horizontal-end"]={16898613353,{48,48},{967,710}},["panel-top-dashed"]={16898613613,{48,48},{710,967}},["tram-front"]={16898613869,{48,48},{306,869}},podcast={16898613699,{48,48},{820,612}},["image-minus"]={16898613509,{48,48},{771,453}},["flip-vertical-2"]={16898613353,{48,48},{967,563}},github={16898613509,{48,48},{0,820}},pocket={16898613699,{48,48},{869,563}},printer={16898613699,{48,48},{196,771}},["megaphone-off"]={16898613613,{48,48},{514,820}},["file-bar-chart-2"]={16898613353,{48,48},{869,514}},["arrow-big-right"]={16898612629,{48,48},{0,967}},replace={16898613699,{48,48},{710,820}},["toy-brick"]={16898613869,{48,48},{918,257}},["square-chevron-down"]={16898613777,{48,48},{514,967}},["dice-1"]={16898613044,{48,48},{147,967}},["scan-search"]={16898613699,{48,48},{710,918}},["sticky-note"]={16898613777,{48,48},{918,453}},["shield-check"]={16898613777,{48,48},{820,257}},["hand-metal"]={16898613509,{48,48},{771,612}},["x-circle"]={16898613869,{48,48},{771,955}},["spell-check-2"]={16898613777,{48,48},{771,196}},["minus-square"]={16898613613,{48,48},{820,147}},["box-select"]={16898612819,{48,48},{820,147}},sprout={16898613777,{48,48},{918,306}},waypoints={16898613869,{48,48},{771,857}},["ice-cream-cone"]={16898613509,{48,48},{918,306}},["text-quote"]={16898613869,{48,48},{514,820}},wind={16898613869,{48,48},{820,857}},["layout-panel-left"]={16898613509,{48,48},{453,869}},["circle-percent"]={16898613044,{48,48},{563,771}},["circle-arrow-out-down-right"]={16898612819,{48,48},{967,808}},["square-x"]={16898613777,{48,48},{918,661}},italic={16898613509,{48,48},{967,49}},["step-forward"]={16898613777,{48,48},{196,918}},["a-arrow-down"]={16898612629,{48,48},{771,0}},container={16898613044,{48,48},{967,306}},sticker={16898613777,{48,48},{967,404}},["parking-circle-off"]={16898613613,{48,48},{820,955}},import={16898613509,{48,48},{967,514}},vault={16898613869,{48,48},{98,967}},["square-terminal"]={16898613777,{48,48},{404,918}},["file-music"]={16898613353,{48,48},{771,661}},beef={16898612819,{48,48},{0,771}},["route-off"]={16898613699,{48,48},{453,869}},["timer-reset"]={16898613869,{48,48},{514,869}},["monitor-stop"]={16898613613,{48,48},{820,404}},smile={16898613777,{48,48},{869,563}},["signpost-big"]={16898613777,{48,48},{869,49}},["folder-lock"]={16898613353,{48,48},{967,612}},["square-percent"]={16898613777,{48,48},{661,869}},["navigation-off"]={16898613613,{48,48},{820,710}},["arrow-left"]={16898612629,{48,48},{98,918}},["car-taxi-front"]={16898612819,{48,48},{967,98}},laugh={16898613509,{48,48},{869,196}},["x-square"]={16898613869,{48,48},{918,857}},["step-back"]={16898613777,{48,48},{918,196}},equal={16898613353,{48,48},{0,820}},megaphone={16898613613,{48,48},{869,0}},["calendar-x"]={16898612819,{48,48},{404,869}},egg={16898613353,{48,48},{514,771}},["video-off"]={16898613869,{48,48},{404,918}},["japanese-yen"]={16898613509,{48,48},{820,196}},library={16898613509,{48,48},{710,869}},["file-terminal"]={16898613353,{48,48},{918,306}},quote={16898613699,{48,48},{918,306}},accessibility={16898612629,{48,48},{257,771}},["square-library"]={16898613777,{48,48},{355,918}},salad={16898613699,{48,48},{967,147}},["tally-2"]={16898613869,{48,48},{771,0}},sheet={16898613777,{48,48},{820,0}},["circle-check-big"]={16898612819,{48,48},{918,906}},["map-pinned"]={16898613613,{48,48},{771,306}},["corner-down-left"]={16898613044,{48,48},{771,759}},dribbble={16898613044,{48,48},{918,857}},["pilcrow-square"]={16898613699,{48,48},{771,612}},["lamp-wall-up"]={16898613509,{48,48},{918,612}},["book-dashed"]={16898612819,{48,48},{514,869}},["unfold-vertical"]={16898613869,{48,48},{306,918}},["tree-pine"]={16898613869,{48,48},{771,661}},["receipt-indian-rupee"]={16898613699,{48,48},{661,820}},["check-circle-2"]={16898612819,{48,48},{918,661}},["flask-conical"]={16898613353,{48,48},{453,820}},["package-search"]={16898613613,{48,48},{612,967}},columns={16898613044,{48,48},{661,820}},["folder-sync"]={16898613353,{48,48},{147,967}},fingerprint={16898613353,{48,48},{563,918}},["arrow-up-narrow-wide"]={16898612629,{48,48},{612,918}},frame={16898613353,{48,48},{710,918}},["clock-12"]={16898613044,{48,48},{820,355}},images={16898613509,{48,48},{257,967}},lollipop={16898613509,{48,48},{967,857}},["folder-root"]={16898613353,{48,48},{612,967}},["arrow-left-circle"]={16898612629,{48,48},{918,98}},["lamp-floor"]={16898613509,{48,48},{306,967}},image={16898613509,{48,48},{306,918}},["baggage-claim"]={16898612629,{48,48},{967,196}},bike={16898612819,{48,48},{771,563}},option={16898613613,{48,48},{355,967}},["scroll-text"]={16898613699,{48,48},{967,759}},["toggle-right"]={16898613869,{48,48},{820,98}},["ferris-wheel"]={16898613353,{48,48},{49,820}},["camera-off"]={16898612819,{48,48},{306,967}},["function-square"]={16898613353,{48,48},{453,967}},group={16898613509,{48,48},{820,306}},codesandbox={16898613044,{48,48},{257,967}},["message-circle-question"]={16898613613,{48,48},{869,514}},["tent-tree"]={16898613869,{48,48},{771,49}},["rectangle-horizontal"]={16898613699,{48,48},{196,820}},subtitles={16898613777,{48,48},{771,857}},mail={16898613613,{48,48},{820,0}},["brain-cog"]={16898612819,{48,48},{0,967}},["hand-platter"]={16898613509,{48,48},{612,771}},club={16898613044,{48,48},{771,453}},twitch={16898613869,{48,48},{49,918}},pipette={16898613699,{48,48},{869,49}},user={16898613869,{48,48},{661,869}},["align-vertical-space-around"]={16898612629,{48,48},{869,306}},["test-tubes"]={16898613869,{48,48},{820,514}},wheat={16898613869,{48,48},{453,967}},["axis-3d"]={16898612629,{48,48},{820,759}},folders={16898613353,{48,48},{967,661}},diff={16898613044,{48,48},{869,759}},puzzle={16898613699,{48,48},{49,918}},["package-2"]={16898613613,{48,48},{869,710}},indent={16898613509,{48,48},{771,710}},tangent={16898613869,{48,48},{771,514}},["power-circle"]={16898613699,{48,48},{967,0}},["badge-pound-sterling"]={16898612629,{48,48},{869,759}},["mail-minus"]={16898613509,{48,48},{967,955}},["circle-slash"]={16898613044,{48,48},{98,771}},["app-window"]={16898612629,{48,48},{612,820}},["move-down-right"]={16898613613,{48,48},{820,196}},["parking-square-off"]={16898613613,{48,48},{869,955}},["clipboard-pen"]={16898613044,{48,48},{869,49}},["notepad-text"]={16898613613,{48,48},{147,918}},["signal-low"]={16898613777,{48,48},{612,771}},home={16898613509,{48,48},{820,147}},list={16898613509,{48,48},{869,808}},plus={16898613699,{48,48},{257,918}},["square-arrow-right"]={16898613777,{48,48},{918,563}},["scissors-square-dashed-bottom"]={16898613699,{48,48},{918,759}},["remove-formatting"]={16898613699,{48,48},{967,563}},["bookmark-check"]={16898612819,{48,48},{771,661}},["send-horizontal"]={16898613699,{48,48},{869,906}},["chevrons-left-right"]={16898612819,{48,48},{196,967}},["folder-kanban"]={16898613353,{48,48},{404,918}},["a-arrow-up"]={16898612629,{48,48},{0,771}},["list-restart"]={16898613509,{48,48},{967,196}},["cloud-moon"]={16898613044,{48,48},{820,147}},["book-audio"]={16898612819,{48,48},{771,612}},["vibrate-off"]={16898613869,{48,48},{869,453}},["mail-check"]={16898613509,{48,48},{918,955}},["panel-top-inactive"]={16898613613,{48,48},{967,759}},["file-type-2"]={16898613353,{48,48},{820,404}},["file-code"]={16898613353,{48,48},{869,49}},donut={16898613044,{48,48},{771,906}},["list-todo"]={16898613509,{48,48},{967,453}},dna={16898613044,{48,48},{967,710}},["monitor-down"]={16898613613,{48,48},{98,869}},["cassette-tape"]={16898612819,{48,48},{918,404}},["battery-low"]={16898612629,{48,48},{918,857}},flashlight={16898613353,{48,48},{869,404}},wine={16898613869,{48,48},{710,967}},signpost={16898613777,{48,48},{820,98}},["creative-commons"]={16898613044,{48,48},{147,918}},["globe-2"]={16898613509,{48,48},{257,820}},landmark={16898613509,{48,48},{771,759}},["map-pin"]={16898613613,{48,48},{820,257}},["clipboard-x"]={16898613044,{48,48},{98,820}},loader={16898613509,{48,48},{710,967}},bold={16898612819,{48,48},{355,771}},["dice-2"]={16898613044,{48,48},{967,404}},["file-type"]={16898613353,{48,48},{771,453}},utensils={16898613869,{48,48},{869,196}},beer={16898612819,{48,48},{257,771}},["file-video-2"]={16898613353,{48,48},{404,820}},["chef-hat"]={16898612819,{48,48},{661,918}},rocket={16898613699,{48,48},{918,147}},bird={16898612819,{48,48},{869,0}},["file-x"]={16898613353,{48,48},{869,612}},["move-diagonal"]={16898613613,{48,48},{918,98}},["folder-minus"]={16898613353,{48,48},{918,661}},["door-closed"]={16898613044,{48,48},{710,967}},["bluetooth-connected"]={16898612819,{48,48},{0,869}},["layout-template"]={16898613509,{48,48},{355,967}},["air-vent"]={16898612629,{48,48},{820,0}},["rows-2"]={16898613699,{48,48},{967,612}},["pen-square"]={16898613699,{48,48},{514,771}},["panel-bottom-close"]={16898613613,{48,48},{967,661}},["hand-heart"]={16898613509,{48,48},{869,514}},["file-code-2"]={16898613353,{48,48},{918,0}},["arrow-down-wide-narrow"]={16898612629,{48,48},{563,918}},["clock-10"]={16898613044,{48,48},{918,257}},drumstick={16898613044,{48,48},{869,955}},["disc-2"]={16898613044,{48,48},{820,808}},["skip-forward"]={16898613777,{48,48},{98,820}},skull={16898613777,{48,48},{49,869}},["chevron-left"]={16898612819,{48,48},{404,967}},["split-square-vertical"]={16898613777,{48,48},{49,918}},snowflake={16898613777,{48,48},{771,661}},key={16898613509,{48,48},{869,404}},["clock-11"]={16898613044,{48,48},{869,306}},["sliders-horizontal"]={16898613777,{48,48},{820,355}},["ticket-plus"]={16898613869,{48,48},{869,514}},["square-dashed-bottom"]={16898613777,{48,48},{147,869}},["mic-vocal"]={16898613613,{48,48},{869,563}},["activity-square"]={16898612629,{48,48},{771,514}},["monitor-pause"]={16898613613,{48,48},{0,967}},["book-open-check"]={16898612819,{48,48},{918,257}},projector={16898613699,{48,48},{147,820}},["lasso-select"]={16898613509,{48,48},{967,98}},["folder-open-dot"]={16898613353,{48,48},{869,710}},["align-justify"]={16898612629,{48,48},{563,820}},["log-in"]={16898613509,{48,48},{869,906}},tag={16898613777,{48,48},{967,906}},bus={16898612819,{48,48},{820,661}},["locate-fixed"]={16898613509,{48,48},{967,759}},["bed-single"]={16898612629,{48,48},{967,955}},["dice-4"]={16898613044,{48,48},{453,918}},["file-spreadsheet"]={16898613353,{48,48},{49,918}},["sun-dim"]={16898613777,{48,48},{710,918}},["clipboard-list"]={16898613044,{48,48},{612,771}},gamepad={16898613353,{48,48},{967,759}},["contact-round"]={16898613044,{48,48},{98,918}},["align-horizontal-space-around"]={16898612629,{48,48},{771,612}},["music-2"]={16898613613,{48,48},{404,869}},["hard-hat"]={16898613509,{48,48},{771,147}},["file-badge"]={16898613353,{48,48},{257,869}},["battery-warning"]={16898612629,{48,48},{820,955}},rows={16898613699,{48,48},{820,759}},["arrow-down-from-line"]={16898612629,{48,48},{404,820}},["rows-4"]={16898613699,{48,48},{869,710}},biohazard={16898612819,{48,48},{514,820}},["book-up"]={16898612819,{48,48},{257,918}},["heading-6"]={16898613509,{48,48},{404,771}},["scale-3d"]={16898613699,{48,48},{453,918}},["chevron-down-circle"]={16898612819,{48,48},{967,147}},["mail-x"]={16898613613,{48,48},{514,771}},["square-dashed-mouse-pointer"]={16898613777,{48,48},{49,967}},["user-cog"]={16898613869,{48,48},{147,869}},["satellite-dish"]={16898613699,{48,48},{196,918}},["alarm-clock-minus"]={16898612629,{48,48},{820,257}},pizza={16898613699,{48,48},{820,98}},["pc-case"]={16898613699,{48,48},{257,771}},["move-down-left"]={16898613613,{48,48},{869,147}},school={16898613699,{48,48},{453,967}},orbit={16898613613,{48,48},{967,612}},["file-minus"]={16898613353,{48,48},{820,612}},["rotate-ccw"]={16898613699,{48,48},{967,355}},["align-horizontal-justify-center"]={16898612629,{48,48},{257,869}},["phone-incoming"]={16898613699,{48,48},{820,49}},antenna={16898612629,{48,48},{869,563}},["memory-stick"]={16898613613,{48,48},{771,98}},["scan-eye"]={16898613699,{48,48},{869,759}},["align-center-vertical"]={16898612629,{48,48},{49,820}},["square-check"]={16898613777,{48,48},{563,918}},["align-end-horizontal"]={16898612629,{48,48},{869,257}},["message-square-off"]={16898613613,{48,48},{98,820}},["folder-open"]={16898613353,{48,48},{820,759}},["contact-2"]={16898613044,{48,48},{147,869}},["parking-circle"]={16898613613,{48,48},{967,857}},["menu-square"]={16898613613,{48,48},{98,771}},["hand-coins"]={16898613509,{48,48},{257,869}},["message-circle-code"]={16898613613,{48,48},{869,257}},["arrow-up-wide-narrow"]={16898612629,{48,48},{147,918}},["copy-x"]={16898613044,{48,48},{967,563}},clock={16898613044,{48,48},{771,661}},["file-pen"]={16898613353,{48,48},{563,869}},["git-compare-arrows"]={16898613353,{48,48},{918,955}},["square-arrow-down-right"]={16898613777,{48,48},{771,453}},joystick={16898613509,{48,48},{196,820}},["align-vertical-space-between"]={16898612629,{48,48},{820,355}},["file-pie-chart"]={16898613353,{48,48},{514,918}},gem={16898613353,{48,48},{918,857}},["calendar-plus"]={16898612819,{48,48},{918,355}},["bell-electric"]={16898612819,{48,48},{514,771}},["arrow-down-z-a"]={16898612629,{48,48},{514,967}},bath={16898612629,{48,48},{820,906}},anvil={16898612629,{48,48},{820,612}},["unlink-2"]={16898613869,{48,48},{918,563}},["archive-restore"]={16898612629,{48,48},{514,918}},archive={16898612629,{48,48},{918,49}},["folder-check"]={16898613353,{48,48},{563,967}},["arrow-big-left-dash"]={16898612629,{48,48},{147,820}},["book-key"]={16898612819,{48,48},{147,771}},ribbon={16898613699,{48,48},{967,98}},["package-open"]={16898613613,{48,48},{710,869}},["arrow-down-0-1"]={16898612629,{48,48},{869,355}},["library-big"]={16898613509,{48,48},{820,759}},["file-json"]={16898613353,{48,48},{771,404}},["arrow-down-a-z"]={16898612629,{48,48},{771,453}},["arrow-down-left"]={16898612629,{48,48},{257,967}},["square-scissors"]={16898613777,{48,48},{147,918}},["move-up-left"]={16898613613,{48,48},{967,306}},["arrow-down-up"]={16898612629,{48,48},{612,869}},["folder-heart"]={16898613353,{48,48},{869,453}},["gauge-circle"]={16898613353,{48,48},{820,906}},percent={16898613699,{48,48},{771,563}},["arrow-up-1-0"]={16898612629,{48,48},{355,918}},["arrow-up-a-z"]={16898612629,{48,48},{306,967}},["circle-arrow-right"]={16898612819,{48,48},{820,955}},["panel-bottom-inactive"]={16898613613,{48,48},{869,759}},["arrow-up"]={16898612629,{48,48},{967,355}},asterisk={16898612629,{48,48},{869,453}},["gallery-vertical"]={16898613353,{48,48},{771,906}},["swatch-book"]={16898613777,{48,48},{869,808}},["receipt-cent"]={16898613699,{48,48},{771,710}},["audio-lines"]={16898612629,{48,48},{355,967}},["folder-archive"]={16898613353,{48,48},{612,918}},["folder-symlink"]={16898613353,{48,48},{196,918}},["columns-3"]={16898613044,{48,48},{771,710}},ban={16898612629,{48,48},{196,967}},["message-square-x"]={16898613613,{48,48},{404,771}},["paint-roller"]={16898613613,{48,48},{147,967}},["folder-search-2"]={16898613353,{48,48},{967,147}},fan={16898613353,{48,48},{869,0}},["badge-euro"]={16898612629,{48,48},{196,918}},["badge-info"]={16898612629,{48,48},{918,453}},["building-2"]={16898612819,{48,48},{967,514}},square={16898613777,{48,48},{869,710}},medal={16898613613,{48,48},{563,771}},cake={16898612819,{48,48},{612,869}},["cloud-rain"]={16898613044,{48,48},{147,820}},["maximize-2"]={16898613613,{48,48},{820,514}},shell={16898613777,{48,48},{771,49}},wrench={16898613869,{48,48},{820,906}},badge={16898612629,{48,48},{661,967}},codepen={16898613044,{48,48},{306,918}},["corner-right-down"]={16898613044,{48,48},{563,967}},["flag-triangle-right"]={16898613353,{48,48},{147,869}},network={16898613613,{48,48},{710,820}},["bar-chart-3"]={16898612629,{48,48},{918,759}},bell={16898612819,{48,48},{820,257}},["bar-chart"]={16898612629,{48,48},{967,759}},ratio={16898613699,{48,48},{820,661}},["square-chevron-up"]={16898613777,{48,48},{869,147}},["brick-wall"]={16898612819,{48,48},{918,306}},["user-check"]={16898613869,{48,48},{918,98}},proportions={16898613699,{48,48},{98,869}},["alert-octagon"]={16898612629,{48,48},{820,49}},plane={16898613699,{48,48},{98,820}},["webhook-off"]={16898613869,{48,48},{661,967}},["thermometer-sun"]={16898613869,{48,48},{0,869}},["square-arrow-left"]={16898613777,{48,48},{404,820}},["mouse-pointer"]={16898613613,{48,48},{612,869}},heart={16898613509,{48,48},{661,771}},["test-tube-diagonal"]={16898613869,{48,48},{306,771}},["briefcase-medical"]={16898612819,{48,48},{820,404}},["align-vertical-distribute-start"]={16898612629,{48,48},{98,820}},mailbox={16898613613,{48,48},{771,49}},["bell-off"]={16898612819,{48,48},{771,49}},binary={16898612819,{48,48},{563,771}},["book-open-text"]={16898612819,{48,48},{869,306}},split={16898613777,{48,48},{0,967}},twitter={16898613869,{48,48},{0,967}},calculator={16898612819,{48,48},{563,918}},forklift={16898613353,{48,48},{869,759}},bluetooth={16898612819,{48,48},{771,355}},folder={16898613353,{48,48},{404,967}},["square-kanban"]={16898613777,{48,48},{404,869}},["message-square-diff"]={16898613613,{48,48},{869,49}},["square-sigma"]={16898613777,{48,48},{98,967}},["alarm-plus"]={16898612629,{48,48},{771,563}},star={16898613777,{48,48},{967,147}},["rotate-ccw-square"]={16898613699,{48,48},{98,967}},castle={16898612819,{48,48},{453,869}},["book-down"]={16898612819,{48,48},{918,0}},["file-volume-2"]={16898613353,{48,48},{306,918}},["book-headphones"]={16898612819,{48,48},{869,49}},power={16898613699,{48,48},{820,147}},album={16898612629,{48,48},{514,820}},["book-marked"]={16898612819,{48,48},{49,869}},["book-open"]={16898612819,{48,48},{820,355}},["file-box"]={16898613353,{48,48},{771,612}},["book-text"]={16898612819,{48,48},{404,771}},telescope={16898613869,{48,48},{820,0}},["glass-water"]={16898613509,{48,48},{771,306}},filter={16898613353,{48,48},{612,869}},glasses={16898613509,{48,48},{306,771}},["piggy-bank"]={16898613699,{48,48},{820,563}},["book-type"]={16898612819,{48,48},{355,820}},cuboid={16898613044,{48,48},{355,967}},["cloud-off"]={16898613044,{48,48},{771,196}},["check-check"]={16898612819,{48,48},{967,612}},activity={16898612629,{48,48},{514,771}},axe={16898612629,{48,48},{869,710}},["plane-takeoff"]={16898613699,{48,48},{147,771}},["book-x"]={16898612819,{48,48},{869,563}},["cloud-rain-wind"]={16898613044,{48,48},{196,771}},bookmark={16898612819,{48,48},{514,918}},["zoom-in"]={16898613869,{48,48},{869,955}},["square-pilcrow"]={16898613777,{48,48},{563,967}},["file-axis-3d"]={16898613353,{48,48},{355,771}},["receipt-euro"]={16898613699,{48,48},{710,771}},["brain-circuit"]={16898612819,{48,48},{49,918}},["briefcase-business"]={16898612819,{48,48},{869,355}},["bug-play"]={16898612819,{48,48},{306,918}},["tally-3"]={16898613869,{48,48},{0,771}},["clipboard-type"]={16898613044,{48,48},{147,771}},brush={16898612819,{48,48},{404,820}},["tally-5"]={16898613869,{48,48},{257,771}},["cable-car"]={16898612819,{48,48},{771,710}},cable={16898612819,{48,48},{710,771}},["calendar-check"]={16898612819,{48,48},{967,49}},["user-square-2"]={16898613869,{48,48},{869,661}},["calendar-minus"]={16898612819,{48,48},{98,918}},["calendar-plus-2"]={16898612819,{48,48},{967,306}},linkedin={16898613509,{48,48},{453,918}},["life-buoy"]={16898613509,{48,48},{661,918}},["calendar-search"]={16898612819,{48,48},{820,453}},["circle-chevron-down"]={16898612819,{48,48},{967,906}},["volume-2"]={16898613869,{48,48},{771,808}},["battery-charging"]={16898612629,{48,48},{771,955}},["russian-ruble"]={16898613699,{48,48},{661,918}},["square-arrow-up-left"]={16898613777,{48,48},{869,612}},["earth-lock"]={16898613353,{48,48},{771,0}},footprints={16898613353,{48,48},{918,710}},hash={16898613509,{48,48},{147,771}},building={16898612819,{48,48},{918,563}},ear={16898613044,{48,48},{967,955}},caravan={16898612819,{48,48},{869,196}},carrot={16898612819,{48,48},{196,869}},cherry={16898612819,{48,48},{612,967}},["user-check-2"]={16898613869,{48,48},{967,49}},["shield-plus"]={16898613777,{48,48},{771,563}},moon={16898613613,{48,48},{306,918}},["bell-minus"]={16898612819,{48,48},{820,0}},["image-up"]={16898613509,{48,48},{355,869}},["case-sensitive"]={16898612819,{48,48},{98,967}},drum={16898613044,{48,48},{918,906}},["arrow-up-z-a"]={16898612629,{48,48},{98,967}},sun={16898613777,{48,48},{967,453}},["gantt-chart-square"]={16898613353,{48,48},{918,808}},["align-horizontal-justify-start"]={16898612629,{48,48},{820,563}},["file-key"]={16898613353,{48,48},{355,820}},["monitor-smartphone"]={16898613613,{48,48},{918,306}},["move-3d"]={16898613613,{48,48},{514,967}},["scissors-line-dashed"]={16898613699,{48,48},{967,710}},["text-select"]={16898613869,{48,48},{820,49}},["case-lower"]={16898612819,{48,48},{147,918}},["plus-circle"]={16898613699,{48,48},{355,820}},["ticket-check"]={16898613869,{48,48},{355,771}},pyramid={16898613699,{48,48},{0,967}},["chevron-last"]={16898612819,{48,48},{967,404}},["user-cog-2"]={16898613869,{48,48},{196,820}},["refresh-cw-off"]={16898613699,{48,48},{453,820}},piano={16898613699,{48,48},{771,355}},["picture-in-picture-2"]={16898613699,{48,48},{306,820}},["user-round"]={16898613869,{48,48},{967,563}},["flower-2"]={16898613353,{48,48},{869,661}},["chevron-up-square"]={16898612819,{48,48},{771,857}},["chevrons-left"]={16898612819,{48,48},{967,453}},["chevrons-right-left"]={16898612819,{48,48},{453,967}},car={16898612819,{48,48},{918,147}},["keyboard-music"]={16898613509,{48,48},{820,453}},["star-half"]={16898613777,{48,48},{661,918}},mouse={16898613613,{48,48},{563,918}},lock={16898613509,{48,48},{918,857}},["pencil-line"]={16898613699,{48,48},{49,771}},mails={16898613613,{48,48},{49,771}},film={16898613353,{48,48},{710,771}},tablet={16898613777,{48,48},{918,906}},["circle-arrow-left"]={16898612819,{48,48},{820,906}},pi={16898613699,{48,48},{820,306}},trash={16898613869,{48,48},{918,514}},dock={16898613044,{48,48},{918,759}},["hdmi-port"]={16898613509,{48,48},{49,869}},["circle-arrow-out-up-left"]={16898612819,{48,48},{918,857}},["case-upper"]={16898612819,{48,48},{967,355}},["circle-arrow-out-up-right"]={16898612819,{48,48},{869,906}},tags={16898613777,{48,48},{918,955}},croissant={16898613044,{48,48},{967,355}},["circle-check"]={16898612819,{48,48},{869,955}},bomb={16898612819,{48,48},{257,869}},diameter={16898613044,{48,48},{967,147}},["circle-dashed"]={16898613044,{48,48},{0,771}},["bar-chart-big"]={16898612629,{48,48},{820,857}},["upload-cloud"]={16898613869,{48,48},{661,820}},["code-xml"]={16898613044,{48,48},{404,820}},divide={16898613044,{48,48},{967,453}},grape={16898613509,{48,48},{820,49}},["play-square"]={16898613699,{48,48},{0,918}},["party-popper"]={16898613613,{48,48},{918,955}},["circle-ellipsis"]={16898613044,{48,48},{820,0}},file={16898613353,{48,48},{820,661}},["user-circle-2"]={16898613869,{48,48},{869,147}},truck={16898613869,{48,48},{771,196}},["cloud-sun-rain"]={16898613044,{48,48},{49,918}},["calendar-range"]={16898612819,{48,48},{869,404}},contact={16898613044,{48,48},{49,967}},["zap-off"]={16898613869,{48,48},{967,857}},["square-check-big"]={16898613777,{48,48},{612,869}},["circle-user"]={16898613044,{48,48},{869,257}},["layout-panel-top"]={16898613509,{48,48},{404,918}},["roller-coaster"]={16898613699,{48,48},{196,869}},["laptop-minimal"]={16898613509,{48,48},{612,918}},["table-properties"]={16898613777,{48,48},{918,857}},["clipboard-check"]={16898613044,{48,48},{869,514}},layout={16898613509,{48,48},{967,612}},["indent-decrease"]={16898613509,{48,48},{869,612}},cookie={16898613044,{48,48},{869,404}},["message-square-more"]={16898613613,{48,48},{147,771}},clipboard={16898613044,{48,48},{49,869}},euro={16898613353,{48,48},{771,306}},sparkles={16898613777,{48,48},{918,49}},["heart-off"]={16898613509,{48,48},{820,612}},vibrate={16898613869,{48,48},{453,869}},["clock-3"]={16898613044,{48,48},{404,771}},["move-horizontal"]={16898613613,{48,48},{147,869}},["file-sliders"]={16898613353,{48,48},{98,869}},frown={16898613353,{48,48},{967,196}},["move-up-right"]={16898613613,{48,48},{918,355}},["cup-soda"]={16898613044,{48,48},{967,612}},["stretch-vertical"]={16898613777,{48,48},{918,710}},["refresh-cw"]={16898613699,{48,48},{404,869}},sword={16898613777,{48,48},{710,967}},["cloud-drizzle"]={16898613044,{48,48},{563,869}},["laptop-2"]={16898613509,{48,48},{661,869}},earth={16898613353,{48,48},{0,771}},slice={16898613777,{48,48},{869,306}},["land-plot"]={16898613509,{48,48},{820,710}},milk={16898613613,{48,48},{514,918}},["git-pull-request-draft"]={16898613509,{48,48},{771,49}},crown={16898613044,{48,48},{404,918}},["wallet-2"]={16898613869,{48,48},{967,147}},settings={16898613777,{48,48},{771,257}},["rotate-cw-square"]={16898613699,{48,48},{918,404}},atom={16898612629,{48,48},{404,918}},["package-x"]={16898613613,{48,48},{967,147}},["bed-double"]={16898612629,{48,48},{918,955}},["ice-cream-bowl"]={16898613509,{48,48},{967,257}},["circle-dot"]={16898613044,{48,48},{514,771}},["grip-horizontal"]={16898613509,{48,48},{49,820}},cloudy={16898613044,{48,48},{869,355}},["text-cursor-input"]={16898613869,{48,48},{771,563}},["folder-git-2"]={16898613353,{48,48},{967,355}},["message-square-code"]={16898613613,{48,48},{514,869}},clover={16898613044,{48,48},{820,404}},["arrow-down-narrow-wide"]={16898612629,{48,48},{967,514}},code={16898613044,{48,48},{355,869}},["user-x"]={16898613869,{48,48},{710,820}},coins={16898613044,{48,48},{869,612}},dumbbell={16898613044,{48,48},{967,906}},weight={16898613869,{48,48},{196,967}},["alert-triangle"]={16898612629,{48,48},{771,98}},expand={16898613353,{48,48},{306,771}},scale={16898613699,{48,48},{404,967}},component={16898613044,{48,48},{967,49}},["flashlight-off"]={16898613353,{48,48},{918,355}},["panel-top-open"]={16898613613,{48,48},{918,808}},computer={16898613044,{48,48},{918,98}},construction={16898613044,{48,48},{196,820}},notebook={16898613613,{48,48},{869,196}},["power-square"]={16898613699,{48,48},{869,98}},["copy-slash"]={16898613044,{48,48},{306,967}},["square-menu"]={16898613777,{48,48},{967,563}},["circle-play"]={16898613044,{48,48},{514,820}},wallet={16898613869,{48,48},{147,967}},laptop={16898613509,{48,48},{563,967}},["scan-line"]={16898613699,{48,48},{771,857}},["clock-4"]={16898613044,{48,48},{355,820}},["square-arrow-up"]={16898613777,{48,48},{771,710}},copyright={16898613044,{48,48},{820,710}},["chevron-down"]={16898612819,{48,48},{196,918}},["unlock-keyhole"]={16898613869,{48,48},{820,661}},["clock-1"]={16898613044,{48,48},{0,918}},["align-horizontal-distribute-start"]={16898612629,{48,48},{306,820}},["arrow-down-to-line"]={16898612629,{48,48},{661,820}},["mouse-pointer-2"]={16898613613,{48,48},{820,661}},["refresh-ccw"]={16898613699,{48,48},{820,453}},["venetian-mask"]={16898613869,{48,48},{918,404}},["calendar-check-2"]={16898612819,{48,48},{514,967}},["arrow-down-square"]={16898612629,{48,48},{771,710}},spline={16898613777,{48,48},{147,820}},banana={16898612629,{48,48},{967,453}},["git-pull-request-create-arrow"]={16898613509,{48,48},{514,771}},crosshair={16898613044,{48,48},{453,869}},["list-video"]={16898613509,{48,48},{967,710}},["arrow-right-left"]={16898612629,{48,48},{918,355}},["bar-chart-4"]={16898612629,{48,48},{869,808}},["dice-3"]={16898613044,{48,48},{918,453}},["dice-5"]={16898613044,{48,48},{404,967}},["dice-6"]={16898613044,{48,48},{967,661}},["square-plus"]={16898613777,{48,48},{918,147}},["timer-off"]={16898613869,{48,48},{563,820}},["arrow-big-right-dash"]={16898612629,{48,48},{49,918}},["radio-receiver"]={16898613699,{48,48},{404,820}},shield={16898613777,{48,48},{869,0}},["square-equal"]={16898613777,{48,48},{869,404}},backpack={16898612629,{48,48},{710,869}},download={16898613044,{48,48},{820,906}},["drafting-compass"]={16898613044,{48,48},{771,955}},youtube={16898613869,{48,48},{820,955}},["file-plus-2"]={16898613353,{48,48},{967,0}},["message-circle-more"]={16898613613,{48,48},{355,771}},["arrow-down-right"]={16898612629,{48,48},{820,661}},["loader-circle"]={16898613509,{48,48},{771,906}},receipt={16898613699,{48,48},{869,147}},["egg-off"]={16898613353,{48,48},{771,514}},bitcoin={16898612819,{48,48},{820,49}},["eye-off"]={16898613353,{48,48},{820,514}},factory={16898613353,{48,48},{514,820}},["fast-forward"]={16898613353,{48,48},{820,49}},["image-off"]={16898613509,{48,48},{453,771}},["file-audio-2"]={16898613353,{48,48},{820,306}},braces={16898612819,{48,48},{147,820}},cone={16898613044,{48,48},{820,196}},["wand-sparkles"]={16898613869,{48,48},{453,918}},["square-chevron-right"]={16898613777,{48,48},{918,98}},navigation={16898613613,{48,48},{771,759}},["file-check"]={16898613353,{48,48},{563,820}},["file-cog"]={16898613353,{48,48},{820,98}},["file-diff"]={16898613353,{48,48},{771,147}},["file-digit"]={16898613353,{48,48},{147,771}},["power-off"]={16898613699,{48,48},{918,49}},["align-vertical-distribute-center"]={16898612629,{48,48},{771,147}},["tally-1"]={16898613777,{48,48},{967,955}},ampersand={16898612629,{48,48},{404,771}},["line-chart"]={16898613509,{48,48},{196,918}},["shopping-cart"]={16898613777,{48,48},{869,257}},["align-vertical-justify-end"]={16898612629,{48,48},{0,918}},eraser={16898613353,{48,48},{820,257}},["alarm-smoke"]={16898612629,{48,48},{563,771}},["file-line-chart"]={16898613353,{48,48},{306,869}},["file-input"]={16898613353,{48,48},{869,306}},["clock-8"]={16898613044,{48,48},{869,563}},["server-cog"]={16898613699,{48,48},{967,906}},["cloud-cog"]={16898613044,{48,48},{661,771}},blend={16898612819,{48,48},{771,98}},["search-x"]={16898613699,{48,48},{967,808}},["radio-tower"]={16898613699,{48,48},{355,869}},["list-tree"]={16898613509,{48,48},{453,967}},droplet={16898613044,{48,48},{820,955}},heater={16898613509,{48,48},{612,820}},eye={16898613353,{48,48},{771,563}},battery={16898612629,{48,48},{967,857}},lamp={16898613509,{48,48},{869,661}},["link-2-off"]={16898613509,{48,48},{147,967}},["panel-top"]={16898613613,{48,48},{869,857}},["file-volume"]={16898613353,{48,48},{257,967}},["file-x-2"]={16898613353,{48,48},{918,563}},["circle-equal"]={16898613044,{48,48},{771,49}},["flag-triangle-left"]={16898613353,{48,48},{196,820}},flower={16898613353,{48,48},{820,710}},["fold-horizontal"]={16898613353,{48,48},{710,820}},["folder-closed"]={16898613353,{48,48},{918,147}},["folder-dot"]={16898613353,{48,48},{196,869}},["arrow-up-right"]={16898612629,{48,48},{918,147}},router={16898613699,{48,48},{355,967}},["leafy-green"]={16898613509,{48,48},{869,710}},["message-square-dot"]={16898613613,{48,48},{820,98}},focus={16898613353,{48,48},{771,759}},copyleft={16898613044,{48,48},{869,661}},["folder-x"]={16898613353,{48,48},{453,918}},["form-input"]={16898613353,{48,48},{820,808}},["minimize-2"]={16898613613,{48,48},{967,0}},regex={16898613699,{48,48},{306,967}},["gallery-horizontal"]={16898613353,{48,48},{918,759}},university={16898613869,{48,48},{967,514}},["gallery-vertical-end"]={16898613353,{48,48},{820,857}},["file-image"]={16898613353,{48,48},{918,257}},["at-sign"]={16898612629,{48,48},{453,869}},palette={16898613613,{48,48},{453,918}},["user-plus-2"]={16898613869,{48,48},{967,306}},["gallery-thumbnails"]={16898613353,{48,48},{869,808}},["arrow-down-right-from-circle"]={16898612629,{48,48},{918,563}},cpu={16898613044,{48,48},{196,869}},["split-square-horizontal"]={16898613777,{48,48},{98,869}},["thumbs-down"]={16898613869,{48,48},{820,306}},merge={16898613613,{48,48},{0,869}},ghost={16898613353,{48,48},{869,906}},["git-compare"]={16898613353,{48,48},{967,955}},["git-fork"]={16898613509,{48,48},{771,0}},hospital={16898613509,{48,48},{147,820}},["git-merge"]={16898613509,{48,48},{771,257}},["folder-edit"]={16898613353,{48,48},{98,967}},["thumbs-up"]={16898613869,{48,48},{771,355}},globe={16898613509,{48,48},{771,563}},palmtree={16898613613,{48,48},{404,967}},["bug-off"]={16898612819,{48,48},{355,869}},kanban={16898613509,{48,48},{49,967}},["thermometer-snowflake"]={16898613869,{48,48},{49,820}},apple={16898612629,{48,48},{563,869}},["wine-off"]={16898613869,{48,48},{771,906}},["graduation-cap"]={16898613509,{48,48},{869,0}},["hand-helping"]={16898613509,{48,48},{820,563}},hand={16898613509,{48,48},{563,820}},["square-bottom-dashed-scissors"]={16898613777,{48,48},{661,820}},stamp={16898613777,{48,48},{710,869}},["candy-off"]={16898612819,{48,48},{820,710}},["plug-zap-2"]={16898613699,{48,48},{820,355}},["heading-2"]={16898613509,{48,48},{918,257}},["square-activity"]={16898613777,{48,48},{869,355}},["circle-gauge"]={16898613044,{48,48},{0,820}},["cigarette-off"]={16898612819,{48,48},{710,967}},["arrow-up-0-1"]={16898612629,{48,48},{404,869}},["message-circle"]={16898613613,{48,48},{563,820}},["undo-2"]={16898613869,{48,48},{771,453}},headset={16898613509,{48,48},{257,918}},["heart-crack"]={16898613509,{48,48},{918,514}},["git-branch"]={16898613353,{48,48},{918,906}},shovel={16898613777,{48,48},{820,306}},share={16898613777,{48,48},{514,771}},["wallet-cards"]={16898613869,{48,48},{918,196}},["square-arrow-out-down-right"]={16898613777,{48,48},{306,918}},grip={16898613509,{48,48},{869,257}},["monitor-speaker"]={16898613613,{48,48},{869,355}},save={16898613699,{48,48},{918,453}},["cloud-snow"]={16898613044,{48,48},{98,869}},["file-question"]={16898613353,{48,48},{869,98}},["arrow-big-up-dash"]={16898612629,{48,48},{967,257}},coffee={16898613044,{48,48},{967,514}},["image-down"]={16898613509,{48,48},{820,404}},["beer-off"]={16898612819,{48,48},{771,257}},["file-bar-chart"]={16898613353,{48,48},{820,563}},["bar-chart-2"]={16898612629,{48,48},{967,710}},["lock-keyhole-open"]={16898613509,{48,48},{820,906}},["chevrons-down-up"]={16898612819,{48,48},{661,967}},["clipboard-plus"]={16898613044,{48,48},{820,98}},["monitor-up"]={16898613613,{48,48},{771,453}},["list-end"]={16898613509,{48,48},{918,710}},["square-radical"]={16898613777,{48,48},{196,869}},play={16898613699,{48,48},{918,257}},["chevrons-right"]={16898612819,{48,48},{967,710}},["file-badge-2"]={16898613353,{48,48},{306,820}},["message-square-reply"]={16898613613,{48,48},{918,257}},["corner-down-right"]={16898613044,{48,48},{710,820}},phone={16898613699,{48,48},{0,869}},["arrow-left-to-line"]={16898612629,{48,48},{147,869}},["lamp-wall-down"]={16898613509,{48,48},{967,563}},["link-2"]={16898613509,{48,48},{967,404}},["repeat"]={16898613699,{48,48},{820,710}},["ellipsis-vertical"]={16898613353,{48,48},{820,0}},snail={16898613777,{48,48},{820,612}},["paint-bucket"]={16898613613,{48,48},{196,918}},["square-parking"]={16898613777,{48,48},{771,759}},["align-horizontal-justify-end"]={16898612629,{48,48},{869,514}},lasso={16898613509,{48,48},{918,147}},["align-vertical-distribute-end"]={16898612629,{48,48},{147,771}},soup={16898613777,{48,48},{612,820}},airplay={16898612629,{48,48},{771,49}},["layout-dashboard"]={16898613509,{48,48},{967,355}},["heading-1"]={16898613509,{48,48},{0,918}},["circle-x"]={16898613044,{48,48},{820,306}},["monitor-x"]={16898613613,{48,48},{453,771}},["octagon-pause"]={16898613613,{48,48},{869,453}},["library-square"]={16898613509,{48,48},{771,808}},["square-pen"]={16898613777,{48,48},{710,820}},["heart-pulse"]={16898613509,{48,48},{771,661}},["database-backup"]={16898613044,{48,48},{820,759}},["gantt-chart"]={16898613353,{48,48},{869,857}},octagon={16898613613,{48,48},{404,918}},ticket={16898613869,{48,48},{612,771}},["message-square"]={16898613613,{48,48},{355,820}},["list-filter"]={16898613509,{48,48},{869,759}},["train-front"]={16898613869,{48,48},{404,771}},["spray-can"]={16898613777,{48,48},{967,257}},["list-music"]={16898613509,{48,48},{771,857}},["utility-pole"]={16898613869,{48,48},{196,869}},["list-plus"]={16898613509,{48,48},{661,967}},["screen-share"]={16898613699,{48,48},{710,967}},["file-clock"]={16898613353,{48,48},{514,869}},["list-collapse"]={16898613509,{48,48},{967,661}},gauge={16898613353,{48,48},{771,955}},store={16898613777,{48,48},{404,967}},["circle-arrow-down"]={16898612819,{48,48},{869,857}},["notebook-pen"]={16898613613,{48,48},{563,967}},["egg-fried"]={16898613353,{48,48},{257,771}},["calendar-off"]={16898612819,{48,48},{49,967}},["locate-off"]={16898613509,{48,48},{918,808}},["corner-right-up"]={16898613044,{48,48},{967,98}},locate={16898613509,{48,48},{869,857}},["ticket-x"]={16898613869,{48,48},{771,612}},["user-round-plus"]={16898613869,{48,48},{404,869}},["panel-left-close"]={16898613613,{48,48},{710,918}},["lock-keyhole"]={16898613509,{48,48},{771,955}},["lock-open"]={16898613509,{48,48},{967,808}},["user-round-minus"]={16898613869,{48,48},{453,820}},["m-square"]={16898613509,{48,48},{869,955}},magnet={16898613509,{48,48},{967,906}},["message-square-text"]={16898613613,{48,48},{820,355}},["mail-plus"]={16898613613,{48,48},{0,771}},["mail-search"]={16898613613,{48,48},{257,771}},move={16898613613,{48,48},{453,820}},["play-circle"]={16898613699,{48,48},{49,869}},["git-commit-vertical"]={16898613353,{48,48},{967,906}},slash={16898613777,{48,48},{918,257}},["map-pin-off"]={16898613613,{48,48},{0,820}},aperture={16898612629,{48,48},{771,661}},["image-plus"]={16898613509,{48,48},{404,820}},["message-circle-heart"]={16898613613,{48,48},{771,355}},syringe={16898613777,{48,48},{918,808}},info={16898613509,{48,48},{612,869}},["rows-3"]={16898613699,{48,48},{918,661}},check={16898612819,{48,48},{710,869}},["text-search"]={16898613869,{48,48},{869,0}},["square-slash"]={16898613777,{48,48},{967,355}},sandwich={16898613699,{48,48},{918,196}},["settings-2"]={16898613777,{48,48},{0,771}},["file-stack"]={16898613353,{48,48},{0,967}},["external-link"]={16898613353,{48,48},{257,820}},["ice-cream-2"]={16898613509,{48,48},{0,967}},["file-archive"]={16898613353,{48,48},{869,257}},["signal-high"]={16898613777,{48,48},{771,612}},inbox={16898613509,{48,48},{918,563}},["flip-horizontal-2"]={16898613353,{48,48},{355,918}},["traffic-cone"]={16898613869,{48,48},{820,355}},["file-signature"]={16898613353,{48,48},{147,820}},["align-horizontal-space-between"]={16898612629,{48,48},{612,771}},["message-circle-dashed"]={16898613613,{48,48},{820,306}},maximize={16898613613,{48,48},{771,563}},["database-zap"]={16898613044,{48,48},{771,808}},droplets={16898613044,{48,48},{967,857}},["fish-symbol"]={16898613353,{48,48},{918,98}},["message-circle-off"]={16898613613,{48,48},{306,820}},["wheat-off"]={16898613869,{48,48},{967,453}},["layout-list"]={16898613509,{48,48},{869,453}},["file-search"]={16898613353,{48,48},{196,771}},["download-cloud"]={16898613044,{48,48},{869,857}},["alarm-clock-plus"]={16898612629,{48,48},{306,771}},["circle-dollar-sign"]={16898613044,{48,48},{257,771}},usb={16898613869,{48,48},{563,918}},["arrow-up-square"]={16898612629,{48,48},{869,196}},["receipt-pound-sterling"]={16898613699,{48,48},{563,918}},scan={16898613699,{48,48},{967,196}},["heading-5"]={16898613509,{48,48},{771,404}},undo={16898613869,{48,48},{404,820}},["file-search-2"]={16898613353,{48,48},{771,196}},minimize={16898613613,{48,48},{918,49}},["redo-2"]={16898613699,{48,48},{49,967}},thermometer={16898613869,{48,48},{869,257}},["filter-x"]={16898613353,{48,48},{661,820}},["sliders-vertical"]={16898613777,{48,48},{771,404}},["boom-box"]={16898612819,{48,48},{967,0}},["table-2"]={16898613777,{48,48},{869,857}},["touchpad-off"]={16898613869,{48,48},{98,820}},["diamond-percent"]={16898613044,{48,48},{918,196}},brain={16898612819,{48,48},{967,257}},microwave={16898613613,{48,48},{661,771}},["arrow-down-left-square"]={16898612629,{48,48},{306,918}},["user-round-cog"]={16898613869,{48,48},{820,453}},["octagon-x"]={16898613613,{48,48},{453,869}},languages={16898613509,{48,48},{710,820}},["file-json-2"]={16898613353,{48,48},{820,355}},["alarm-clock-check"]={16898612629,{48,48},{0,820}},guitar={16898613509,{48,48},{771,355}},anchor={16898612629,{48,48},{306,869}},["text-cursor"]={16898613869,{48,48},{563,771}},["search-code"]={16898613699,{48,48},{820,906}},["square-parking-off"]={16898613777,{48,48},{820,710}},["notebook-text"]={16898613613,{48,48},{918,147}},["arrow-right-to-line"]={16898612629,{48,48},{820,453}},["ticket-minus"]={16898613869,{48,48},{306,820}},["tally-4"]={16898613869,{48,48},{771,257}},heading={16898613509,{48,48},{355,820}},wallpaper={16898613869,{48,48},{967,404}},["door-open"]={16898613044,{48,48},{967,759}},["arrow-down-circle"]={16898612629,{48,48},{453,771}},["monitor-play"]={16898613613,{48,48},{967,257}},["key-square"]={16898613509,{48,48},{918,355}},["monitor-off"]={16898613613,{48,48},{49,918}},["pocket-knife"]={16898613699,{48,48},{918,514}},["book-copy"]={16898612819,{48,48},{563,820}},["panel-left-inactive"]={16898613613,{48,48},{967,196}},["car-front"]={16898612819,{48,48},{563,967}},["file-video"]={16898613353,{48,48},{355,869}},["reply-all"]={16898613699,{48,48},{661,869}},["cloud-moon-rain"]={16898613044,{48,48},{869,98}},["zoom-out"]={16898613869,{48,48},{967,906}},["search-slash"]={16898613699,{48,48},{771,955}},["notepad-text-dashed"]={16898613613,{48,48},{196,869}},["circle-alert"]={16898612819,{48,48},{918,808}},briefcase={16898612819,{48,48},{771,453}},["list-start"]={16898613509,{48,48},{196,967}},["more-vertical"]={16898613613,{48,48},{967,514}},["a-large-small"]={16898612629,{48,48},{771,257}},tractor={16898613869,{48,48},{869,306}},waves={16898613869,{48,48},{820,808}},["folder-cog"]={16898613353,{48,48},{869,196}},["code-2"]={16898613044,{48,48},{453,771}},["clock-5"]={16898613044,{48,48},{306,869}},vote={16898613869,{48,48},{612,967}},["shield-question"]={16898613777,{48,48},{563,771}},["arrow-right-from-line"]={16898612629,{48,48},{967,306}},["flame-kindling"]={16898613353,{48,48},{49,967}},["square-power"]={16898613777,{48,48},{869,196}},["circle-help"]={16898613044,{48,48},{820,257}},["bring-to-front"]={16898612819,{48,48},{453,771}},["move-right"]={16898613613,{48,48},{49,967}},figma={16898613353,{48,48},{0,869}},["bell-plus"]={16898612819,{48,48},{49,771}},sailboat={16898613699,{48,48},{612,967}},["hard-drive-upload"]={16898613509,{48,48},{869,49}},["pie-chart"]={16898613699,{48,48},{869,514}},meh={16898613613,{48,48},{820,49}},["mail-warning"]={16898613613,{48,48},{771,514}},["music-3"]={16898613613,{48,48},{355,918}},["pause-circle"]={16898613613,{48,48},{967,955}},["panels-right-bottom"]={16898613613,{48,48},{771,955}},["file-edit"]={16898613353,{48,48},{49,869}},redo={16898613699,{48,48},{918,355}},["file-lock"]={16898613353,{48,48},{918,514}},["square-user"]={16898613777,{48,48},{967,612}},["circle-fading-plus"]={16898613044,{48,48},{49,771}},workflow={16898613869,{48,48},{967,759}},["undo-dot"]={16898613869,{48,48},{453,771}},target={16898613869,{48,48},{514,771}},tablets={16898613777,{48,48},{869,955}},radar={16898613699,{48,48},{820,404}},drama={16898613044,{48,48},{967,808}},["signal-medium"]={16898613777,{48,48},{563,820}},baseline={16898612629,{48,48},{869,857}},martini={16898613613,{48,48},{257,820}},contrast={16898613044,{48,48},{918,355}},pickaxe={16898613699,{48,48},{355,771}},["square-divide"]={16898613777,{48,48},{967,306}},["chevron-left-circle"]={16898612819,{48,48},{918,453}},["book-check"]={16898612819,{48,48},{612,771}},["scan-barcode"]={16898613699,{48,48},{918,710}},["book-lock"]={16898612819,{48,48},{98,820}},["panel-right-inactive"]={16898613613,{48,48},{918,759}},refrigerator={16898613699,{48,48},{355,918}},["divide-circle"]={16898613044,{48,48},{967,196}},["package-plus"]={16898613613,{48,48},{661,918}},["mic-2"]={16898613613,{48,48},{257,918}},["hop-off"]={16898613509,{48,48},{771,196}},warehouse={16898613869,{48,48},{967,661}},["plus-square"]={16898613699,{48,48},{306,869}},["square-arrow-out-up-left"]={16898613777,{48,48},{257,967}},["save-all"]={16898613699,{48,48},{967,404}},candy={16898612819,{48,48},{771,759}},["iteration-ccw"]={16898613509,{48,48},{918,98}},["corner-left-down"]={16898613044,{48,48},{661,869}},paintbrush={16898613613,{48,48},{918,453}},["cloud-lightning"]={16898613044,{48,48},{918,49}},["circle-slash-2"]={16898613044,{48,48},{771,98}},["layers-3"]={16898613509,{48,48},{147,918}},["credit-card"]={16898613044,{48,48},{98,967}},["ear-off"]={16898613044,{48,48},{918,955}},["git-commit-horizontal"]={16898613353,{48,48},{869,955}},["panel-bottom"]={16898613613,{48,48},{771,857}},["square-code"]={16898613777,{48,48},{820,196}},["panel-bottom-open"]={16898613613,{48,48},{820,808}},["kanban-square-dashed"]={16898613509,{48,48},{147,869}},["circle-pause"]={16898613044,{48,48},{771,563}},["panel-top-close"]={16898613613,{48,48},{771,906}},ambulance={16898612629,{48,48},{771,404}},["trending-up"]={16898613869,{48,48},{514,918}},["bookmark-x"]={16898612819,{48,48},{563,869}},["clock-9"]={16898613044,{48,48},{820,612}},pen={16898613699,{48,48},{771,49}},["smartphone-nfc"]={16898613777,{48,48},{306,869}},["candy-cane"]={16898612819,{48,48},{869,661}},unlink={16898613869,{48,48},{869,612}},["parking-meter"]={16898613613,{48,48},{918,906}},["gamepad-2"]={16898613353,{48,48},{710,967}},["user-round-search"]={16898613869,{48,48},{355,918}},["parking-square"]={16898613613,{48,48},{967,906}},["paw-print"]={16898613699,{48,48},{771,257}},["arrow-down-right-square"]={16898612629,{48,48},{869,612}},["square-split-vertical"]={16898613777,{48,48},{869,453}},["circle-off"]={16898613044,{48,48},{306,771}},dessert={16898613044,{48,48},{612,967}},eclipse={16898613353,{48,48},{771,257}},squirrel={16898613777,{48,48},{771,808}},["percent-circle"]={16898613699,{48,48},{306,771}},cylinder={16898613044,{48,48},{869,710}},["badge-japanese-yen"]={16898612629,{48,48},{453,918}},["circle-divide"]={16898613044,{48,48},{771,257}},["receipt-text"]={16898613699,{48,48},{918,98}},["square-pi"]={16898613777,{48,48},{612,918}},["align-center-horizontal"]={16898612629,{48,48},{98,771}},["phone-off"]={16898613699,{48,48},{98,771}},["pi-square"]={16898613699,{48,48},{869,257}},["file-output"]={16898613353,{48,48},{661,771}},["disc-album"]={16898613044,{48,48},{710,918}},["percent-square"]={16898613699,{48,48},{820,514}},clapperboard={16898613044,{48,48},{257,869}},captions={16898612819,{48,48},{612,918}},["wallet-minimal"]={16898613869,{48,48},{196,918}},layers={16898613509,{48,48},{98,967}},["umbrella-off"]={16898613869,{48,48},{918,306}},["badge-alert"]={16898612629,{48,48},{661,918}},["arrow-down-left-from-circle"]={16898612629,{48,48},{355,869}},["folder-pen"]={16898613353,{48,48},{710,869}},cross={16898613044,{48,48},{869,453}},["alarm-check"]={16898612629,{48,48},{49,771}},["chevron-right"]={16898612819,{48,48},{869,759}},pill={16898613699,{48,48},{563,820}},["square-arrow-down-left"]={16898613777,{48,48},{820,404}},["share-2"]={16898613777,{48,48},{771,514}},["arrow-up-from-dot"]={16898612629,{48,48},{869,661}},["pin-off"]={16898613699,{48,48},{514,869}},["align-vertical-justify-start"]={16898612629,{48,48},{918,257}},combine={16898613044,{48,48},{612,869}},["tv-2"]={16898613869,{48,48},{147,820}},mountain={16898613613,{48,48},{869,612}},cast={16898612819,{48,48},{869,453}},["indent-increase"]={16898613509,{48,48},{820,661}},currency={16898613044,{48,48},{918,661}},["shield-ban"]={16898613777,{48,48},{0,820}},["message-circle-reply"]={16898613613,{48,48},{820,563}},["corner-left-up"]={16898613044,{48,48},{612,918}},["triangle-right"]={16898613869,{48,48},{918,49}},["folder-clock"]={16898613353,{48,48},{967,98}},link={16898613509,{48,48},{918,453}},["pound-sterling"]={16898613699,{48,48},{514,918}},type={16898613869,{48,48},{967,257}},webhook={16898613869,{48,48},{967,196}},barcode={16898612629,{48,48},{918,808}},["shopping-bag"]={16898613777,{48,48},{49,820}},bed={16898612819,{48,48},{771,0}},["panel-right-open"]={16898613613,{48,48},{869,808}},["pointer-off"]={16898613699,{48,48},{771,661}},turtle={16898613869,{48,48},{196,771}},camera={16898612819,{48,48},{967,563}},scissors={16898613699,{48,48},{820,857}},["user-minus-2"]={16898613869,{48,48},{98,918}},["git-pull-request"]={16898613509,{48,48},{49,771}},["bluetooth-searching"]={16898612819,{48,48},{820,306}},["arrow-up-to-line"]={16898612629,{48,48},{196,869}},drill={16898613044,{48,48},{869,906}},["file-check-2"]={16898613353,{48,48},{612,771}},["badge-percent"]={16898612629,{48,48},{967,661}},shuffle={16898613777,{48,48},{257,869}},radiation={16898613699,{48,48},{771,453}},radical={16898613699,{48,48},{453,771}},microscope={16898613613,{48,48},{771,661}},["message-circle-x"]={16898613613,{48,48},{612,771}},box={16898612819,{48,48},{771,196}},["align-left"]={16898612629,{48,48},{514,869}},["switch-camera"]={16898613777,{48,48},{771,906}},["file-heart"]={16898613353,{48,48},{0,918}},cat={16898612819,{48,48},{404,918}},space={16898613777,{48,48},{563,869}},["rectangle-vertical"]={16898613699,{48,48},{147,869}},["clipboard-signature"]={16898613044,{48,48},{771,147}},["arrow-up-circle"]={16898612629,{48,48},{967,563}},["corner-up-left"]={16898613044,{48,48},{918,147}},["clock-6"]={16898613044,{48,48},{257,918}},["candlestick-chart"]={16898612819,{48,48},{918,612}},["key-round"]={16898613509,{48,48},{967,306}},headphones={16898613509,{48,48},{306,869}},tv={16898613869,{48,48},{98,869}},["book-minus"]={16898612819,{48,48},{0,918}},["bar-chart-horizontal-big"]={16898612629,{48,48},{771,906}},rss={16898613699,{48,48},{771,808}},["user-round-x"]={16898613869,{48,48},{306,967}},highlighter={16898613509,{48,48},{918,49}},["rocking-chair"]={16898613699,{48,48},{869,196}},["square-arrow-out-down-left"]={16898613777,{48,48},{355,869}},music={16898613613,{48,48},{967,563}},handshake={16898613509,{48,48},{514,869}},["check-circle"]={16898612819,{48,48},{869,710}},tornado={16898613869,{48,48},{771,147}},["copy-plus"]={16898613044,{48,48},{355,918}},["folder-git"]={16898613353,{48,48},{918,404}},["triangle-alert"]={16898613869,{48,48},{967,0}},shrink={16898613777,{48,48},{355,771}},sofa={16898613777,{48,48},{661,771}},["school-2"]={16898613699,{48,48},{967,453}},["search-check"]={16898613699,{48,48},{869,857}},crop={16898613044,{48,48},{918,404}},["columns-2"]={16898613044,{48,48},{820,661}},["mouse-pointer-square"]={16898613613,{48,48},{661,820}},["flask-conical-off"]={16898613353,{48,48},{820,453}},milestone={16898613613,{48,48},{612,820}},["wand-2"]={16898613869,{48,48},{918,453}},["square-dot"]={16898613777,{48,48},{918,355}},["badge-minus"]={16898612629,{48,48},{404,967}},["cloud-fog"]={16898613044,{48,48},{514,918}},["milk-off"]={16898613613,{48,48},{563,869}},bone={16898612819,{48,48},{869,514}},["percent-diamond"]={16898613699,{48,48},{257,820}},["package-check"]={16898613613,{48,48},{820,759}},["chevron-first"]={16898612819,{48,48},{147,967}},pencil={16898613699,{48,48},{820,257}},["shield-minus"]={16898613777,{48,48},{257,820}},["list-x"]={16898613509,{48,48},{918,759}},["stretch-horizontal"]={16898613777,{48,48},{967,661}},["panel-left-open"]={16898613613,{48,48},{196,967}},["corner-up-right"]={16898613044,{48,48},{869,196}},["repeat-2"]={16898613699,{48,48},{869,661}},pin={16898613699,{48,48},{918,0}},["mail-question"]={16898613613,{48,48},{771,257}},gift={16898613353,{48,48},{820,955}},["badge-indian-rupee"]={16898612629,{48,48},{967,404}},smartphone={16898613777,{48,48},{257,918}},["redo-dot"]={16898613699,{48,48},{967,306}},["users-round"]={16898613869,{48,48},{563,967}},["align-start-horizontal"]={16898612629,{48,48},{869,49}},["message-square-warning"]={16898613613,{48,48},{771,404}},["file-plus"]={16898613353,{48,48},{918,49}},["git-pull-request-arrow"]={16898613509,{48,48},{257,771}},webcam={16898613869,{48,48},{710,918}},["arrow-down-to-dot"]={16898612629,{48,48},{710,771}},["bell-dot"]={16898612819,{48,48},{771,514}},["folder-down"]={16898613353,{48,48},{147,918}},church={16898612819,{48,48},{771,906}},["square-play"]={16898613777,{48,48},{967,98}},["badge-x"]={16898612629,{48,48},{710,918}},server={16898613777,{48,48},{771,0}},["phone-forwarded"]={16898613699,{48,48},{869,0}},diamond={16898613044,{48,48},{196,918}},blinds={16898612819,{48,48},{98,771}},["user-square"]={16898613869,{48,48},{820,710}},package={16898613613,{48,48},{918,196}},["alarm-clock-off"]={16898612629,{48,48},{771,306}},["table-cells-merge"]={16898613777,{48,48},{820,906}},["helping-hand"]={16898613509,{48,48},{514,918}},recycle={16898613699,{48,48},{98,918}},["mountain-snow"]={16898613613,{48,48},{918,563}},luggage={16898613509,{48,48},{918,906}},["divide-square"]={16898613044,{48,48},{196,967}},["bot-message-square"]={16898612819,{48,48},{918,49}},["phone-outgoing"]={16898613699,{48,48},{49,820}},["smartphone-charging"]={16898613777,{48,48},{355,820}},["panel-left"]={16898613613,{48,48},{967,453}},["train-track"]={16898613869,{48,48},{355,820}},["bookmark-minus"]={16898612819,{48,48},{661,771}},["tablet-smartphone"]={16898613777,{48,48},{967,857}},["fire-extinguisher"]={16898613353,{48,48},{514,967}},sigma={16898613777,{48,48},{820,563}},["shield-half"]={16898613777,{48,48},{306,771}},terminal={16898613869,{48,48},{820,257}},shapes={16898613777,{48,48},{257,771}},["bell-ring"]={16898612819,{48,48},{0,820}},["tower-control"]={16898613869,{48,48},{0,918}},["arrow-down-1-0"]={16898612629,{48,48},{820,404}},users={16898613869,{48,48},{967,98}},scroll={16898613699,{48,48},{918,808}},["arrow-left-right"]={16898612629,{48,48},{820,196}},["lightbulb-off"]={16898613509,{48,48},{967,147}},["panels-top-left"]={16898613613,{48,48},{967,808}},beaker={16898612629,{48,48},{918,906}},["message-square-share"]={16898613613,{48,48},{869,306}},annoyed={16898612629,{48,48},{918,514}},["test-tube"]={16898613869,{48,48},{257,820}},["user-circle"]={16898613869,{48,48},{820,196}},["cooking-pot"]={16898613044,{48,48},{820,453}},["between-horizontal-start"]={16898612819,{48,48},{306,771}},fullscreen={16898613353,{48,48},{967,453}},["circuit-board"]={16898613044,{48,48},{355,771}},["grid-3x3"]={16898613509,{48,48},{98,771}},["mail-open"]={16898613613,{48,48},{771,0}},["square-function"]={16898613777,{48,48},{820,453}},["arrow-up-left-from-circle"]={16898612629,{48,48},{771,759}},variable={16898613869,{48,48},{147,918}},["arrow-up-right-square"]={16898612629,{48,48},{967,98}},["pen-line"]={16898613699,{48,48},{771,514}}},["256px"]={["align-vertical-distribute-center"]={16898613509,{256,256},{514,0}},["chevron-down"]={16898617411,{256,256},{514,257}},["list-restart"]={16898674572,{256,256},{257,257}},["table-cells-split"]={16898787819,{256,256},{514,0}},gavel={16898672166,{256,256},{514,257}},["dna-off"]={16898669271,{256,256},{514,514}},["refresh-ccw-dot"]={16898733036,{256,256},{257,514}},bean={16898615374,{256,256},{257,0}},["arrow-up-right-from-circle"]={16898614410,{256,256},{514,257}},["table-columns-split"]={16898787819,{256,256},{257,257}},bolt={16898615799,{256,256},{0,514}},heater={16898673271,{256,256},{257,0}},feather={16898669897,{256,256},{0,514}},["align-horizontal-distribute-center"]={16898613044,{256,256},{514,514}},["align-center"]={16898613044,{256,256},{0,514}},["grip-vertical"]={16898672700,{256,256},{514,0}},["person-standing"]={16898731539,{256,256},{257,257}},["badge-swiss-franc"]={16898615022,{256,256},{514,0}},["between-horizontal-end"]={16898615428,{256,256},{514,257}},["rotate-cw"]={16898733415,{256,256},{514,0}},framer={16898671684,{256,256},{514,514}},["bus-front"]={16898616879,{256,256},{0,514}},["shield-ellipsis"]={16898734564,{256,256},{514,0}},["file-lock-2"]={16898670241,{256,256},{0,0}},["between-vertical-end"]={16898615428,{256,256},{514,514}},["globe-lock"]={16898672599,{256,256},{514,0}},tags={16898788033,{256,256},{514,0}},["concierge-bell"]={16898619347,{256,256},{257,0}},["user-square"]={16898790047,{256,256},{514,257}},["arrow-left-square"]={16898614166,{256,256},{257,257}},["file-down"]={16898670072,{256,256},{514,514}},["picture-in-picture"]={16898731683,{256,256},{514,514}},["messages-square"]={16898728402,{256,256},{257,514}},["touchpad-off"]={16898788908,{256,256},{257,0}},["user-round-cog"]={16898789825,{256,256},{257,514}},["chevron-up-circle"]={16898617509,{256,256},{514,257}},["server-crash"]={16898734242,{256,256},{514,514}},["heading-3"]={16898672954,{256,256},{257,514}},squircle={16898736597,{256,256},{0,514}},["wifi-off"]={16898790996,{256,256},{257,514}},["sun-medium"]={16898736967,{256,256},{514,257}},["message-square"]={16898728402,{256,256},{514,257}},["cloud-download"]={16898618763,{256,256},{0,257}},["sigma-square"]={16898734792,{256,256},{257,257}},["folder-plus"]={16898671463,{256,256},{257,0}},["hard-drive-download"]={16898672829,{256,256},{257,514}},["scatter-chart"]={16898733817,{256,256},{257,257}},pointer={16898732061,{256,256},{514,514}},["circle-alert"]={16898617705,{256,256},{514,0}},["chevrons-up-down"]={16898617626,{256,256},{514,257}},["iteration-cw"]={16898673616,{256,256},{0,0}},["rail-symbol"]={16898732665,{256,256},{0,514}},["message-circle-more"]={16898675752,{256,256},{0,257}},parentheses={16898731166,{256,256},{257,514}},["book-up-2"]={16898616524,{256,256},{0,0}},flame={16898670919,{256,256},{0,257}},["chevrons-up"]={16898617626,{256,256},{257,514}},["chevron-right-square"]={16898617509,{256,256},{257,257}},["square-mouse-pointer"]={16898736237,{256,256},{257,0}},superscript={16898787671,{256,256},{514,0}},tag={16898788033,{256,256},{0,257}},["file-warning"]={16898670620,{256,256},{0,257}},hexagon={16898673271,{256,256},{257,257}},["navigation-2-off"]={16898730065,{256,256},{257,0}},["eye-off"]={16898669772,{256,256},{514,514}},["arrows-up-from-line"]={16898614574,{256,256},{0,514}},["square-gantt-chart"]={16898736072,{256,256},{257,257}},["square-chevron-left"]={16898735845,{256,256},{257,0}},scaling={16898733674,{256,256},{0,514}},["inspection-panel"]={16898673523,{256,256},{0,514}},["arrow-left-from-line"]={16898614166,{256,256},{0,257}},["signal-medium"]={16898734792,{256,256},{514,514}},["ticket-percent"]={16898788660,{256,256},{257,514}},["arrow-right-square"]={16898614275,{256,256},{257,0}},["calendar-clock"]={16898616953,{256,256},{0,514}},x={16898791349,{256,256},{257,0}},voicemail={16898790439,{256,256},{514,514}},presentation={16898732262,{256,256},{257,514}},["tree-palm"]={16898789012,{256,256},{0,514}},badge={16898615022,{256,256},{0,514}},["captions-off"]={16898617146,{256,256},{514,514}},["align-vertical-justify-center"]={16898613509,{256,256},{514,257}},theater={16898788479,{256,256},{514,514}},tent={16898788248,{256,256},{257,257}},["repeat-1"]={16898733146,{256,256},{0,514}},stethoscope={16898736776,{256,256},{257,257}},["screen-share-off"]={16898734065,{256,256},{0,257}},["arrow-big-up"]={16898613777,{256,256},{514,514}},["volume-x"]={16898790615,{256,256},{0,257}},["mouse-pointer-click"]={16898729337,{256,256},{0,514}},["square-m"]={16898736072,{256,256},{257,514}},["hard-hat"]={16898672954,{256,256},{257,0}},["package-minus"]={16898730417,{256,256},{257,514}},["iteration-ccw"]={16898673523,{256,256},{514,514}},pipette={16898731819,{256,256},{257,514}},["flip-horizontal"]={16898671019,{256,256},{0,0}},["alert-circle"]={16898613044,{256,256},{0,0}},unplug={16898789644,{256,256},{0,0}},["badge-cent"]={16898614755,{256,256},{514,514}},["check-square-2"]={16898617325,{256,256},{514,514}},["monitor-check"]={16898728878,{256,256},{257,257}},trello={16898789012,{256,256},{514,514}},["paintbrush-2"]={16898730641,{256,256},{514,257}},["bar-chart-horizontal"]={16898615143,{256,256},{514,257}},["book-open-text"]={16898616322,{256,256},{257,257}},["parking-meter"]={16898731301,{256,256},{257,0}},cat={16898617325,{256,256},{514,0}},["heart-handshake"]={16898673115,{256,256},{514,257}},trees={16898789012,{256,256},{257,514}},ham={16898672700,{256,256},{257,514}},text={16898788479,{256,256},{257,514}},["circle-pause"]={16898617944,{256,256},{0,514}},["chevron-up-square"]={16898617509,{256,256},{257,514}},rat={16898732665,{256,256},{257,514}},["separator-horizontal"]={16898734242,{256,256},{0,514}},ambulance={16898613613,{256,256},{0,257}},["signal-zero"]={16898734905,{256,256},{0,0}},citrus={16898618228,{256,256},{0,0}},["phone-missed"]={16898731539,{256,256},{514,514}},["calendar-off"]={16898617053,{256,256},{0,257}},["battery-medium"]={16898615240,{256,256},{0,514}},["square-minus"]={16898736237,{256,256},{0,0}},hotel={16898673358,{256,256},{0,257}},["folder-output"]={16898671263,{256,256},{514,514}},["ice-cream"]={16898673358,{256,256},{257,514}},menu={16898675673,{256,256},{514,257}},["arrow-up-left-square"]={16898614410,{256,256},{514,0}},["image-down"]={16898673358,{256,256},{514,514}},terminal={16898788248,{256,256},{514,257}},angry={16898613613,{256,256},{514,257}},outdent={16898730417,{256,256},{257,257}},["circle-dot-dashed"]={16898617884,{256,256},{514,0}},speech={16898735455,{256,256},{257,0}},["cake-slice"]={16898616953,{256,256},{0,0}},["git-graph"]={16898672316,{256,256},{514,514}},armchair={16898613777,{256,256},{0,0}},["qr-code"]={16898732504,{256,256},{257,257}},copy={16898619423,{256,256},{257,514}},goal={16898672599,{256,256},{0,514}},["trending-down"]={16898789153,{256,256},{0,0}},["creative-commons"]={16898668482,{256,256},{257,0}},nfc={16898730065,{256,256},{257,514}},pickaxe={16898731683,{256,256},{514,257}},car={16898617249,{256,256},{514,0}},["notebook-tabs"]={16898730298,{256,256},{0,0}},ear={16898669689,{256,256},{0,257}},videotape={16898790439,{256,256},{514,257}},["sun-moon"]={16898736967,{256,256},{257,514}},calendar={16898617146,{256,256},{0,0}},["minus-circle"]={16898728878,{256,256},{257,0}},["arrow-down-left-from-circle"]={16898613869,{256,256},{0,514}},gift={16898672316,{256,256},{0,0}},["message-square-heart"]={16898675863,{256,256},{0,514}},["rectangle-ellipsis"]={16898733036,{256,256},{0,0}},["badge-plus"]={16898615022,{256,256},{0,0}},["indian-rupee"]={16898673523,{256,256},{0,257}},["monitor-dot"]={16898728878,{256,256},{0,514}},delete={16898668755,{256,256},{514,257}},["clipboard-pen-line"]={16898618228,{256,256},{514,514}},["folder-search"]={16898671463,{256,256},{257,257}},["utensils-crossed"]={16898790259,{256,256},{257,257}},["arrow-up"]={16898614574,{256,256},{257,257}},["arrow-up-from-dot"]={16898614410,{256,256},{0,0}},["flask-round"]={16898670919,{256,256},{257,514}},pause={16898731301,{256,256},{257,514}},shrub={16898734792,{256,256},{0,257}},flag={16898670919,{256,256},{0,0}},underline={16898789303,{256,256},{514,257}},["align-horizontal-distribute-end"]={16898613353,{256,256},{0,0}},newspaper={16898730065,{256,256},{514,257}},table={16898787819,{256,256},{257,514}},["move-vertical"]={16898729752,{256,256},{257,257}},["file-pen-line"]={16898670241,{256,256},{514,257}},["badge-russian-ruble"]={16898615022,{256,256},{0,257}},radius={16898732665,{256,256},{257,257}},["loader-2"]={16898674684,{256,256},{0,257}},pilcrow={16898731819,{256,256},{514,0}},["corner-left-up"]={16898668288,{256,256},{257,257}},spade={16898735175,{256,256},{514,257}},["folder-cog"]={16898671139,{256,256},{514,0}},["flip-vertical"]={16898671019,{256,256},{0,257}},["square-arrow-down"]={16898735593,{256,256},{257,257}},["circle-plus"]={16898617944,{256,256},{514,514}},view={16898790439,{256,256},{257,514}},cctv={16898617325,{256,256},{257,257}},["more-horizontal"]={16898729337,{256,256},{0,0}},rows={16898733534,{256,256},{257,0}},["pause-octagon"]={16898731301,{256,256},{514,257}},["circle-arrow-left"]={16898617705,{256,256},{0,514}},volume={16898790615,{256,256},{514,0}},facebook={16898669897,{256,256},{257,0}},["octagon-alert"]={16898730298,{256,256},{257,514}},["panel-bottom-dashed"]={16898730821,{256,256},{0,257}},["book-a"]={16898615799,{256,256},{514,514}},["align-end-vertical"]={16898613044,{256,256},{257,514}},["user-x-2"]={16898790047,{256,256},{257,514}},chrome={16898617626,{256,256},{514,514}},["receipt-japanese-yen"]={16898732855,{256,256},{514,0}},rabbit={16898732504,{256,256},{514,257}},["scissors-square"]={16898734065,{256,256},{0,0}},["check-square"]={16898617411,{256,256},{0,0}},["train-front-tunnel"]={16898788908,{256,256},{257,514}},["panel-left-dashed"]={16898730821,{256,256},{257,514}},["dice-4"]={16898669042,{256,256},{0,514}},["message-circle-x"]={16898675752,{256,256},{514,514}},["folder-x"]={16898671684,{256,256},{0,0}},["message-circle-warning"]={16898675752,{256,256},{257,514}},map={16898675359,{256,256},{0,514}},move={16898729752,{256,256},{0,514}},["arrow-up-left"]={16898614410,{256,256},{257,257}},award={16898614755,{256,256},{0,257}},["arrow-down-wide-narrow"]={16898614020,{256,256},{257,514}},["unfold-horizontal"]={16898789451,{256,256},{257,0}},["area-chart"]={16898613699,{256,256},{514,514}},["music-4"]={16898729752,{256,256},{514,514}},["shield-x"]={16898734664,{256,256},{0,0}},["plane-landing"]={16898731919,{256,256},{0,0}},["disc-3"]={16898669271,{256,256},{0,257}},["columns-4"]={16898619182,{256,256},{514,0}},["archive-x"]={16898613699,{256,256},{514,257}},["square-dashed-kanban"]={16898735845,{256,256},{257,514}},["mouse-pointer-2"]={16898729337,{256,256},{257,257}},["shield-off"]={16898734564,{256,256},{514,257}},compass={16898619182,{256,256},{257,514}},vegan={16898790439,{256,256},{0,0}},["message-circle-plus"]={16898675752,{256,256},{257,257}},["stop-circle"]={16898736776,{256,256},{257,514}},nut={16898730298,{256,256},{514,257}},search={16898734242,{256,256},{257,0}},files={16898670620,{256,256},{514,257}},["send-to-back"]={16898734242,{256,256},{514,0}},["alarm-clock"]={16898612819,{256,256},{257,257}},["shopping-basket"]={16898734664,{256,256},{514,257}},send={16898734242,{256,256},{257,257}},["chevron-left-square"]={16898617509,{256,256},{257,0}},["terminal-square"]={16898788248,{256,256},{0,514}},["square-arrow-out-down-left"]={16898735593,{256,256},{514,257}},["skip-back"]={16898734905,{256,256},{0,514}},["zoom-in"]={16898791349,{256,256},{0,514}},["file-scan"]={16898670367,{256,256},{514,0}},["message-square-dashed"]={16898675863,{256,256},{0,257}},trophy={16898789153,{256,256},{0,514}},umbrella={16898789303,{256,256},{0,514}},touchpad={16898788908,{256,256},{0,257}},["clipboard-copy"]={16898618228,{256,256},{514,0}},["map-pin-off"]={16898675359,{256,256},{0,257}},headset={16898673115,{256,256},{257,257}},["circle-chevron-up"]={16898617803,{256,256},{514,514}},["align-vertical-space-between"]={16898613613,{256,256},{257,0}},["lamp-desk"]={16898673794,{256,256},{514,0}},["circle-arrow-up"]={16898617803,{256,256},{0,257}},zap={16898791349,{256,256},{257,257}},["triangle-alert"]={16898789153,{256,256},{0,257}},["swiss-franc"]={16898787671,{256,256},{0,514}},["move-left"]={16898729572,{256,256},{514,514}},["chevron-up"]={16898617509,{256,256},{514,514}},instagram={16898673523,{256,256},{514,257}},["pen-tool"]={16898731419,{256,256},{514,0}},["pencil-ruler"]={16898731419,{256,256},{514,257}},dna={16898669433,{256,256},{0,0}},["arrow-big-down-dash"]={16898613777,{256,256},{257,0}},["clipboard-edit"]={16898618228,{256,256},{257,257}},mic={16898728659,{256,256},{0,257}},["folder-search-2"]={16898671463,{256,256},{514,0}},gitlab={16898672450,{256,256},{514,514}},["rotate-3d"]={16898733317,{256,256},{514,514}},["spell-check"]={16898735455,{256,256},{514,0}},popcorn={16898732262,{256,256},{0,0}},blocks={16898615570,{256,256},{514,514}},["washing-machine"]={16898790791,{256,256},{0,514}},["badge-minus"]={16898614945,{256,256},{257,514}},["cloud-sun"]={16898618899,{256,256},{0,514}},circle={16898618049,{256,256},{257,514}},["shield-alert"]={16898734564,{256,256},{0,0}},rainbow={16898732665,{256,256},{514,257}},["separator-vertical"]={16898734242,{256,256},{514,257}},ampersands={16898613613,{256,256},{257,257}},["user-search"]={16898790047,{256,256},{257,257}},fence={16898669897,{256,256},{514,257}},["square-user-round"]={16898736597,{256,256},{257,0}},sunrise={16898787671,{256,256},{257,0}},strikethrough={16898736967,{256,256},{0,257}},["calendar-days"]={16898616953,{256,256},{514,257}},["dollar-sign"]={16898669433,{256,256},{514,0}},puzzle={16898732504,{256,256},{0,257}},["list-minus"]={16898674572,{256,256},{0,0}},["sun-dim"]={16898736967,{256,256},{0,514}},upload={16898789644,{256,256},{0,257}},["app-window-mac"]={16898613699,{256,256},{0,257}},ellipsis={16898669772,{256,256},{257,0}},["copy-check"]={16898619423,{256,256},{0,257}},history={16898673271,{256,256},{514,257}},satellite={16898733674,{256,256},{0,0}},["bookmark-plus"]={16898616524,{256,256},{257,514}},["folder-key"]={16898671263,{256,256},{514,0}},["lamp-ceiling"]={16898673794,{256,256},{0,257}},["circle-power"]={16898618049,{256,256},{0,0}},hourglass={16898673358,{256,256},{514,0}},["folder-git"]={16898671139,{256,256},{514,514}},bomb={16898615799,{256,256},{514,257}},["layers-2"]={16898673999,{256,256},{514,514}},["battery-full"]={16898615240,{256,256},{514,0}},["user-minus"]={16898789825,{256,256},{514,0}},["x-octagon"]={16898791187,{256,256},{514,514}},["folder-tree"]={16898671463,{256,256},{257,514}},command={16898619182,{256,256},{514,257}},regex={16898733146,{256,256},{514,0}},hand={16898672829,{256,256},{0,514}},["chevrons-down"]={16898617626,{256,256},{257,0}},["bluetooth-off"]={16898615799,{256,256},{257,0}},["music-2"]={16898729752,{256,256},{514,257}},book={16898616524,{256,256},{257,257}},hammer={16898672700,{256,256},{514,514}},["circle-minus"]={16898617944,{256,256},{257,0}},["audio-waveform"]={16898614755,{256,256},{257,0}},["moon-star"]={16898729141,{256,256},{257,514}},["arrow-down-narrow-wide"]={16898613869,{256,256},{514,514}},sparkle={16898735175,{256,256},{257,514}},wand={16898790791,{256,256},{514,0}},["calendar-minus-2"]={16898617053,{256,256},{0,0}},["copy-minus"]={16898619423,{256,256},{514,0}},["folder-input"]={16898671263,{256,256},{257,0}},["book-image"]={16898616080,{256,256},{257,514}},shirt={16898734664,{256,256},{257,257}},["server-off"]={16898734421,{256,256},{0,0}},["move-up"]={16898729752,{256,256},{514,0}},["plug-2"]={16898731919,{256,256},{514,257}},radio={16898732665,{256,256},{514,0}},brackets={16898616650,{256,256},{514,514}},["calendar-heart"]={16898616953,{256,256},{514,514}},["list-ordered"]={16898674572,{256,256},{0,257}},["mic-off"]={16898728659,{256,256},{0,0}},["arrow-big-left"]={16898613777,{256,256},{257,257}},["square-split-horizontal"]={16898736398,{256,256},{514,257}},clover={16898619015,{256,256},{0,0}},["sun-snow"]={16898736967,{256,256},{514,514}},["user-2"]={16898789644,{256,256},{257,257}},["help-circle"]={16898673271,{256,256},{0,257}},["clock-2"]={16898618583,{256,256},{257,0}},["calendar-fold"]={16898616953,{256,256},{257,514}},["fish-off"]={16898670775,{256,256},{514,0}},baby={16898614755,{256,256},{0,514}},leaf={16898674337,{256,256},{0,0}},["fold-vertical"]={16898671019,{256,256},{257,514}},hop={16898673358,{256,256},{0,0}},["phone-incoming"]={16898731539,{256,256},{257,514}},cigarette={16898617705,{256,256},{0,257}},minus={16898728878,{256,256},{514,0}},["smile-plus"]={16898735040,{256,256},{514,514}},["folder-edit"]={16898671139,{256,256},{514,257}},["star-off"]={16898736776,{256,256},{0,0}},["git-pull-request-closed"]={16898672450,{256,256},{0,257}},["badge-check"]={16898614945,{256,256},{0,0}},["test-tube-2"]={16898788248,{256,256},{257,514}},["kanban-square"]={16898673616,{256,256},{257,257}},["plug-zap"]={16898731919,{256,256},{514,514}},["heading-4"]={16898672954,{256,256},{514,514}},["git-pull-request-create"]={16898672450,{256,256},{257,257}},["replace-all"]={16898733146,{256,256},{514,514}},["receipt-swiss-franc"]={16898732855,{256,256},{514,257}},["square-dashed-bottom-code"]={16898735845,{256,256},{0,514}},["clock-7"]={16898618583,{256,256},{514,257}},["scan-text"]={16898733817,{256,256},{0,257}},["shower-head"]={16898734792,{256,256},{0,0}},["equal-not"]={16898669772,{256,256},{0,257}},["sliders-horizontal"]={16898735040,{256,256},{0,257}},["ticket-slash"]={16898788789,{256,256},{0,0}},ruler={16898733534,{256,256},{514,0}},["circle-user-round"]={16898618049,{256,256},{257,257}},["list-filter"]={16898674482,{256,256},{514,514}},["alarm-minus"]={16898612819,{256,256},{0,514}},["egg-off"]={16898669689,{256,256},{257,514}},cog={16898619015,{256,256},{514,514}},dog={16898669433,{256,256},{0,257}},swords={16898787671,{256,256},{514,514}},["panel-right-dashed"]={16898731024,{256,256},{514,0}},["ship-wheel"]={16898734664,{256,256},{0,257}},bot={16898616650,{256,256},{514,0}},["trash-2"]={16898789012,{256,256},{0,257}},["chevron-down-square"]={16898617411,{256,256},{0,514}},["panel-left-open"]={16898731024,{256,256},{0,0}},["file-symlink"]={16898670469,{256,256},{257,0}},["clipboard-paste"]={16898618228,{256,256},{257,514}},["chevron-last"]={16898617411,{256,256},{514,514}},["book-heart"]={16898616080,{256,256},{514,257}},["circle-parking"]={16898617944,{256,256},{257,257}},["panel-left"]={16898731024,{256,256},{257,0}},["message-circle-off"]={16898675752,{256,256},{514,0}},speaker={16898735455,{256,256},{0,0}},timer={16898788789,{256,256},{0,514}},forward={16898671684,{256,256},{514,257}},["file-up"]={16898670469,{256,256},{514,257}},["between-vertical-start"]={16898615570,{256,256},{0,0}},database={16898668755,{256,256},{0,514}},["panel-right"]={16898731024,{256,256},{514,257}},["log-out"]={16898674825,{256,256},{257,257}},["git-branch-plus"]={16898672316,{256,256},{257,0}},["shield-half"]={16898734564,{256,256},{257,257}},["square-dot"]={16898736072,{256,256},{257,0}},["arrow-right-circle"]={16898614166,{256,256},{257,514}},["table-rows-split"]={16898787819,{256,256},{514,257}},watch={16898790791,{256,256},{514,257}},["cloud-upload"]={16898618899,{256,256},{514,257}},["screen-share"]={16898734065,{256,256},{514,0}},drumstick={16898669562,{256,256},{514,514}},["list-checks"]={16898674482,{256,256},{0,514}},bug={16898616879,{256,256},{0,257}},["circle-chevron-left"]={16898617803,{256,256},{514,257}},["arrow-down"]={16898614166,{256,256},{0,0}},["arrow-up-down"]={16898614275,{256,256},{514,514}},["folder-dot"]={16898671139,{256,256},{257,257}},["whole-word"]={16898790996,{256,256},{514,257}},monitor={16898729141,{256,256},{514,257}},["flag-off"]={16898670775,{256,256},{514,257}},["align-right"]={16898613509,{256,256},{0,0}},["circle-stop"]={16898618049,{256,256},{514,0}},infinity={16898673523,{256,256},{514,0}},["arrow-big-down"]={16898613777,{256,256},{0,257}},["circle-parking-off"]={16898617944,{256,256},{514,0}},["calendar-x-2"]={16898617053,{256,256},{257,514}},["user-plus"]={16898789825,{256,256},{0,514}},["move-diagonal-2"]={16898729572,{256,256},{0,257}},["gallery-horizontal-end"]={16898672004,{256,256},{257,257}},["panel-top-dashed"]={16898731024,{256,256},{514,514}},["tram-front"]={16898789012,{256,256},{257,0}},podcast={16898732061,{256,256},{514,257}},["audio-lines"]={16898614755,{256,256},{0,0}},["flip-vertical-2"]={16898671019,{256,256},{257,0}},github={16898672450,{256,256},{257,514}},["rows-2"]={16898733415,{256,256},{257,514}},printer={16898732262,{256,256},{514,514}},["megaphone-off"]={16898675673,{256,256},{257,0}},["file-bar-chart-2"]={16898669984,{256,256},{514,257}},["arrow-big-right"]={16898613777,{256,256},{514,257}},["file-clock"]={16898670072,{256,256},{0,257}},["toy-brick"]={16898788908,{256,256},{257,257}},["square-chevron-down"]={16898735845,{256,256},{0,0}},smartphone={16898735040,{256,256},{257,514}},drill={16898669562,{256,256},{257,257}},["app-window"]={16898613699,{256,256},{514,0}},["shield-check"]={16898734564,{256,256},{0,257}},["hand-metal"]={16898672829,{256,256},{514,0}},["x-circle"]={16898791187,{256,256},{257,514}},["spell-check-2"]={16898735455,{256,256},{0,257}},["minus-square"]={16898728878,{256,256},{0,257}},["box-select"]={16898616650,{256,256},{257,257}},["list-plus"]={16898674572,{256,256},{514,0}},waypoints={16898790791,{256,256},{514,514}},["ice-cream-cone"]={16898673358,{256,256},{514,257}},["copy-slash"]={16898619423,{256,256},{0,514}},wind={16898791187,{256,256},{0,0}},["layout-panel-left"]={16898674182,{256,256},{0,514}},pill={16898731819,{256,256},{257,257}},grip={16898672700,{256,256},{257,257}},["square-x"]={16898736597,{256,256},{514,0}},italic={16898673523,{256,256},{257,514}},["step-forward"]={16898736776,{256,256},{514,0}},["a-arrow-down"]={16898612629,{256,256},{0,0}},container={16898619347,{256,256},{257,514}},sticker={16898736776,{256,256},{0,514}},["parking-circle-off"]={16898731166,{256,256},{514,514}},import={16898673447,{256,256},{514,257}},bird={16898615570,{256,256},{257,257}},["square-terminal"]={16898736597,{256,256},{0,0}},gem={16898672166,{256,256},{257,514}},beef={16898615374,{256,256},{0,514}},["ticket-x"]={16898788789,{256,256},{257,0}},["timer-reset"]={16898788789,{256,256},{257,257}},["monitor-stop"]={16898729141,{256,256},{514,0}},smile={16898735175,{256,256},{0,0}},["signpost-big"]={16898734905,{256,256},{0,257}},cloudy={16898618899,{256,256},{514,514}},["square-percent"]={16898736237,{256,256},{0,514}},["navigation-off"]={16898730065,{256,256},{514,0}},["arrow-left"]={16898614166,{256,256},{514,257}},["car-taxi-front"]={16898617249,{256,256},{0,257}},laugh={16898673999,{256,256},{257,514}},["x-square"]={16898791349,{256,256},{0,0}},["step-back"]={16898736776,{256,256},{0,257}},equal={16898669772,{256,256},{514,0}},megaphone={16898675673,{256,256},{0,257}},["chevron-left"]={16898617509,{256,256},{0,257}},egg={16898669689,{256,256},{514,514}},["video-off"]={16898790439,{256,256},{257,257}},["japanese-yen"]={16898673616,{256,256},{257,0}},library={16898674337,{256,256},{257,257}},["file-terminal"]={16898670469,{256,256},{0,257}},["circle-chevron-down"]={16898617803,{256,256},{0,514}},["bell-off"]={16898615428,{256,256},{0,257}},["square-library"]={16898736072,{256,256},{514,257}},salad={16898733534,{256,256},{514,257}},["tally-2"]={16898788033,{256,256},{0,514}},sheet={16898734421,{256,256},{257,514}},["circle-check-big"]={16898617803,{256,256},{514,0}},["map-pinned"]={16898675359,{256,256},{257,257}},["corner-down-left"]={16898668288,{256,256},{257,0}},dribbble={16898669562,{256,256},{514,0}},["pilcrow-square"]={16898731819,{256,256},{0,257}},["lamp-wall-up"]={16898673794,{256,256},{514,257}},["book-dashed"]={16898616080,{256,256},{514,0}},bluetooth={16898615799,{256,256},{514,0}},["tree-pine"]={16898789012,{256,256},{514,257}},["receipt-indian-rupee"]={16898732855,{256,256},{0,257}},["check-circle-2"]={16898617325,{256,256},{514,257}},["flask-conical"]={16898670919,{256,256},{514,257}},["package-search"]={16898730641,{256,256},{257,0}},columns={16898619182,{256,256},{257,257}},["folder-sync"]={16898671463,{256,256},{514,257}},fingerprint={16898670775,{256,256},{257,0}},["arrow-up-narrow-wide"]={16898614410,{256,256},{0,514}},frame={16898671684,{256,256},{257,514}},["clock-12"]={16898618583,{256,256},{0,0}},images={16898673447,{256,256},{0,514}},lollipop={16898674825,{256,256},{0,514}},["folder-root"]={16898671463,{256,256},{0,257}},["arrow-left-circle"]={16898614166,{256,256},{257,0}},["lamp-floor"]={16898673794,{256,256},{257,257}},image={16898673447,{256,256},{257,257}},["badge-euro"]={16898614945,{256,256},{0,257}},bike={16898615570,{256,256},{257,0}},option={16898730417,{256,256},{0,257}},["scroll-text"]={16898734065,{256,256},{257,257}},["toggle-right"]={16898788789,{256,256},{257,514}},["ferris-wheel"]={16898669897,{256,256},{257,514}},["camera-off"]={16898617146,{256,256},{257,0}},["function-square"]={16898672004,{256,256},{514,0}},group={16898672700,{256,256},{0,514}},codesandbox={16898619015,{256,256},{514,257}},expand={16898669772,{256,256},{514,257}},["tent-tree"]={16898788248,{256,256},{514,0}},settings={16898734421,{256,256},{514,0}},bitcoin={16898615570,{256,256},{0,514}},["thumbs-up"]={16898788660,{256,256},{257,257}},["calendar-search"]={16898617053,{256,256},{514,257}},["hand-platter"]={16898672829,{256,256},{257,257}},["circle-x"]={16898618049,{256,256},{514,257}},["file-diff"]={16898670072,{256,256},{514,257}},["archive-restore"]={16898613699,{256,256},{0,514}},["clock-10"]={16898618392,{256,256},{257,514}},["dice-1"]={16898669042,{256,256},{0,257}},["copy-x"]={16898619423,{256,256},{514,257}},["folder-open-dot"]={16898671263,{256,256},{514,257}},["axis-3d"]={16898614755,{256,256},{257,257}},["arrow-down-1-0"]={16898613869,{256,256},{257,0}},["clipboard-check"]={16898618228,{256,256},{0,257}},["file-x"]={16898670620,{256,256},{257,257}},diff={16898669271,{256,256},{0,0}},dot={16898669433,{256,256},{257,514}},castle={16898617325,{256,256},{0,257}},["power-circle"]={16898732262,{256,256},{514,0}},["fast-forward"]={16898669897,{256,256},{257,257}},["mail-minus"]={16898675156,{256,256},{257,0}},["file-minus-2"]={16898670241,{256,256},{0,257}},paintbrush={16898730641,{256,256},{257,514}},cast={16898617325,{256,256},{257,0}},["parking-square-off"]={16898731301,{256,256},{0,257}},["clipboard-pen"]={16898618392,{256,256},{0,0}},["settings-2"]={16898734421,{256,256},{0,257}},["alarm-clock-off"]={16898612819,{256,256},{0,257}},["ice-cream-2"]={16898673358,{256,256},{257,257}},list={16898674684,{256,256},{257,0}},["file-pie-chart"]={16898670241,{256,256},{514,514}},["square-arrow-right"]={16898735664,{256,256},{257,0}},["scissors-square-dashed-bottom"]={16898733817,{256,256},{514,514}},["remove-formatting"]={16898733146,{256,256},{257,257}},["bookmark-check"]={16898616524,{256,256},{0,514}},cannabis={16898617146,{256,256},{257,514}},["file-plus-2"]={16898670367,{256,256},{0,0}},["bookmark-x"]={16898616524,{256,256},{514,514}},["a-arrow-up"]={16898612629,{256,256},{257,0}},["chevron-right-circle"]={16898617509,{256,256},{514,0}},caravan={16898617249,{256,256},{257,257}},["file-text"]={16898670469,{256,256},{514,0}},["vibrate-off"]={16898790439,{256,256},{0,257}},["mail-check"]={16898675156,{256,256},{0,0}},["square-split-vertical"]={16898736398,{256,256},{257,514}},["file-type-2"]={16898670469,{256,256},{257,257}},["file-code"]={16898670072,{256,256},{257,257}},["file-volume"]={16898670620,{256,256},{257,0}},["flag-triangle-left"]={16898670775,{256,256},{257,514}},["square-equal"]={16898736072,{256,256},{0,257}},["scan-barcode"]={16898733674,{256,256},{514,257}},["cassette-tape"]={16898617325,{256,256},{0,0}},["battery-low"]={16898615240,{256,256},{257,257}},["utility-pole"]={16898790259,{256,256},{514,257}},folder={16898671684,{256,256},{257,0}},signpost={16898734905,{256,256},{514,0}},["file-edit"]={16898670171,{256,256},{0,0}},["globe-2"]={16898672599,{256,256},{0,257}},landmark={16898673999,{256,256},{0,0}},["fish-symbol"]={16898670775,{256,256},{257,257}},["form-input"]={16898671684,{256,256},{0,514}},loader={16898674684,{256,256},{257,257}},bold={16898615799,{256,256},{257,257}},["dice-2"]={16898669042,{256,256},{514,0}},["file-type"]={16898670469,{256,256},{0,514}},["book-user"]={16898616524,{256,256},{0,257}},beer={16898615374,{256,256},{257,514}},["gantt-chart-square"]={16898672166,{256,256},{0,257}},ghost={16898672166,{256,256},{514,514}},globe={16898672599,{256,256},{257,257}},["satellite-dish"]={16898733534,{256,256},{514,514}},binary={16898615570,{256,256},{0,257}},["move-diagonal"]={16898729572,{256,256},{514,0}},["table-cells-merge"]={16898787819,{256,256},{0,257}},["door-closed"]={16898669433,{256,256},{0,514}},["image-minus"]={16898673447,{256,256},{0,0}},utensils={16898790259,{256,256},{0,514}},["paw-print"]={16898731301,{256,256},{514,514}},["bar-chart-4"]={16898615143,{256,256},{514,0}},["book-x"]={16898616524,{256,256},{514,0}},["panel-bottom-close"]={16898730821,{256,256},{257,0}},["hand-heart"]={16898672829,{256,256},{257,0}},["file-code-2"]={16898670072,{256,256},{514,0}},["move-down-left"]={16898729572,{256,256},{257,257}},indent={16898673523,{256,256},{257,0}},joystick={16898673616,{256,256},{0,257}},keyboard={16898673794,{256,256},{257,0}},["toggle-left"]={16898788789,{256,256},{514,257}},skull={16898734905,{256,256},{257,514}},["route-off"]={16898733415,{256,256},{257,257}},["dice-6"]={16898669042,{256,256},{257,514}},lightbulb={16898674337,{256,256},{514,514}},key={16898673616,{256,256},{514,514}},["clock-11"]={16898618392,{256,256},{514,514}},["list-video"]={16898674572,{256,256},{514,514}},["ticket-plus"]={16898788660,{256,256},{514,514}},["square-dashed-bottom"]={16898735845,{256,256},{514,257}},["layout-panel-top"]={16898674182,{256,256},{514,257}},["more-vertical"]={16898729337,{256,256},{257,0}},["monitor-pause"]={16898728878,{256,256},{514,514}},["book-open-check"]={16898616322,{256,256},{514,0}},projector={16898732504,{256,256},{0,0}},["lasso-select"]={16898673999,{256,256},{0,514}},maximize={16898675359,{256,256},{514,514}},["text-quote"]={16898788479,{256,256},{257,257}},["image-up"]={16898673447,{256,256},{514,0}},["message-square-quote"]={16898728402,{256,256},{0,0}},bus={16898616879,{256,256},{514,257}},["square-arrow-down-right"]={16898735593,{256,256},{514,0}},["bed-single"]={16898615374,{256,256},{514,0}},["list-music"]={16898674572,{256,256},{257,0}},["file-spreadsheet"]={16898670367,{256,256},{514,514}},["heart-pulse"]={16898673115,{256,256},{514,514}},["clipboard-list"]={16898618228,{256,256},{0,514}},video={16898790439,{256,256},{0,514}},["contact-round"]={16898619347,{256,256},{0,514}},battery={16898615240,{256,256},{257,514}},microscope={16898728659,{256,256},{514,0}},["message-circle-question"]={16898675752,{256,256},{0,514}},["file-badge"]={16898669984,{256,256},{0,514}},["battery-warning"]={16898615240,{256,256},{514,257}},["git-pull-request"]={16898672450,{256,256},{514,257}},["arrow-down-from-line"]={16898613869,{256,256},{257,257}},briefcase={16898616757,{256,256},{514,257}},biohazard={16898615570,{256,256},{514,0}},moon={16898729141,{256,256},{514,514}},["heading-6"]={16898673115,{256,256},{257,0}},["scale-3d"]={16898733674,{256,256},{514,0}},["chevron-down-circle"]={16898617411,{256,256},{257,257}},["mail-x"]={16898675156,{256,256},{257,514}},["square-dashed-mouse-pointer"]={16898735845,{256,256},{514,514}},["user-cog"]={16898789825,{256,256},{257,0}},["lock-open"]={16898674825,{256,256},{257,0}},["mouse-pointer-square-dashed"]={16898729337,{256,256},{514,257}},pizza={16898731819,{256,256},{514,514}},["pc-case"]={16898731419,{256,256},{0,0}},["arrow-up-wide-narrow"]={16898614574,{256,256},{0,257}},["mouse-pointer"]={16898729337,{256,256},{514,514}},["clock-5"]={16898618583,{256,256},{257,257}},dices={16898669042,{256,256},{514,514}},["rotate-ccw"]={16898733415,{256,256},{257,0}},["align-horizontal-justify-center"]={16898613353,{256,256},{0,257}},mouse={16898729572,{256,256},{0,0}},antenna={16898613613,{256,256},{514,514}},["memory-stick"]={16898675673,{256,256},{257,257}},["scan-eye"]={16898733674,{256,256},{257,514}},["bean-off"]={16898615374,{256,256},{0,0}},["square-check"]={16898735664,{256,256},{514,514}},unlock={16898789451,{256,256},{514,514}},highlighter={16898673271,{256,256},{0,514}},["loader-circle"]={16898674684,{256,256},{514,0}},["hard-drive-upload"]={16898672829,{256,256},{514,514}},["gallery-vertical-end"]={16898672004,{256,256},{257,514}},["menu-square"]={16898675673,{256,256},{0,514}},["hand-coins"]={16898672829,{256,256},{0,0}},["notepad-text"]={16898730298,{256,256},{257,257}},orbit={16898730417,{256,256},{514,0}},["package-open"]={16898730417,{256,256},{514,514}},clock={16898618763,{256,256},{0,0}},["file-pen"]={16898670241,{256,256},{257,514}},["git-compare-arrows"]={16898672316,{256,256},{0,514}},["cloud-sun-rain"]={16898618899,{256,256},{257,257}},["align-horizontal-justify-start"]={16898613353,{256,256},{257,257}},["grid-2x2"]={16898672700,{256,256},{0,0}},percent={16898731539,{256,256},{514,0}},vibrate={16898790439,{256,256},{514,0}},["calendar-plus"]={16898617053,{256,256},{257,257}},brain={16898616757,{256,256},{0,257}},["arrow-down-z-a"]={16898614020,{256,256},{514,514}},bath={16898615240,{256,256},{257,0}},["panel-right-close"]={16898731024,{256,256},{0,257}},["unlink-2"]={16898789451,{256,256},{0,514}},paperclip={16898731166,{256,256},{514,257}},["parking-circle"]={16898731301,{256,256},{0,0}},["folder-check"]={16898671139,{256,256},{0,0}},["parking-square"]={16898731301,{256,256},{514,0}},["book-key"]={16898616080,{256,256},{514,514}},ribbon={16898733317,{256,256},{257,257}},microwave={16898728659,{256,256},{257,257}},["air-vent"]={16898612629,{256,256},{514,257}},["library-big"]={16898674337,{256,256},{0,257}},["file-json"]={16898670171,{256,256},{0,514}},["folder-open"]={16898671263,{256,256},{257,514}},["monitor-off"]={16898728878,{256,256},{257,514}},["square-scissors"]={16898736398,{256,256},{514,0}},["move-up-left"]={16898729752,{256,256},{257,0}},brush={16898616757,{256,256},{514,514}},["folder-heart"]={16898671263,{256,256},{0,0}},hash={16898672954,{256,256},{0,257}},["arrow-up-1-0"]={16898614275,{256,256},{0,514}},["arrow-right"]={16898614275,{256,256},{514,0}},["arrow-up-a-z"]={16898614275,{256,256},{514,257}},["badge-x"]={16898615022,{256,256},{257,257}},["panel-bottom-inactive"]={16898730821,{256,256},{514,0}},["file-video-2"]={16898670469,{256,256},{257,514}},["phone-call"]={16898731539,{256,256},{0,514}},construction={16898619347,{256,256},{514,0}},["swatch-book"]={16898787671,{256,256},{257,257}},["receipt-cent"]={16898732855,{256,256},{0,0}},["badge-pound-sterling"]={16898615022,{256,256},{257,0}},["folder-archive"]={16898671019,{256,256},{514,514}},["folder-symlink"]={16898671463,{256,256},{0,514}},["columns-3"]={16898619182,{256,256},{0,257}},ban={16898615022,{256,256},{257,514}},["message-square-x"]={16898728402,{256,256},{0,514}},["paint-roller"]={16898730641,{256,256},{0,514}},plug={16898732061,{256,256},{0,0}},gamepad={16898672166,{256,256},{257,0}},["book-minus"]={16898616322,{256,256},{0,257}},popsicle={16898732262,{256,256},{257,0}},["building-2"]={16898616879,{256,256},{514,0}},["circle-slash-2"]={16898618049,{256,256},{257,0}},["rectangle-horizontal"]={16898733036,{256,256},{257,0}},cake={16898616953,{256,256},{257,0}},["cloud-rain"]={16898618899,{256,256},{0,257}},["maximize-2"]={16898675359,{256,256},{257,514}},["redo-2"]={16898733036,{256,256},{257,257}},wrench={16898791187,{256,256},{514,257}},["repeat-2"]={16898733146,{256,256},{514,257}},codepen={16898619015,{256,256},{0,514}},reply={16898733317,{256,256},{0,257}},["flag-triangle-right"]={16898670775,{256,256},{514,514}},["rotate-ccw-square"]={16898733415,{256,256},{0,0}},["scan-search"]={16898733817,{256,256},{257,0}},bell={16898615428,{256,256},{0,514}},["grid-3x3"]={16898672700,{256,256},{257,0}},save={16898733674,{256,256},{0,257}},["music-3"]={16898729752,{256,256},{257,514}},focus={16898671019,{256,256},{0,514}},["user-check"]={16898789644,{256,256},{514,257}},proportions={16898732504,{256,256},{257,0}},["alert-octagon"]={16898613044,{256,256},{257,0}},plane={16898731919,{256,256},{0,257}},["webhook-off"]={16898790996,{256,256},{257,0}},carrot={16898617249,{256,256},{0,514}},["square-arrow-left"]={16898735593,{256,256},{0,514}},["file-cog"]={16898670072,{256,256},{0,514}},heart={16898673271,{256,256},{0,0}},["scan-face"]={16898733674,{256,256},{514,514}},["folder-down"]={16898671139,{256,256},{0,514}},["layout-template"]={16898674182,{256,256},{257,514}},mailbox={16898675359,{256,256},{0,0}},home={16898673271,{256,256},{257,514}},["traffic-cone"]={16898788908,{256,256},{514,257}},scissors={16898734065,{256,256},{257,0}},split={16898735455,{256,256},{257,514}},twitter={16898789303,{256,256},{0,257}},["locate-off"]={16898674684,{256,256},{514,257}},forklift={16898671684,{256,256},{257,257}},["square-arrow-out-up-left"]={16898735593,{256,256},{514,514}},component={16898619182,{256,256},{514,514}},["panels-left-bottom"]={16898731166,{256,256},{514,0}},["message-square-diff"]={16898675863,{256,256},{514,0}},["book-marked"]={16898616322,{256,256},{257,0}},["alarm-plus"]={16898612819,{256,256},{514,257}},["bluetooth-connected"]={16898615799,{256,256},{0,0}},unlink={16898789451,{256,256},{514,257}},signal={16898734905,{256,256},{257,0}},slack={16898734905,{256,256},{514,514}},["file-volume-2"]={16898670620,{256,256},{0,0}},["pound-sterling"]={16898732262,{256,256},{0,257}},power={16898732262,{256,256},{514,257}},["skip-forward"]={16898734905,{256,256},{514,257}},["m-square"]={16898674825,{256,256},{257,514}},["git-merge"]={16898672450,{256,256},{0,0}},["file-box"]={16898669984,{256,256},{514,514}},["align-justify"]={16898613353,{256,256},{257,514}},["paint-bucket"]={16898730641,{256,256},{257,257}},wallpaper={16898790791,{256,256},{0,0}},filter={16898670775,{256,256},{0,0}},glasses={16898672599,{256,256},{257,0}},["piggy-bank"]={16898731819,{256,256},{257,0}},["square-play"]={16898736237,{256,256},{514,514}},shell={16898734421,{256,256},{514,514}},["cloud-off"]={16898618899,{256,256},{0,0}},["check-check"]={16898617325,{256,256},{0,514}},activity={16898612629,{256,256},{0,514}},axe={16898614755,{256,256},{514,0}},["plane-takeoff"]={16898731919,{256,256},{257,0}},snowflake={16898735175,{256,256},{0,257}},["cloud-rain-wind"]={16898618899,{256,256},{257,0}},["square-plus"]={16898736398,{256,256},{0,0}},["dice-5"]={16898669042,{256,256},{514,257}},["search-slash"]={16898734065,{256,256},{514,514}},["file-axis-3d"]={16898669984,{256,256},{514,0}},["receipt-euro"]={16898732855,{256,256},{257,0}},["square-radical"]={16898736398,{256,256},{0,257}},["cloud-drizzle"]={16898618763,{256,256},{514,0}},["bug-play"]={16898616879,{256,256},{257,0}},["align-vertical-distribute-start"]={16898613509,{256,256},{0,514}},layout={16898674182,{256,256},{514,514}},["square-stack"]={16898736398,{256,256},{514,514}},["tally-5"]={16898788033,{256,256},{514,514}},squirrel={16898736597,{256,256},{514,257}},["pen-square"]={16898731419,{256,256},{0,257}},["folder-lock"]={16898671263,{256,256},{257,257}},["circle-divide"]={16898617884,{256,256},{257,0}},["case-sensitive"]={16898617249,{256,256},{257,514}},sunset={16898787671,{256,256},{0,257}},linkedin={16898674482,{256,256},{257,257}},["life-buoy"]={16898674337,{256,256},{0,514}},["circle-play"]={16898617944,{256,256},{257,514}},["tally-4"]={16898788033,{256,256},{257,514}},["volume-2"]={16898790615,{256,256},{257,0}},["battery-charging"]={16898615240,{256,256},{0,257}},["russian-ruble"]={16898733534,{256,256},{257,257}},["wallet-minimal"]={16898790615,{256,256},{257,514}},["earth-lock"]={16898669689,{256,256},{514,0}},footprints={16898671684,{256,256},{514,0}},["text-cursor-input"]={16898788479,{256,256},{0,257}},building={16898616879,{256,256},{257,257}},["lock-keyhole-open"]={16898674684,{256,256},{514,514}},twitch={16898789303,{256,256},{257,0}},["thermometer-sun"]={16898788660,{256,256},{257,0}},["switch-camera"]={16898787671,{256,256},{514,257}},club={16898619015,{256,256},{257,0}},["shield-plus"]={16898734564,{256,256},{257,514}},["alarm-check"]={16898612629,{256,256},{514,514}},["bell-minus"]={16898615428,{256,256},{257,0}},["log-in"]={16898674825,{256,256},{514,0}},["bot-message-square"]={16898616650,{256,256},{0,257}},drum={16898669562,{256,256},{257,514}},["arrow-up-z-a"]={16898614574,{256,256},{514,0}},sun={16898787671,{256,256},{0,0}},["layers-3"]={16898674182,{256,256},{0,0}},["zoom-out"]={16898791349,{256,256},{514,257}},["file-key"]={16898670171,{256,256},{257,514}},tractor={16898788908,{256,256},{0,514}},["school-2"]={16898733817,{256,256},{0,514}},["scissors-line-dashed"]={16898733817,{256,256},{257,514}},["text-select"]={16898788479,{256,256},{514,257}},["file-search"]={16898670367,{256,256},{0,514}},["unfold-vertical"]={16898789451,{256,256},{0,257}},["ticket-check"]={16898788660,{256,256},{0,514}},pyramid={16898732504,{256,256},{514,0}},["hard-drive"]={16898672954,{256,256},{0,0}},["user-cog-2"]={16898789825,{256,256},{0,0}},["refresh-cw-off"]={16898733146,{256,256},{0,0}},["external-link"]={16898669772,{256,256},{257,514}},["picture-in-picture-2"]={16898731683,{256,256},{257,514}},["file-x-2"]={16898670620,{256,256},{514,0}},["flower-2"]={16898671019,{256,256},{514,0}},["calendar-x"]={16898617053,{256,256},{514,514}},["user-round-check"]={16898789825,{256,256},{514,257}},["user-round"]={16898790047,{256,256},{514,0}},["link-2-off"]={16898674482,{256,256},{257,0}},["keyboard-music"]={16898673794,{256,256},{0,0}},["star-half"]={16898736597,{256,256},{514,514}},["user-x"]={16898790047,{256,256},{514,514}},["code-xml"]={16898619015,{256,256},{514,0}},["trending-up"]={16898789153,{256,256},{257,0}},mails={16898675359,{256,256},{257,0}},["brain-cog"]={16898616757,{256,256},{257,0}},tablet={16898788033,{256,256},{0,0}},["users-round"]={16898790259,{256,256},{0,257}},pi={16898731683,{256,256},{257,257}},trash={16898789012,{256,256},{514,0}},dock={16898669433,{256,256},{257,0}},["hdmi-port"]={16898672954,{256,256},{257,257}},braces={16898616650,{256,256},{257,514}},["case-upper"]={16898617249,{256,256},{514,514}},["move-3d"]={16898729572,{256,256},{257,0}},wallet={16898790615,{256,256},{514,514}},croissant={16898668482,{256,256},{514,0}},["monitor-speaker"]={16898729141,{256,256},{0,257}},waves={16898790791,{256,256},{257,514}},barcode={16898615143,{256,256},{514,514}},lock={16898674825,{256,256},{0,257}},["wheat-off"]={16898790996,{256,256},{257,257}},bed={16898615374,{256,256},{257,257}},quote={16898732504,{256,256},{0,514}},divide={16898669271,{256,256},{257,514}},grape={16898672599,{256,256},{514,514}},["play-square"]={16898731919,{256,256},{257,257}},["party-popper"]={16898731301,{256,256},{257,257}},["file-video"]={16898670469,{256,256},{514,514}},university={16898789451,{256,256},{257,257}},["user-circle-2"]={16898789644,{256,256},{257,514}},truck={16898789153,{256,256},{514,257}},box={16898616650,{256,256},{0,514}},["calendar-range"]={16898617053,{256,256},{0,514}},subscript={16898736967,{256,256},{514,0}},["zap-off"]={16898791349,{256,256},{514,0}},["square-check-big"]={16898735664,{256,256},{257,514}},["wand-sparkles"]={16898790791,{256,256},{0,257}},["square-chevron-up"]={16898735845,{256,256},{514,0}},["circle-ellipsis"]={16898617884,{256,256},{0,514}},["laptop-minimal"]={16898673999,{256,256},{514,0}},["radio-receiver"]={16898732665,{256,256},{257,0}},sofa={16898735175,{256,256},{514,0}},["square-asterisk"]={16898735664,{256,256},{0,514}},wine={16898791187,{256,256},{0,257}},cookie={16898619423,{256,256},{0,0}},["message-square-more"]={16898675863,{256,256},{514,257}},clapperboard={16898618228,{256,256},{257,0}},euro={16898669772,{256,256},{0,514}},["dice-3"]={16898669042,{256,256},{257,257}},["heart-off"]={16898673115,{256,256},{257,514}},["clipboard-minus"]={16898618228,{256,256},{514,257}},info={16898673523,{256,256},{257,257}},["move-horizontal"]={16898729572,{256,256},{257,514}},["file-sliders"]={16898670367,{256,256},{257,514}},frown={16898672004,{256,256},{0,0}},["cloud-hail"]={16898618763,{256,256},{0,514}},["cup-soda"]={16898668755,{256,256},{0,0}},["cable-car"]={16898616879,{256,256},{257,514}},["lock-keyhole"]={16898674825,{256,256},{0,0}},sword={16898787671,{256,256},{257,514}},play={16898731919,{256,256},{0,514}},["laptop-2"]={16898673999,{256,256},{0,257}},earth={16898669689,{256,256},{257,257}},slice={16898735040,{256,256},{257,0}},["land-plot"]={16898673794,{256,256},{514,514}},milk={16898728659,{256,256},{257,514}},["circle-user"]={16898618049,{256,256},{0,514}},["align-left"]={16898613353,{256,256},{514,514}},["circle-slash"]={16898618049,{256,256},{0,257}},contact={16898619347,{256,256},{514,257}},["rotate-cw-square"]={16898733415,{256,256},{0,257}},atom={16898614574,{256,256},{514,514}},["package-x"]={16898730641,{256,256},{0,257}},["bed-double"]={16898615374,{256,256},{0,257}},anchor={16898613613,{256,256},{0,514}},["circle-dot"]={16898617884,{256,256},{257,257}},["git-commit-horizontal"]={16898672316,{256,256},{514,0}},["git-commit-vertical"]={16898672316,{256,256},{257,257}},["message-circle-code"]={16898675673,{256,256},{514,514}},["folder-git-2"]={16898671139,{256,256},{257,514}},["message-square-code"]={16898675863,{256,256},{257,0}},["mail-plus"]={16898675156,{256,256},{514,0}},["diamond-percent"]={16898669042,{256,256},{0,0}},["message-circle-heart"]={16898675752,{256,256},{257,0}},["arrow-big-left-dash"]={16898613777,{256,256},{514,0}},["circle-arrow-out-down-left"]={16898617705,{256,256},{514,257}},dumbbell={16898669689,{256,256},{0,0}},["file-music"]={16898670241,{256,256},{257,257}},["alert-triangle"]={16898613044,{256,256},{0,257}},["chevrons-right-left"]={16898617626,{256,256},{257,257}},scale={16898733674,{256,256},{257,257}},eraser={16898669772,{256,256},{257,257}},["flashlight-off"]={16898670919,{256,256},{514,0}},["panel-top-open"]={16898731166,{256,256},{257,0}},["cloud-lightning"]={16898618763,{256,256},{514,257}},ungroup={16898789451,{256,256},{514,0}},notebook={16898730298,{256,256},{0,257}},["power-square"]={16898732262,{256,256},{0,514}},sprout={16898735593,{256,256},{0,0}},["square-menu"]={16898736072,{256,256},{514,514}},["mic-vocal"]={16898728659,{256,256},{257,0}},["monitor-smartphone"]={16898729141,{256,256},{257,0}},laptop={16898673999,{256,256},{257,257}},["scan-line"]={16898733817,{256,256},{0,0}},["clock-4"]={16898618583,{256,256},{514,0}},["square-arrow-up"]={16898735664,{256,256},{257,257}},copyright={16898668288,{256,256},{0,0}},["monitor-up"]={16898729141,{256,256},{257,257}},["unlock-keyhole"]={16898789451,{256,256},{257,514}},usb={16898789644,{256,256},{514,0}},rocket={16898733317,{256,256},{0,514}},["arrow-down-to-line"]={16898614020,{256,256},{0,514}},["book-plus"]={16898616322,{256,256},{514,257}},["refresh-ccw"]={16898733036,{256,256},{514,514}},["venetian-mask"]={16898790439,{256,256},{257,0}},["calendar-check-2"]={16898616953,{256,256},{514,0}},["arrow-down-square"]={16898614020,{256,256},{514,0}},spline={16898735455,{256,256},{257,257}},mail={16898675156,{256,256},{514,514}},["git-pull-request-create-arrow"]={16898672450,{256,256},{514,0}},["library-square"]={16898674337,{256,256},{514,0}},["circle-check"]={16898617803,{256,256},{257,257}},["square-arrow-up-right"]={16898735664,{256,256},{514,0}},["book-text"]={16898616322,{256,256},{257,514}},user={16898790259,{256,256},{0,0}},["file-key-2"]={16898670171,{256,256},{514,257}},["gallery-horizontal"]={16898672004,{256,256},{0,514}},["circle-chevron-right"]={16898617803,{256,256},{257,514}},["timer-off"]={16898788789,{256,256},{514,0}},["arrow-big-right-dash"]={16898613777,{256,256},{0,514}},["wallet-2"]={16898790615,{256,256},{0,514}},cloud={16898618899,{256,256},{257,514}},triangle={16898789153,{256,256},{257,257}},backpack={16898614755,{256,256},{514,257}},lamp={16898673794,{256,256},{257,514}},flower={16898671019,{256,256},{257,257}},youtube={16898791349,{256,256},{0,257}},["upload-cloud"]={16898789644,{256,256},{257,0}},lasso={16898673999,{256,256},{514,257}},["arrow-down-right"]={16898614020,{256,256},{0,257}},sailboat={16898733534,{256,256},{0,514}},receipt={16898732855,{256,256},{514,514}},["bell-ring"]={16898615428,{256,256},{257,257}},["heart-crack"]={16898673115,{256,256},{0,514}},["tree-deciduous"]={16898789012,{256,256},{257,257}},["fire-extinguisher"]={16898670775,{256,256},{0,257}},["baggage-claim"]={16898615022,{256,256},{514,257}},["image-off"]={16898673447,{256,256},{257,0}},["arrow-left-to-line"]={16898614166,{256,256},{0,514}},["layout-grid"]={16898674182,{256,256},{514,0}},["pi-square"]={16898731683,{256,256},{514,0}},["clock-3"]={16898618583,{256,256},{0,257}},["square-chevron-right"]={16898735845,{256,256},{0,257}},navigation={16898730065,{256,256},{257,257}},["filter-x"]={16898670620,{256,256},{514,514}},["bar-chart-3"]={16898615143,{256,256},{0,257}},["map-pin"]={16898675359,{256,256},{514,0}},["arrow-down-right-from-circle"]={16898614020,{256,256},{0,0}},["shopping-bag"]={16898734664,{256,256},{0,514}},["chevron-right"]={16898617509,{256,256},{0,514}},["tally-1"]={16898788033,{256,256},{257,257}},ampersand={16898613613,{256,256},{514,0}},["arrow-up-from-line"]={16898614410,{256,256},{257,0}},["shopping-cart"]={16898734664,{256,256},{257,514}},["user-minus-2"]={16898789825,{256,256},{0,257}},vote={16898790615,{256,256},{257,257}},["alarm-smoke"]={16898612819,{256,256},{257,514}},["file-line-chart"]={16898670171,{256,256},{514,514}},["file-input"]={16898670171,{256,256},{514,0}},["clock-8"]={16898618583,{256,256},{257,514}},["server-cog"]={16898734242,{256,256},{257,514}},["cloud-cog"]={16898618763,{256,256},{257,0}},blend={16898615570,{256,256},{514,257}},["search-x"]={16898734242,{256,256},{0,0}},["radio-tower"]={16898732665,{256,256},{0,257}},["list-tree"]={16898674572,{256,256},{257,514}},droplet={16898669562,{256,256},{0,514}},["panel-right-open"]={16898731024,{256,256},{0,514}},eye={16898669897,{256,256},{0,0}},siren={16898734905,{256,256},{257,257}},star={16898736776,{256,256},{257,0}},banana={16898615022,{256,256},{514,514}},["panel-top"]={16898731166,{256,256},{0,257}},donut={16898669433,{256,256},{257,257}},telescope={16898788248,{256,256},{0,257}},["circle-equal"]={16898617884,{256,256},{514,257}},["arrow-up-right"]={16898614410,{256,256},{514,514}},calculator={16898616953,{256,256},{0,257}},magnet={16898674825,{256,256},{514,514}},crown={16898668482,{256,256},{257,514}},subtitles={16898736967,{256,256},{257,257}},["brick-wall"]={16898616757,{256,256},{514,0}},["message-circle-dashed"]={16898675752,{256,256},{0,0}},["leafy-green"]={16898674337,{256,256},{257,0}},["message-square-dot"]={16898675863,{256,256},{257,257}},["arrow-down-a-z"]={16898613869,{256,256},{0,257}},copyleft={16898619423,{256,256},{514,514}},["monitor-play"]={16898729141,{256,256},{0,0}},["text-cursor"]={16898788479,{256,256},{514,0}},["minimize-2"]={16898728659,{256,256},{514,514}},disc={16898669271,{256,256},{257,257}},locate={16898674684,{256,256},{257,514}},cone={16898619347,{256,256},{0,257}},["heading-1"]={16898672954,{256,256},{0,514}},["file-image"]={16898670171,{256,256},{0,257}},sparkles={16898735175,{256,256},{514,514}},palette={16898730641,{256,256},{514,514}},["user-plus-2"]={16898789825,{256,256},{257,257}},["gallery-thumbnails"]={16898672004,{256,256},{514,257}},["book-up"]={16898616524,{256,256},{257,0}},cpu={16898668482,{256,256},{0,0}},["split-square-horizontal"]={16898735455,{256,256},{0,514}},["thumbs-down"]={16898788660,{256,256},{514,0}},merge={16898675673,{256,256},{257,514}},["circle-dashed"]={16898617884,{256,256},{0,0}},["bar-chart-big"]={16898615143,{256,256},{257,257}},["test-tubes"]={16898788479,{256,256},{257,0}},hospital={16898673358,{256,256},{257,0}},haze={16898672954,{256,256},{514,0}},plus={16898732061,{256,256},{514,0}},["align-vertical-space-around"]={16898613613,{256,256},{0,0}},["key-square"]={16898673616,{256,256},{257,514}},palmtree={16898730821,{256,256},{0,0}},["file-audio"]={16898669984,{256,256},{0,257}},kanban={16898673616,{256,256},{0,514}},["sliders-vertical"]={16898735040,{256,256},{514,0}},apple={16898613699,{256,256},{257,257}},["wine-off"]={16898791187,{256,256},{257,0}},["check-circle"]={16898617325,{256,256},{257,514}},cuboid={16898668482,{256,256},{514,514}},["square-code"]={16898735845,{256,256},{257,257}},["bug-off"]={16898616879,{256,256},{0,0}},["circle-arrow-out-up-left"]={16898617705,{256,256},{514,514}},["corner-right-down"]={16898668288,{256,256},{0,514}},["plug-zap-2"]={16898731919,{256,256},{257,514}},["heading-2"]={16898672954,{256,256},{514,257}},["square-activity"]={16898735593,{256,256},{257,0}},["package-plus"]={16898730641,{256,256},{0,0}},["cigarette-off"]={16898617705,{256,256},{257,0}},["align-vertical-justify-start"]={16898613509,{256,256},{514,514}},["power-off"]={16898732262,{256,256},{257,257}},["undo-2"]={16898789303,{256,256},{257,514}},router={16898733415,{256,256},{514,257}},["tower-control"]={16898788908,{256,256},{514,0}},["git-branch"]={16898672316,{256,256},{0,257}},shovel={16898734664,{256,256},{514,514}},share={16898734421,{256,256},{514,257}},["wallet-cards"]={16898790615,{256,256},{514,257}},["square-arrow-out-down-right"]={16898735593,{256,256},{257,514}},["circuit-board"]={16898618049,{256,256},{514,514}},shield={16898734664,{256,256},{257,0}},["bar-chart-2"]={16898615143,{256,256},{257,0}},["cloud-snow"]={16898618899,{256,256},{514,0}},["file-question"]={16898670367,{256,256},{0,257}},["arrow-big-up-dash"]={16898613777,{256,256},{257,514}},["folder-closed"]={16898671139,{256,256},{0,257}},["smartphone-nfc"]={16898735040,{256,256},{514,257}},network={16898730065,{256,256},{0,514}},["file-bar-chart"]={16898669984,{256,256},{257,514}},["user-round-x"]={16898790047,{256,256},{0,257}},["signal-low"]={16898734792,{256,256},{257,514}},["mail-question"]={16898675156,{256,256},{257,257}},["clipboard-plus"]={16898618392,{256,256},{257,0}},["file-minus"]={16898670241,{256,256},{514,0}},["list-end"]={16898674482,{256,256},{257,514}},torus={16898788908,{256,256},{0,0}},["arrow-down-left"]={16898613869,{256,256},{257,514}},["chevrons-right"]={16898617626,{256,256},{0,514}},["file-badge-2"]={16898669984,{256,256},{257,257}},["message-square-reply"]={16898728402,{256,256},{257,0}},["corner-down-right"]={16898668288,{256,256},{0,257}},["gauge-circle"]={16898672166,{256,256},{257,257}},["users-2"]={16898790259,{256,256},{257,0}},["lamp-wall-down"]={16898673794,{256,256},{0,514}},["square-bottom-dashed-scissors"]={16898735664,{256,256},{514,257}},["repeat"]={16898733146,{256,256},{257,514}},["ellipsis-vertical"]={16898669772,{256,256},{0,0}},snail={16898735175,{256,256},{257,0}},check={16898617411,{256,256},{257,0}},["square-parking"]={16898736237,{256,256},{514,0}},["align-horizontal-justify-end"]={16898613353,{256,256},{514,0}},["mail-search"]={16898675156,{256,256},{0,514}},["align-vertical-distribute-end"]={16898613509,{256,256},{257,257}},soup={16898735175,{256,256},{257,257}},airplay={16898612629,{256,256},{257,514}},pentagon={16898731419,{256,256},{514,514}},["rocking-chair"]={16898733317,{256,256},{514,257}},["between-horizontal-start"]={16898615428,{256,256},{257,514}},["monitor-x"]={16898729141,{256,256},{0,514}},["octagon-pause"]={16898730298,{256,256},{514,514}},["square-kanban"]={16898736072,{256,256},{0,514}},["square-pen"]={16898736237,{256,256},{257,257}},["rectangle-vertical"]={16898733036,{256,256},{0,257}},["panels-right-bottom"]={16898731166,{256,256},{257,257}},["gantt-chart"]={16898672166,{256,256},{514,0}},octagon={16898730417,{256,256},{257,0}},ticket={16898788789,{256,256},{0,257}},pocket={16898732061,{256,256},{0,514}},["link-2"]={16898674482,{256,256},{0,257}},["train-front"]={16898788908,{256,256},{514,514}},["spray-can"]={16898735455,{256,256},{514,514}},["arrow-up-0-1"]={16898614275,{256,256},{257,257}},album={16898612819,{256,256},{514,514}},replace={16898733317,{256,256},{0,0}},["move-right"]={16898729752,{256,256},{0,0}},["hand-helping"]={16898672829,{256,256},{0,257}},["list-collapse"]={16898674482,{256,256},{514,257}},gauge={16898672166,{256,256},{0,514}},store={16898736776,{256,256},{514,514}},["circle-arrow-down"]={16898617705,{256,256},{257,257}},["notebook-pen"]={16898730065,{256,256},{514,514}},["egg-fried"]={16898669689,{256,256},{514,257}},ligature={16898674337,{256,256},{514,257}},["sticky-note"]={16898736776,{256,256},{514,257}},["corner-right-up"]={16898668288,{256,256},{514,257}},["badge-help"]={16898614945,{256,256},{514,0}},["panel-top-inactive"]={16898731166,{256,256},{0,0}},["user-round-plus"]={16898790047,{256,256},{0,0}},["panel-left-close"]={16898730821,{256,256},{514,257}},rewind={16898733317,{256,256},{514,0}},fuel={16898672004,{256,256},{257,0}},["divide-circle"]={16898669271,{256,256},{0,514}},["square-arrow-out-up-right"]={16898735664,{256,256},{0,0}},["chevrons-down-up"]={16898617626,{256,256},{0,0}},["message-square-text"]={16898728402,{256,256},{514,0}},["user-round-search"]={16898790047,{256,256},{257,0}},scan={16898733817,{256,256},{514,0}},["monitor-down"]={16898728878,{256,256},{514,257}},["play-circle"]={16898731919,{256,256},{514,0}},["file-digit"]={16898670072,{256,256},{257,514}},slash={16898735040,{256,256},{0,0}},["split-square-vertical"]={16898735455,{256,256},{514,257}},aperture={16898613699,{256,256},{257,0}},["arrow-right-left"]={16898614275,{256,256},{0,0}},["helping-hand"]={16898673271,{256,256},{514,0}},["flask-conical-off"]={16898670919,{256,256},{0,514}},["circle-gauge"]={16898617884,{256,256},{514,514}},crosshair={16898668482,{256,256},{514,257}},["move-down-right"]={16898729572,{256,256},{0,514}},["text-search"]={16898788479,{256,256},{0,514}},["square-slash"]={16898736398,{256,256},{0,514}},sandwich={16898733534,{256,256},{257,514}},factory={16898669897,{256,256},{0,257}},["chef-hat"]={16898617411,{256,256},{0,257}},["arrow-down-to-dot"]={16898614020,{256,256},{257,257}},["image-plus"]={16898673447,{256,256},{0,257}},["file-archive"]={16898669984,{256,256},{0,0}},["signal-high"]={16898734792,{256,256},{514,257}},inbox={16898673447,{256,256},{257,514}},["flip-horizontal-2"]={16898670919,{256,256},{514,514}},["book-type"]={16898616322,{256,256},{514,514}},["file-signature"]={16898670367,{256,256},{514,257}},["align-horizontal-space-between"]={16898613353,{256,256},{514,257}},["bookmark-minus"]={16898616524,{256,256},{514,257}},["calendar-check"]={16898616953,{256,256},{257,257}},["database-zap"]={16898668755,{256,256},{257,257}},droplets={16898669562,{256,256},{514,257}},boxes={16898616650,{256,256},{514,257}},["bell-electric"]={16898615428,{256,256},{0,0}},["bar-chart"]={16898615143,{256,256},{257,514}},["layout-list"]={16898674182,{256,256},{257,257}},link={16898674482,{256,256},{514,0}},["download-cloud"]={16898669433,{256,256},{514,514}},["alarm-clock-plus"]={16898612819,{256,256},{514,0}},["circle-dollar-sign"]={16898617884,{256,256},{0,257}},["activity-square"]={16898612629,{256,256},{257,257}},["arrow-up-square"]={16898614574,{256,256},{0,0}},["receipt-pound-sterling"]={16898732855,{256,256},{257,257}},grab={16898672599,{256,256},{514,257}},["align-center-horizontal"]={16898613044,{256,256},{514,0}},undo={16898789451,{256,256},{0,0}},ratio={16898732665,{256,256},{514,514}},minimize={16898728878,{256,256},{0,0}},["user-square-2"]={16898790047,{256,256},{0,514}},heading={16898673115,{256,256},{0,257}},["panel-top-close"]={16898731024,{256,256},{257,514}},["grip-horizontal"]={16898672700,{256,256},{0,257}},["boom-box"]={16898616650,{256,256},{257,0}},package={16898730641,{256,256},{514,0}},["user-round-minus"]={16898789825,{256,256},{514,514}},["file-audio-2"]={16898669984,{256,256},{257,0}},["align-end-horizontal"]={16898613044,{256,256},{514,257}},mountain={16898729337,{256,256},{514,0}},["arrow-down-left-square"]={16898613869,{256,256},{514,257}},["folder-kanban"]={16898671263,{256,256},{0,257}},["octagon-x"]={16898730417,{256,256},{0,0}},languages={16898673999,{256,256},{257,0}},["file-json-2"]={16898670171,{256,256},{257,257}},["alarm-clock-check"]={16898612819,{256,256},{0,0}},["refresh-cw"]={16898733146,{256,256},{257,0}},medal={16898675673,{256,256},{0,0}},["beer-off"]={16898615374,{256,256},{514,257}},["search-code"]={16898734065,{256,256},{257,514}},["square-parking-off"]={16898736237,{256,256},{0,257}},["notebook-text"]={16898730298,{256,256},{257,0}},["arrow-right-to-line"]={16898614275,{256,256},{0,257}},["ticket-minus"]={16898788660,{256,256},{514,257}},["test-tube-diagonal"]={16898788248,{256,256},{514,514}},["rows-4"]={16898733534,{256,256},{0,0}},["pencil-line"]={16898731419,{256,256},{0,514}},["door-open"]={16898669433,{256,256},{514,257}},["arrow-down-circle"]={16898613869,{256,256},{514,0}},["pen-line"]={16898731419,{256,256},{257,0}},file={16898670620,{256,256},{0,514}},["git-compare"]={16898672316,{256,256},{514,257}},["pocket-knife"]={16898732061,{256,256},{257,257}},["book-copy"]={16898616080,{256,256},{0,257}},["panel-left-inactive"]={16898730821,{256,256},{514,514}},["car-front"]={16898617249,{256,256},{257,0}},["align-start-horizontal"]={16898613509,{256,256},{257,0}},["reply-all"]={16898733317,{256,256},{257,0}},["cloud-moon-rain"]={16898618763,{256,256},{257,514}},["clipboard-type"]={16898618392,{256,256},{514,0}},["contact-2"]={16898619347,{256,256},{257,257}},["list-todo"]={16898674572,{256,256},{514,257}},tablets={16898788033,{256,256},{257,0}},["pie-chart"]={16898731819,{256,256},{0,0}},["list-start"]={16898674572,{256,256},{0,514}},milestone={16898728659,{256,256},{0,514}},["a-large-small"]={16898612629,{256,256},{0,257}},ship={16898734664,{256,256},{514,0}},["percent-circle"]={16898731539,{256,256},{0,0}},radiation={16898732504,{256,256},{514,514}},["code-2"]={16898619015,{256,256},{0,257}},["tablet-smartphone"]={16898787819,{256,256},{514,514}},["phone-forwarded"]={16898731539,{256,256},{514,257}},["gallery-vertical"]={16898672004,{256,256},{514,514}},["arrow-right-from-line"]={16898614166,{256,256},{514,514}},webcam={16898790996,{256,256},{0,0}},["square-power"]={16898736398,{256,256},{257,0}},["circle-help"]={16898617944,{256,256},{0,0}},["bring-to-front"]={16898616757,{256,256},{257,514}},archive={16898613699,{256,256},{257,514}},figma={16898669897,{256,256},{514,514}},school={16898733817,{256,256},{514,257}},download={16898669562,{256,256},{0,0}},piano={16898731683,{256,256},{0,514}},["line-chart"]={16898674482,{256,256},{0,0}},folders={16898671684,{256,256},{0,257}},["mail-warning"]={16898675156,{256,256},{514,257}},vault={16898790259,{256,256},{514,514}},["pause-circle"]={16898731301,{256,256},{0,514}},["mic-2"]={16898728402,{256,256},{514,514}},["chevrons-left-right"]={16898617626,{256,256},{0,257}},redo={16898733036,{256,256},{514,257}},["file-lock"]={16898670241,{256,256},{257,0}},radar={16898732504,{256,256},{257,514}},["circle-fading-plus"]={16898617884,{256,256},{257,514}},workflow={16898791187,{256,256},{514,0}},["undo-dot"]={16898789303,{256,256},{514,514}},target={16898788248,{256,256},{257,0}},["corner-left-down"]={16898668288,{256,256},{514,0}},["indent-increase"]={16898673523,{256,256},{0,0}},drama={16898669562,{256,256},{0,257}},["arrow-down-up"]={16898614020,{256,256},{514,257}},baseline={16898615240,{256,256},{0,0}},martini={16898675359,{256,256},{514,257}},contrast={16898619347,{256,256},{514,514}},["shield-ban"]={16898734564,{256,256},{257,0}},syringe={16898787819,{256,256},{0,0}},["chevron-left-circle"]={16898617509,{256,256},{0,0}},["book-check"]={16898616080,{256,256},{257,0}},["nut-off"]={16898730298,{256,256},{0,514}},["book-lock"]={16898616322,{256,256},{0,0}},["panel-right-inactive"]={16898731024,{256,256},{257,257}},["briefcase-medical"]={16898616757,{256,256},{0,514}},bookmark={16898616650,{256,256},{0,0}},["heading-5"]={16898673115,{256,256},{0,0}},["align-vertical-justify-end"]={16898613509,{256,256},{257,514}},["hop-off"]={16898673271,{256,256},{514,514}},warehouse={16898790791,{256,256},{257,257}},["plus-square"]={16898732061,{256,256},{0,257}},["drafting-compass"]={16898669562,{256,256},{257,0}},["save-all"]={16898733674,{256,256},{257,0}},["plus-circle"]={16898732061,{256,256},{257,0}},["square-sigma"]={16898736398,{256,256},{257,257}},["clipboard-signature"]={16898618392,{256,256},{0,257}},["fold-horizontal"]={16898671019,{256,256},{514,257}},["notepad-text-dashed"]={16898730298,{256,256},{514,0}},["glass-water"]={16898672599,{256,256},{0,0}},["book-headphones"]={16898616080,{256,256},{0,514}},["credit-card"]={16898668482,{256,256},{0,257}},["message-circle"]={16898675863,{256,256},{0,0}},["square-pilcrow"]={16898736237,{256,256},{257,514}},radical={16898732665,{256,256},{0,0}},["tally-3"]={16898788033,{256,256},{514,257}},["panel-bottom-open"]={16898730821,{256,256},{257,257}},["kanban-square-dashed"]={16898673616,{256,256},{514,0}},["book-audio"]={16898616080,{256,256},{0,0}},["file-search-2"]={16898670367,{256,256},{257,257}},["receipt-russian-ruble"]={16898732855,{256,256},{0,514}},["square-arrow-up-left"]={16898735664,{256,256},{0,257}},["locate-fixed"]={16898674684,{256,256},{0,514}},["clock-9"]={16898618583,{256,256},{514,514}},pen={16898731419,{256,256},{257,257}},["navigation-2"]={16898730065,{256,256},{0,257}},["candy-cane"]={16898617146,{256,256},{257,257}},["book-open"]={16898616322,{256,256},{0,514}},["user-check-2"]={16898789644,{256,256},{0,514}},["gamepad-2"]={16898672166,{256,256},{0,0}},["badge-info"]={16898614945,{256,256},{0,514}},wheat={16898790996,{256,256},{0,514}},["roller-coaster"]={16898733317,{256,256},{257,514}},["arrow-down-right-square"]={16898614020,{256,256},{257,0}},["shield-minus"]={16898734564,{256,256},{0,514}},thermometer={16898788660,{256,256},{0,257}},dessert={16898668755,{256,256},{257,514}},eclipse={16898669689,{256,256},{0,514}},church={16898617705,{256,256},{0,0}},combine={16898619182,{256,256},{0,514}},cylinder={16898668755,{256,256},{0,257}},["badge-japanese-yen"]={16898614945,{256,256},{514,257}},["calendar-plus-2"]={16898617053,{256,256},{514,0}},["receipt-text"]={16898732855,{256,256},{257,514}},film={16898670620,{256,256},{257,514}},["book-down"]={16898616080,{256,256},{257,257}},asterisk={16898614574,{256,256},{514,257}},cable={16898616879,{256,256},{514,514}},["file-output"]={16898670241,{256,256},{0,514}},["disc-album"]={16898669271,{256,256},{514,0}},["percent-square"]={16898731539,{256,256},{0,257}},["arrow-down-0-1"]={16898613869,{256,256},{0,0}},captions={16898617249,{256,256},{0,0}},diameter={16898668755,{256,256},{514,514}},bone={16898615799,{256,256},{257,514}},["umbrella-off"]={16898789303,{256,256},{257,257}},["badge-alert"]={16898614755,{256,256},{257,514}},flashlight={16898670919,{256,256},{257,257}},["folder-pen"]={16898671463,{256,256},{0,0}},cross={16898668482,{256,256},{0,514}},["badge-dollar-sign"]={16898614945,{256,256},{257,0}},["ice-cream-bowl"]={16898673358,{256,256},{0,514}},worm={16898791187,{256,256},{257,257}},["square-arrow-down-left"]={16898735593,{256,256},{0,257}},["share-2"]={16898734421,{256,256},{0,514}},["circle-arrow-out-down-right"]={16898617705,{256,256},{257,514}},["ear-off"]={16898669689,{256,256},{257,0}},wifi={16898790996,{256,256},{514,514}},["message-square-off"]={16898675863,{256,256},{257,514}},["tv-2"]={16898789153,{256,256},{514,514}},fish={16898670775,{256,256},{0,514}},sliders={16898735040,{256,256},{257,257}},["stretch-horizontal"]={16898736967,{256,256},{0,0}},currency={16898668755,{256,256},{257,0}},coffee={16898619015,{256,256},{257,514}},["message-circle-reply"]={16898675752,{256,256},{514,257}},route={16898733415,{256,256},{0,514}},["triangle-right"]={16898789153,{256,256},{514,0}},["folder-clock"]={16898671139,{256,256},{257,0}},["circle-off"]={16898617944,{256,256},{0,257}},["message-square-plus"]={16898675863,{256,256},{514,514}},type={16898789303,{256,256},{514,0}},webhook={16898790996,{256,256},{0,257}},["candlestick-chart"]={16898617146,{256,256},{514,0}},phone={16898731683,{256,256},{0,257}},["package-2"]={16898730417,{256,256},{0,514}},["chevrons-left"]={16898617626,{256,256},{514,0}},["pointer-off"]={16898732061,{256,256},{257,514}},turtle={16898789153,{256,256},{257,514}},camera={16898617146,{256,256},{0,257}},["thermometer-snowflake"]={16898788660,{256,256},{0,0}},clipboard={16898618392,{256,256},{0,514}},["send-horizontal"]={16898734242,{256,256},{0,257}},["bluetooth-searching"]={16898615799,{256,256},{0,257}},["arrow-up-to-line"]={16898614574,{256,256},{257,0}},["wrap-text"]={16898791187,{256,256},{0,514}},["file-check-2"]={16898670072,{256,256},{0,0}},["badge-percent"]={16898614945,{256,256},{514,514}},shuffle={16898734792,{256,256},{514,0}},refrigerator={16898733146,{256,256},{0,257}},["rows-3"]={16898733415,{256,256},{514,514}},sigma={16898734792,{256,256},{0,514}},["milk-off"]={16898728659,{256,256},{514,257}},["file-check"]={16898670072,{256,256},{257,0}},["pin-off"]={16898731819,{256,256},{0,514}},["clock-1"]={16898618392,{256,256},{514,257}},["file-heart"]={16898670171,{256,256},{257,0}},beaker={16898615240,{256,256},{514,514}},space={16898735175,{256,256},{0,514}},users={16898790259,{256,256},{514,0}},["shield-question"]={16898734564,{256,256},{514,514}},["arrow-up-circle"]={16898614275,{256,256},{257,514}},["corner-up-left"]={16898668288,{256,256},{257,514}},["clock-6"]={16898618583,{256,256},{0,514}},["layout-dashboard"]={16898674182,{256,256},{0,257}},["key-round"]={16898673616,{256,256},{514,257}},headphones={16898673115,{256,256},{514,0}},tv={16898789303,{256,256},{0,0}},["brain-circuit"]={16898616757,{256,256},{0,0}},["bar-chart-horizontal-big"]={16898615143,{256,256},{0,514}},rss={16898733534,{256,256},{0,257}},["file-stack"]={16898670469,{256,256},{0,0}},["at-sign"]={16898614574,{256,256},{257,514}},code={16898619015,{256,256},{257,257}},["calendar-minus"]={16898617053,{256,256},{257,0}},music={16898730065,{256,256},{0,0}},handshake={16898672829,{256,256},{514,257}},["graduation-cap"]={16898672599,{256,256},{257,514}},tornado={16898788789,{256,256},{514,514}},["copy-plus"]={16898619423,{256,256},{257,257}},stamp={16898736597,{256,256},{257,514}},cherry={16898617411,{256,256},{514,0}},shrink={16898734792,{256,256},{257,0}},["circle-arrow-out-up-right"]={16898617803,{256,256},{0,0}},meh={16898675673,{256,256},{514,0}},["search-check"]={16898734065,{256,256},{514,257}},crop={16898668482,{256,256},{257,257}},["columns-2"]={16898619182,{256,256},{257,0}},["mouse-pointer-square"]={16898729337,{256,256},{257,514}},["indent-decrease"]={16898673447,{256,256},{514,514}},["align-center-vertical"]={16898613044,{256,256},{257,257}},["wand-2"]={16898790791,{256,256},{257,0}},anvil={16898613699,{256,256},{0,0}},["align-start-vertical"]={16898613509,{256,256},{0,257}},["cloud-fog"]={16898618763,{256,256},{257,257}},accessibility={16898612629,{256,256},{514,0}},layers={16898674182,{256,256},{257,0}},["percent-diamond"]={16898731539,{256,256},{257,0}},["package-check"]={16898730417,{256,256},{514,257}},["chevron-first"]={16898617411,{256,256},{257,514}},pencil={16898731419,{256,256},{257,514}},["database-backup"]={16898668755,{256,256},{514,0}},["list-x"]={16898674684,{256,256},{0,0}},shapes={16898734421,{256,256},{257,257}},["move-down"]={16898729572,{256,256},{514,257}},["corner-up-right"]={16898668288,{256,256},{514,514}},computer={16898619347,{256,256},{0,0}},pin={16898731819,{256,256},{514,257}},["phone-off"]={16898731683,{256,256},{0,0}},["clipboard-x"]={16898618392,{256,256},{257,257}},fullscreen={16898672004,{256,256},{0,257}},["align-horizontal-distribute-start"]={16898613353,{256,256},{257,0}},["redo-dot"]={16898733036,{256,256},{0,514}},["cloud-moon"]={16898618763,{256,256},{514,514}},["stretch-vertical"]={16898736967,{256,256},{257,0}},["message-square-warning"]={16898728402,{256,256},{257,257}},["file-plus"]={16898670367,{256,256},{257,0}},["git-pull-request-arrow"]={16898672450,{256,256},{257,0}},guitar={16898672700,{256,256},{514,257}},tangent={16898788248,{256,256},{0,0}},["bell-dot"]={16898615374,{256,256},{514,514}},["panel-bottom"]={16898730821,{256,256},{0,514}},["flame-kindling"]={16898670919,{256,256},{257,0}},["table-2"]={16898787819,{256,256},{257,0}},["align-horizontal-space-around"]={16898613353,{256,256},{0,514}},server={16898734421,{256,256},{257,0}},["briefcase-business"]={16898616757,{256,256},{257,257}},diamond={16898669042,{256,256},{257,0}},blinds={16898615570,{256,256},{257,514}},weight={16898790996,{256,256},{514,0}},candy={16898617146,{256,256},{514,257}},["volume-1"]={16898790615,{256,256},{0,0}},["table-properties"]={16898787819,{256,256},{0,514}},["git-fork"]={16898672316,{256,256},{257,514}},recycle={16898733036,{256,256},{514,0}},["mountain-snow"]={16898729337,{256,256},{0,257}},luggage={16898674825,{256,256},{514,257}},["divide-square"]={16898669271,{256,256},{514,257}},["folder-minus"]={16898671263,{256,256},{0,514}},["phone-outgoing"]={16898731683,{256,256},{257,0}},["smartphone-charging"]={16898735040,{256,256},{0,514}},banknote={16898615143,{256,256},{0,0}},["train-track"]={16898789012,{256,256},{0,0}},["folder-up"]={16898671463,{256,256},{514,514}},["circle-percent"]={16898617944,{256,256},{514,257}},["bell-plus"]={16898615428,{256,256},{514,0}},fan={16898669897,{256,256},{514,0}},["disc-2"]={16898669271,{256,256},{257,0}},["git-pull-request-draft"]={16898672450,{256,256},{0,514}},coins={16898619182,{256,256},{0,0}},["square-divide"]={16898736072,{256,256},{0,0}},scroll={16898734065,{256,256},{0,514}},["circle-arrow-right"]={16898617803,{256,256},{257,0}},["candy-off"]={16898617146,{256,256},{0,514}},["square-pi"]={16898736237,{256,256},{514,257}},["arrow-left-right"]={16898614166,{256,256},{514,0}},["lightbulb-off"]={16898674337,{256,256},{257,514}},["panels-top-left"]={16898731166,{256,256},{0,514}},["move-up-right"]={16898729752,{256,256},{0,257}},["message-square-share"]={16898728402,{256,256},{0,257}},annoyed={16898613613,{256,256},{257,514}},["test-tube"]={16898788479,{256,256},{0,0}},["user-circle"]={16898789644,{256,256},{514,514}},["cooking-pot"]={16898619423,{256,256},{257,0}},["case-lower"]={16898617249,{256,256},{514,257}},["alarm-clock-minus"]={16898612819,{256,256},{257,0}},["square-user"]={16898736597,{256,256},{0,257}},square={16898736597,{256,256},{257,257}},["mail-open"]={16898675156,{256,256},{0,257}},["square-function"]={16898736072,{256,256},{514,0}},["arrow-up-left-from-circle"]={16898614410,{256,256},{0,257}},variable={16898790259,{256,256},{257,514}},["arrow-up-right-square"]={16898614410,{256,256},{257,514}},["badge-indian-rupee"]={16898614945,{256,256},{257,257}}}}
    end)()
    
    -- Variables
    
    local CFileName = nil
    local CEnabled = false
    local Minimised = false
    local Hidden = false
    local Debounce = false
    local searchOpen = false
    local Notifications = Rayfield.Notifications
    
    local SelectedTheme = RayfieldLibrary.Theme.Default
    
    Rayfield:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
    	if Rayfield.AbsoluteSize.X < minSize.X and Rayfield.AbsoluteSize.Y < minSize.Y then
    		useMobileSizing = true
    	else
    		useMobileSizing = false
    	end
    
    	if Main.Visible and not Minimised then
    		TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {
    			Size = useMobileSizing and UDim2.new(0, 500, 0, 275) or UDim2.new(0, 500, 0, 475)
    		}):Play()
    		updateDragBar()
    	end
    end)
    
    local function ChangeTheme(Theme)
    	if typeof(Theme) == 'string' then
    		SelectedTheme = RayfieldLibrary.Theme[Theme]
    	elseif typeof(Theme) == 'table' then
    		SelectedTheme = Theme
    	end
    
    	Rayfield.Main.BackgroundColor3 = SelectedTheme.Background
    	Rayfield.Main.Topbar.BackgroundColor3 = SelectedTheme.Topbar
    	Rayfield.Main.Topbar.CornerRepair.BackgroundColor3 = SelectedTheme.Topbar
    	Rayfield.Main.Shadow.Image.ImageColor3 = SelectedTheme.Shadow
    
    	Rayfield.Main.Topbar.ChangeSize.ImageColor3 = SelectedTheme.TextColor
    	Rayfield.Main.Topbar.Hide.ImageColor3 = SelectedTheme.TextColor
    	Rayfield.Main.Topbar.Search.ImageColor3 = SelectedTheme.TextColor
    	if Topbar:FindFirstChild('Settings') then
    		Rayfield.Main.Topbar.Settings.ImageColor3 = SelectedTheme.TextColor
    		Rayfield.Main.Topbar.Divider.BackgroundColor3 = SelectedTheme.ElementStroke
    	end
    
    	Main.Search.BackgroundColor3 = SelectedTheme.TextColor
    	Main.Search.Shadow.ImageColor3 = SelectedTheme.TextColor
    	Main.Search.Search.ImageColor3 = SelectedTheme.TextColor
    	Main.Search.Input.PlaceholderColor3 = SelectedTheme.TextColor
    	Main.Search.UIStroke.Color = SelectedTheme.SecondaryElementStroke
    
    	if Main:FindFirstChild('Notice') then
    		Main.Notice.BackgroundColor3 = SelectedTheme.Background
    	end
    
    	for _, text in ipairs(Rayfield:GetDescendants()) do
    		if text.Parent.Parent ~= Notifications then
    			if text:IsA('TextLabel') or text:IsA('TextBox') then text.TextColor3 = SelectedTheme.TextColor end
    		end
    	end
    
    	for _, TabPage in ipairs(Elements:GetChildren()) do
    		for _, Element in ipairs(TabPage:GetChildren()) do
    			if Element.ClassName == "Frame" and Element.Name ~= "Placeholder" and Element.Name ~= "SectionSpacing" and Element.Name ~= "Divider" and Element.Name ~= "SectionTitle" and Element.Name ~= "SearchTitle-fsefsefesfsefesfesfThanks" then
    				Element.BackgroundColor3 = SelectedTheme.ElementBackground
    				Element.UIStroke.Color = SelectedTheme.ElementStroke
    			end
    		end
    	end
    end
    
    local function getIcon(name : string)
    	name = string.match(string.lower(name), "^%s*(.*)%s*$") :: string
    	local sizedicons = Icons['48px']
    
    	local r = sizedicons[name]
    	if not r then
    		error(`Lucide Icons: Failed to find icon by the name of "{name}"`, 2)
    	end
    
    	local rirs = r[2]
    	local riro = r[3]
    
    	if type(r[1]) ~= "number" or type(rirs) ~= "table" or type(riro) ~= "table" then
    		error("Lucide Icons: Internal error: Invalid auto-generated asset entry")
    	end
    
    	local irs = Vector2.new(rirs[1], rirs[2])
    	local iro = Vector2.new(riro[1], riro[2])
    
    	local asset = {
    		id = r[1],
    		imageRectSize = irs,
    		imageRectOffset = iro,
    	}
    
    	return asset
    end
    
    local function makeDraggable(object, dragObject, enableTaptic, tapticOffset)
    	local dragging = false
    	local relative = nil
    
    	local offset = Vector2.zero
    	local screenGui = object:FindFirstAncestorWhichIsA("ScreenGui")
    	if screenGui and screenGui.IgnoreGuiInset then
    		offset += getService('GuiService'):GetGuiInset()
    	end
    
    	local function connectFunctions()
    		if dragBar and enableTaptic then
    			dragBar.MouseEnter:Connect(function()
    				if not dragging and not Hidden then
    					TweenService:Create(dragBarCosmetic, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {BackgroundTransparency = 0.5, Size = UDim2.new(0, 120, 0, 4)}):Play()
    				end
    			end)
    
    			dragBar.MouseLeave:Connect(function()
    				if not dragging and not Hidden then
    					TweenService:Create(dragBarCosmetic, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {BackgroundTransparency = 0.7, Size = UDim2.new(0, 100, 0, 4)}):Play()
    				end
    			end)
    		end
    	end
    
    	connectFunctions()
    
    	dragObject.InputBegan:Connect(function(input, processed)
    		if processed then return end
    
    		local inputType = input.UserInputType.Name
    		if inputType == "MouseButton1" or inputType == "Touch" then
    			dragging = true
    
    			relative = object.AbsolutePosition + object.AbsoluteSize * object.AnchorPoint - UserInputService:GetMouseLocation()
    			if enableTaptic and not Hidden then
    				TweenService:Create(dragBarCosmetic, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 110, 0, 4), BackgroundTransparency = 0}):Play()
    			end
    		end
    	end)
    
    	local inputEnded = UserInputService.InputEnded:Connect(function(input)
    		if not dragging then return end
    
    		local inputType = input.UserInputType.Name
    		if inputType == "MouseButton1" or inputType == "Touch" then
    			dragging = false
    
    			connectFunctions()
    
    			if enableTaptic and not Hidden then
    				TweenService:Create(dragBarCosmetic, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0, 100, 0, 4), BackgroundTransparency = 0.7}):Play()
    			end
    		end
    	end)
    
    	local renderStepped = RunService.RenderStepped:Connect(function()
    		if dragging and not Hidden then
    			local position = UserInputService:GetMouseLocation() + relative + offset
    			if enableTaptic and tapticOffset then
    				TweenService:Create(object, TweenInfo.new(0.4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Position = UDim2.fromOffset(position.X, position.Y)}):Play()
    				TweenService:Create(dragObject.Parent, TweenInfo.new(0.05, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Position = UDim2.fromOffset(position.X, position.Y + ((useMobileSizing and tapticOffset[2]) or tapticOffset[1]))}):Play()
    			else
    				if dragBar and tapticOffset then
    					dragBar.Position = UDim2.fromOffset(position.X, position.Y + ((useMobileSizing and tapticOffset[2]) or tapticOffset[1]))
    				end
    				object.Position = UDim2.fromOffset(position.X, position.Y)
    			end
    		end
    	end)
    
    	if object == Main then
    		updateDragBar = function()
    			local relative = object.AbsolutePosition + object.AbsoluteSize * object.AnchorPoint - UserInputService:GetMouseLocation()
    			local position = UserInputService:GetMouseLocation() + relative + offset
    			dragBar.Position = UDim2.fromOffset(position.X, position.Y + ((useMobileSizing and tapticOffset[2]) or tapticOffset[1]))
    		end
    	end
    
    	object.Destroying:Connect(function()
    		if inputEnded then inputEnded:Disconnect() end
    		if renderStepped then renderStepped:Disconnect() end
    	end)
    end
    
    
    local function PackColor(Color)
    	return {R = Color.R * 255, G = Color.G * 255, B = Color.B * 255}
    end
    
    local function UnpackColor(Color)
    	return Color3.fromRGB(Color.R, Color.G, Color.B)
    end
    
    local function LoadConfiguration(Configuration)
    	local success, Data = pcall(function() return HttpService:JSONDecode(Configuration) end)
    	local changed
    
    	if not success then warn('Rayfield had an issue decoding the configuration file, please try delete the file and reopen Rayfield.') return end
    
    	-- Iterate through current UI elements' flags
    	for FlagName, Flag in pairs(RayfieldLibrary.Flags) do
    		local FlagValue = Data[FlagName]
    
    		if (typeof(FlagValue) == 'boolean' and FlagValue == false) or FlagValue then
    			task.spawn(function()
    				if Flag.Type == "ColorPicker" then
    					changed = true
    					Flag:Set(UnpackColor(FlagValue))
    				else
    					if (Flag.CurrentValue or Flag.CurrentKeybind or Flag.CurrentOption or Flag.Color) ~= FlagValue then
    						changed = true
    						Flag:Set(FlagValue)
    					end
    				end
    			end)
    		else
    			warn("Rayfield | Unable to find '"..FlagName.. "' in the save file.")
    			print("The error above may not be an issue if new elements have been added or not been set values.")
    			--RayfieldLibrary:Notify({Title = "Rayfield Flags", Content = "Rayfield was unable to find '"..FlagName.. "' in the save file. Check sirius.menu/discord for help.", Image = 3944688398})
    		end
    	end
    
    	return changed
    end
    
    local function SaveConfiguration()
    	if not CEnabled or not globalLoaded then return end
    
    	if debugX then
    		print('Saving')
    	end
    
    	local Data = {}
    	for i, v in pairs(RayfieldLibrary.Flags) do
    		if v.Type == "ColorPicker" then
    			Data[i] = PackColor(v.Color)
    		else
    			if typeof(v.CurrentValue) == 'boolean' then
    				if v.CurrentValue == false then
    					Data[i] = false
    				else
    					Data[i] = v.CurrentValue or v.CurrentKeybind or v.CurrentOption or v.Color
    				end
    			else
    				Data[i] = v.CurrentValue or v.CurrentKeybind or v.CurrentOption or v.Color
    			end
    		end
    	end
    
    	if useStudio then
    		if script.Parent:FindFirstChild('configuration') then script.Parent.configuration:Destroy() end
    
    		local ScreenGui = Instance.new("ScreenGui")
    		ScreenGui.Parent = script.Parent
    		ScreenGui.Name = 'configuration'
    
    		local TextBox = Instance.new("TextBox")
    		TextBox.Parent = ScreenGui
    		TextBox.Size = UDim2.new(0, 800, 0, 50)
    		TextBox.AnchorPoint = Vector2.new(0.5, 0)
    		TextBox.Position = UDim2.new(0.5, 0, 0, 30)
    		TextBox.Text = HttpService:JSONEncode(Data)
    		TextBox.ClearTextOnFocus = false
    	end
    
    	if debugX then
    		warn(HttpService:JSONEncode(Data))
    	end
    
    	if writefile then
    		writefile(ConfigurationFolder .. "/" .. CFileName .. ConfigurationExtension, tostring(HttpService:JSONEncode(Data)))
    	end
    end
    
    function RayfieldLibrary:Notify(data) -- action e.g open messages
    	task.spawn(function()
    
    		-- Notification Object Creation
    		local newNotification = Notifications.Template:Clone()
    		newNotification.Name = data.Title or 'No Title Provided'
    		newNotification.Parent = Notifications
    		newNotification.LayoutOrder = #Notifications:GetChildren()
    		newNotification.Visible = false
    
    		-- Set Data
    		newNotification.Title.Text = data.Title or "Unknown Title"
    		newNotification.Description.Text = data.Content or "Unknown Content"
    
    		if data.Image then
    			if typeof(data.Image) == 'string' then
    				local asset = getIcon(data.Image)
    
    				newNotification.Icon.Image = 'rbxassetid://'..asset.id
    				newNotification.Icon.ImageRectOffset = asset.imageRectOffset
    				newNotification.Icon.ImageRectSize = asset.imageRectSize
    			else
    				newNotification.Icon.Image = "rbxassetid://" .. (data.Image or 0)
    			end
    		else
    			newNotification.Icon.Image = "rbxassetid://" .. 0
    		end
    
    		-- Set initial transparency values
    
    		newNotification.Title.TextColor3 = SelectedTheme.TextColor
    		newNotification.Description.TextColor3 = SelectedTheme.TextColor
    		newNotification.BackgroundColor3 = SelectedTheme.Background
    		newNotification.UIStroke.Color = SelectedTheme.TextColor
    		newNotification.Icon.ImageColor3 = SelectedTheme.TextColor
    
    		newNotification.BackgroundTransparency = 1
    		newNotification.Title.TextTransparency = 1
    		newNotification.Description.TextTransparency = 1
    		newNotification.UIStroke.Transparency = 1
    		newNotification.Shadow.ImageTransparency = 1
    		newNotification.Size = UDim2.new(1, 0, 0, 800)
    		newNotification.Icon.ImageTransparency = 1
    		newNotification.Icon.BackgroundTransparency = 1
    
    		task.wait()
    
    		newNotification.Visible = true
    
    		if data.Actions then
    			warn('Rayfield | Not seeing your actions in notifications?')
    			print("Notification Actions are being sunset for now, keep up to date on when they're back in the discord. (sirius.menu/discord)")
    		end
    
    		-- Calculate textbounds and set initial values
    		local bounds = {newNotification.Title.TextBounds.Y, newNotification.Description.TextBounds.Y}
    		newNotification.Size = UDim2.new(1, -60, 0, -Notifications:FindFirstChild("UIListLayout").Padding.Offset)
    
    		newNotification.Icon.Size = UDim2.new(0, 32, 0, 32)
    		newNotification.Icon.Position = UDim2.new(0, 20, 0.5, 0)
    
    		TweenService:Create(newNotification, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, 0, 0, math.max(bounds[1] + bounds[2] + 31, 60))}):Play()
    
    		task.wait(0.15)
    		TweenService:Create(newNotification, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.45}):Play()
    		TweenService:Create(newNotification.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    
    		task.wait(0.05)
    
    		TweenService:Create(newNotification.Icon, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 0}):Play()
    
    		task.wait(0.05)
    		TweenService:Create(newNotification.Description, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0.35}):Play()
    		TweenService:Create(newNotification.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {Transparency = 0.95}):Play()
    		TweenService:Create(newNotification.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 0.82}):Play()
    
    		local waitDuration = math.min(math.max((#newNotification.Description.Text * 0.1) + 2.5, 3), 10)
    		task.wait(data.Duration or waitDuration)
    
    		newNotification.Icon.Visible = false
    		TweenService:Create(newNotification, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
    		TweenService:Create(newNotification.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    		TweenService:Create(newNotification.Shadow, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
    		TweenService:Create(newNotification.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    		TweenService:Create(newNotification.Description, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    
    		TweenService:Create(newNotification, TweenInfo.new(1, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, -90, 0, 0)}):Play()
    
    		task.wait(1)
    
    		TweenService:Create(newNotification, TweenInfo.new(1, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, -90, 0, -Notifications:FindFirstChild("UIListLayout").Padding.Offset)}):Play()
    
    		newNotification.Visible = false
    		newNotification:Destroy()
    	end)
    end
    
    local function openSearch()
    	searchOpen = true
    
    	Main.Search.BackgroundTransparency = 1
    	Main.Search.Shadow.ImageTransparency = 1
    	Main.Search.Input.TextTransparency = 1
    	Main.Search.Search.ImageTransparency = 1
    	Main.Search.UIStroke.Transparency = 1
    	Main.Search.Size = UDim2.new(1, 0, 0, 80)
    	Main.Search.Position = UDim2.new(0.5, 0, 0, 70)
    
    	Main.Search.Input.Interactable = true
    
    	Main.Search.Visible = true
    
    	for _, tabbtn in ipairs(TabList:GetChildren()) do
    		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
    			tabbtn.Interact.Visible = false
    			TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
    			TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    			TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
    			TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    		end
    	end
    
    	Main.Search.Input:CaptureFocus()
    	TweenService:Create(Main.Search.Shadow, TweenInfo.new(0.05, Enum.EasingStyle.Quint), {ImageTransparency = 0.95}):Play()
    	TweenService:Create(Main.Search, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Position = UDim2.new(0.5, 0, 0, 57), BackgroundTransparency = 0.9}):Play()
    	TweenService:Create(Main.Search.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 0.8}):Play()
    	TweenService:Create(Main.Search.Input, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0.2}):Play()
    	TweenService:Create(Main.Search.Search, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 0.5}):Play()
    	TweenService:Create(Main.Search, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, -35, 0, 35)}):Play()
    end
    
    local function closeSearch()
    	searchOpen = false
    
    	TweenService:Create(Main.Search, TweenInfo.new(0.35, Enum.EasingStyle.Quint), {BackgroundTransparency = 1, Size = UDim2.new(1, -55, 0, 30)}):Play()
    	TweenService:Create(Main.Search.Search, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
    	TweenService:Create(Main.Search.Shadow, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {ImageTransparency = 1}):Play()
    	TweenService:Create(Main.Search.UIStroke, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {Transparency = 1}):Play()
    	TweenService:Create(Main.Search.Input, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {TextTransparency = 1}):Play()
    
    	for _, tabbtn in ipairs(TabList:GetChildren()) do
    		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
    			tabbtn.Interact.Visible = true
    			if tostring(Elements.UIPageLayout.CurrentPage) == tabbtn.Title.Text then
    				TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    				TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 0}):Play()
    				TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    				TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    			else
    				TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.7}):Play()
    				TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 0.2}):Play()
    				TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0.2}):Play()
    				TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
    			end
    		end
    	end
    
    	Main.Search.Input.Text = ''
    	Main.Search.Input.Interactable = false
    end
    
    local function Hide(notify: boolean?)
    	if MPrompt then
    		MPrompt.Title.TextColor3 = Color3.fromRGB(255, 255, 255)
    		MPrompt.Position = UDim2.new(0.5, 0, 0, -50)
    		MPrompt.Size = UDim2.new(0, 40, 0, 10)
    		MPrompt.BackgroundTransparency = 1
    		MPrompt.Title.TextTransparency = 1
    		MPrompt.Visible = true
    	end
    
    	task.spawn(closeSearch)
    
    	Debounce = true
    	if notify then
    		if useMobilePrompt then
    			RayfieldLibrary:Notify({Title = "Interface Hidden", Content = "The interface has been hidden, you can unhide the interface by tapping 'Show Rayfield'.", Duration = 7, Image = 4400697855})
    		else
    			RayfieldLibrary:Notify({Title = "Interface Hidden", Content = `The interface has been hidden, you can unhide the interface by tapping {settingsTable.General.rayfieldOpen.Value or 'K'}.`, Duration = 7, Image = 4400697855})
    		end
    	end
    
    	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 470, 0, 0)}):Play()
    	TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 470, 0, 45)}):Play()
    	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
    	TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
    	TweenService:Create(Main.Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
    	TweenService:Create(Main.Topbar.CornerRepair, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
    	TweenService:Create(Main.Topbar.Title, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
    	TweenService:Create(Topbar.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    	TweenService:Create(dragBarCosmetic, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
    
    	if useMobilePrompt and MPrompt then
    		TweenService:Create(MPrompt, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 120, 0, 30), Position = UDim2.new(0.5, 0, 0, 20), BackgroundTransparency = 0.3}):Play()
    		TweenService:Create(MPrompt.Title, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 0.3}):Play()
    	end
    
    	for _, TopbarButton in ipairs(Topbar:GetChildren()) do
    		if TopbarButton.ClassName == "ImageButton" then
    			TweenService:Create(TopbarButton, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
    		end
    	end
    
    	for _, tabbtn in ipairs(TabList:GetChildren()) do
    		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
    			TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
    			TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    			TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
    			TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    		end
    	end
    
    	dragInteract.Visible = false
    
    	for _, tab in ipairs(Elements:GetChildren()) do
    		if tab.Name ~= "Template" and tab.ClassName == "ScrollingFrame" and tab.Name ~= "Placeholder" then
    			for _, element in ipairs(tab:GetChildren()) do
    				if element.ClassName == "Frame" then
    					if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" then
    						if element.Name == "SectionTitle" or element.Name == 'SearchTitle-fsefsefesfsefesfesfThanks' then
    							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    						elseif element.Name == 'Divider' then
    							TweenService:Create(element.Divider, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
    						else
    							TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
    							TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    						end
    						for _, child in ipairs(element:GetChildren()) do
    							if child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel" then
    								child.Visible = false
    							end
    						end
    					end
    				end
    			end
    		end
    	end
    
    	task.wait(0.5)
    	Main.Visible = false
    	Debounce = false
    end
    
    local function Maximise()
    	Debounce = true
    	Topbar.ChangeSize.Image = "rbxassetid://"..10137941941
    
    	TweenService:Create(Topbar.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {ImageTransparency = 0.6}):Play()
    	TweenService:Create(Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    	TweenService:Create(Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    	TweenService:Create(dragBarCosmetic, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {BackgroundTransparency = 0.7}):Play()
    	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = useMobileSizing and UDim2.new(0, 500, 0, 275) or UDim2.new(0, 500, 0, 475)}):Play()
    	TweenService:Create(Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 500, 0, 45)}):Play()
    	TabList.Visible = true
    	task.wait(0.2)
    
    	Elements.Visible = true
    
    	for _, tab in ipairs(Elements:GetChildren()) do
    		if tab.Name ~= "Template" and tab.ClassName == "ScrollingFrame" and tab.Name ~= "Placeholder" then
    			for _, element in ipairs(tab:GetChildren()) do
    				if element.ClassName == "Frame" then
    					if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" then
    						if element.Name == "SectionTitle" or element.Name == 'SearchTitle-fsefsefesfsefesfesfThanks' then
    							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0.4}):Play()
    						elseif element.Name == 'Divider' then
    							TweenService:Create(element.Divider, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.85}):Play()
    						else
    							TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    							TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    						end
    						for _, child in ipairs(element:GetChildren()) do
    							if child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel" then
    								child.Visible = true
    							end
    						end
    					end
    				end
    			end
    		end
    	end
    
    	task.wait(0.1)
    
    	for _, tabbtn in ipairs(TabList:GetChildren()) do
    		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
    			if tostring(Elements.UIPageLayout.CurrentPage) == tabbtn.Title.Text then
    				TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    				TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 0}):Play()
    				TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    				TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    			else
    				TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.7}):Play()
    				TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 0.2}):Play()
    				TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0.2}):Play()
    				TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
    			end
    
    		end
    	end
    
    	task.wait(0.5)
    	Debounce = false
    end
    
    
    local function Unhide()
    	Debounce = true
    	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    	Main.Visible = true
    	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = useMobileSizing and UDim2.new(0, 500, 0, 275) or UDim2.new(0, 500, 0, 475)}):Play()
    	TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 500, 0, 45)}):Play()
    	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0.6}):Play()
    	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    	TweenService:Create(Main.Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    	TweenService:Create(Main.Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    	TweenService:Create(Main.Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    	TweenService:Create(Main.Topbar.Title, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    
    	if MPrompt then
    		TweenService:Create(MPrompt, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 40, 0, 10), Position = UDim2.new(0.5, 0, 0, -50), BackgroundTransparency = 1}):Play()
    		TweenService:Create(MPrompt.Title, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    
    		task.spawn(function()
    			task.wait(0.5)
    			MPrompt.Visible = false
    		end)
    	end
    
    	if Minimised then
    		task.spawn(Maximise)
    	end
    
    	dragBar.Position = useMobileSizing and UDim2.new(0.5, 0, 0.5, dragOffsetMobile) or UDim2.new(0.5, 0, 0.5, dragOffset)
    
    	dragInteract.Visible = true
    
    	for _, TopbarButton in ipairs(Topbar:GetChildren()) do
    		if TopbarButton.ClassName == "ImageButton" then
    			if TopbarButton.Name == 'Icon' then
    				TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0}):Play()
    			else
    				TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0.8}):Play()
    			end
    
    		end
    	end
    
    	for _, tabbtn in ipairs(TabList:GetChildren()) do
    		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
    			if tostring(Elements.UIPageLayout.CurrentPage) == tabbtn.Title.Text then
    				TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    				TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    				TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 0}):Play()
    				TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    			else
    				TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.7}):Play()
    				TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 0.2}):Play()
    				TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0.2}):Play()
    				TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
    			end
    		end
    	end
    
    	for _, tab in ipairs(Elements:GetChildren()) do
    		if tab.Name ~= "Template" and tab.ClassName == "ScrollingFrame" and tab.Name ~= "Placeholder" then
    			for _, element in ipairs(tab:GetChildren()) do
    				if element.ClassName == "Frame" then
    					if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" then
    						if element.Name == "SectionTitle" or element.Name == 'SearchTitle-fsefsefesfsefesfesfThanks' then
    							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0.4}):Play()
    						elseif element.Name == 'Divider' then
    							TweenService:Create(element.Divider, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.85}):Play()
    						else
    							TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    							TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    						end
    						for _, child in ipairs(element:GetChildren()) do
    							if child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel" then
    								child.Visible = true
    							end
    						end
    					end
    				end
    			end
    		end
    	end
    
    	TweenService:Create(dragBarCosmetic, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {BackgroundTransparency = 0.5}):Play()
    
    	task.wait(0.5)
    	Minimised = false
    	Debounce = false
    end
    
    local function Minimise()
    	Debounce = true
    	Topbar.ChangeSize.Image = "rbxassetid://"..11036884234
    
    	Topbar.UIStroke.Color = SelectedTheme.ElementStroke
    
    	task.spawn(closeSearch)
    
    	for _, tabbtn in ipairs(TabList:GetChildren()) do
    		if tabbtn.ClassName == "Frame" and tabbtn.Name ~= "Placeholder" then
    			TweenService:Create(tabbtn, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
    			TweenService:Create(tabbtn.Image, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
    			TweenService:Create(tabbtn.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    			TweenService:Create(tabbtn.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    		end
    	end
    
    	for _, tab in ipairs(Elements:GetChildren()) do
    		if tab.Name ~= "Template" and tab.ClassName == "ScrollingFrame" and tab.Name ~= "Placeholder" then
    			for _, element in ipairs(tab:GetChildren()) do
    				if element.ClassName == "Frame" then
    					if element.Name ~= "SectionSpacing" and element.Name ~= "Placeholder" then
    						if element.Name == "SectionTitle" or element.Name == 'SearchTitle-fsefsefesfsefesfesfThanks' then
    							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    						elseif element.Name == 'Divider' then
    							TweenService:Create(element.Divider, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
    						else
    							TweenService:Create(element, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
    							TweenService:Create(element.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    							TweenService:Create(element.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    						end
    						for _, child in ipairs(element:GetChildren()) do
    							if child.ClassName == "Frame" or child.ClassName == "TextLabel" or child.ClassName == "TextBox" or child.ClassName == "ImageButton" or child.ClassName == "ImageLabel" then
    								child.Visible = false
    							end
    						end
    					end
    				end
    			end
    		end
    	end
    
    	TweenService:Create(dragBarCosmetic, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
    	TweenService:Create(Topbar.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
    	TweenService:Create(Topbar.CornerRepair, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
    	TweenService:Create(Topbar.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
    	TweenService:Create(Main, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 495, 0, 45)}):Play()
    	TweenService:Create(Topbar, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 495, 0, 45)}):Play()
    
    	task.wait(0.3)
    
    	Elements.Visible = false
    	TabList.Visible = false
    
    	task.wait(0.2)
    	Debounce = false
    end
    
    local function updateSettings()
    	local encoded
    	local success, err = pcall(function()
    		encoded = HttpService:JSONEncode(settingsTable)
    	end)
    
    	if success then
    		if useStudio then
    			if script.Parent['get.val'] then
    				script.Parent['get.val'].Value = encoded
    			end
    		end
    		if writefile then
    			writefile(RayfieldFolder..'/settings'..ConfigurationExtension, encoded)
    		end
    	end
    end
    
    local function createSettings(window)
    	if not (writefile and isfile and readfile and isfolder and makefolder) and not useStudio then
    		if Topbar['Settings'] then Topbar.Settings.Visible = false end
    		Topbar['Search'].Position = UDim2.new(1, -75, 0.5, 0)
    		warn('Can\'t create settings as no file-saving functionality is available.')
    		return
    	end
    
    	local newTab = window:CreateTab('Rayfield Settings', 0, true)
    
    	if TabList['Rayfield Settings'] then
    		TabList['Rayfield Settings'].LayoutOrder = 1000
    	end
    
    	if Elements['Rayfield Settings'] then
    		Elements['Rayfield Settings'].LayoutOrder = 1000
    	end
    
    	-- Create sections and elements
    	for categoryName, settingCategory in pairs(settingsTable) do
    		newTab:CreateSection(categoryName)
    
    		for _, setting in pairs(settingCategory) do
    			if setting.Type == 'input' then
    				setting.Element = newTab:CreateInput({
    					Name = setting.Name,
    					CurrentValue = setting.Value,
    					PlaceholderText = setting.Placeholder,
    					Ext = true,
    					RemoveTextAfterFocusLost = setting.ClearOnFocus,
    					Callback = function(Value)
    						setting.Value = Value
    						updateSettings()
    					end,
    				})
    			elseif setting.Type == 'toggle' then
    				setting.Element = newTab:CreateToggle({
    					Name = setting.Name,
    					CurrentValue = setting.Value,
    					Ext = true,
    					Callback = function(Value)
    						setting.Value = Value
    						updateSettings()
    					end,
    				})
    			elseif setting.Type == 'bind' then
    				setting.Element = newTab:CreateKeybind({
    					Name = setting.Name,
    					CurrentKeybind = setting.Value,
    					HoldToInteract = false,
    					Ext = true,
    					CallOnChange = true,
    					Callback = function(Value)
    						setting.Value = Value
    						updateSettings()
    					end,
    				})
    			end
    		end
    	end
    
    	settingsCreated = true
    	loadSettings()
    	updateSettings()
    end
    
    
    
    function RayfieldLibrary:CreateWindow(Settings)
    	if Rayfield:FindFirstChild('Loading') then
    		if getgenv and not getgenv().rayfieldCached then
    			Rayfield.Enabled = true
    			Rayfield.Loading.Visible = true
    
    			task.wait(1.4)
    			Rayfield.Loading.Visible = false
    		end
    	end
    
    	if getgenv then getgenv().rayfieldCached = true end
    
    	if not correctBuild and not Settings.DisableBuildWarnings then
    		task.delay(3,
    			function()
    				RayfieldLibrary:Notify({Title = 'Build Mismatch', Content = 'Rayfield may encounter issues as you are running an incompatible interface version ('.. ((Rayfield:FindFirstChild('Build') and Rayfield.Build.Value) or 'No Build') ..').\n\nThis version of Rayfield is intended for interface build '..InterfaceBuild..'.\n\nTry rejoining and then run the script twice.', Image = 4335487866, Duration = 15})
    			end)
    	end
    
    	if isfolder and not isfolder(RayfieldFolder) then
    		makefolder(RayfieldFolder)
    	end
    
    	local Passthrough = false
    	Topbar.Title.Text = Settings.Name
    
    	Main.Size = UDim2.new(0, 420, 0, 100)
    	Main.Visible = true
    	Main.BackgroundTransparency = 1
    	if Main:FindFirstChild('Notice') then Main.Notice.Visible = false end
    	Main.Shadow.Image.ImageTransparency = 1
    
    	LoadingFrame.Title.TextTransparency = 1
    	LoadingFrame.Subtitle.TextTransparency = 1
    
    	LoadingFrame.Version.TextTransparency = 1
    	LoadingFrame.Title.Text = Settings.LoadingTitle or "Rayfield"
    	LoadingFrame.Subtitle.Text = Settings.LoadingSubtitle or "Interface Suite"
    
    	if Settings.LoadingTitle ~= "Rayfield Interface Suite" then
    		LoadingFrame.Version.Text = "Rayfield UI"
    	end
    
    	if Settings.Icon and Settings.Icon ~= 0 and Topbar:FindFirstChild('Icon') then
    		Topbar.Icon.Visible = true
    		Topbar.Title.Position = UDim2.new(0, 47, 0.5, 0)
    
    		if Settings.Icon then
    			if typeof(Settings.Icon) == 'string' then
    				local asset = getIcon(Settings.Icon)
    
    				Topbar.Icon.Image = 'rbxassetid://'..asset.id
    				Topbar.Icon.ImageRectOffset = asset.imageRectOffset
    				Topbar.Icon.ImageRectSize = asset.imageRectSize
    			else
    				Topbar.Icon.Image = "rbxassetid://" .. (Settings.Icon or 0)
    			end
    		else
    			Topbar.Icon.Image = "rbxassetid://" .. 0
    		end
    	end
    
    	if dragBar then
    		dragBar.Visible = false
    		dragBarCosmetic.BackgroundTransparency = 1
    		dragBar.Visible = true
    	end
    
    	if Settings.Theme then
    		local success, result = pcall(ChangeTheme, Settings.Theme)
    		if not success then
    			local success, result2 = pcall(ChangeTheme, 'Default')
    			if not success then
    				warn('CRITICAL ERROR - NO DEFAULT THEME')
    				print(result2)
    			end
    			warn('issue rendering theme. no theme on file')
    			print(result)
    		end
    	end
    
    	Topbar.Visible = false
    	Elements.Visible = false
    	LoadingFrame.Visible = true
    
    	if not Settings.DisableRayfieldPrompts then
    		task.spawn(function()
    			while true do
    				task.wait(math.random(180, 600))
    				RayfieldLibrary:Notify({
    					Title = "Rayfield Interface",
    					Content = "Enjoying this UI library? Find it at sirius.menu/discord",
    					Duration = 7,
    					Image = 4370033185,
    				})
    			end
    		end)
    	end
    
    	pcall(function()
    		if not Settings.ConfigurationSaving.FileName then
    			Settings.ConfigurationSaving.FileName = tostring(game.PlaceId)
    		end
    
    		if Settings.ConfigurationSaving.Enabled == nil then
    			Settings.ConfigurationSaving.Enabled = false
    		end
    
    		CFileName = Settings.ConfigurationSaving.FileName
    		ConfigurationFolder = Settings.ConfigurationSaving.FolderName or ConfigurationFolder
    		CEnabled = Settings.ConfigurationSaving.Enabled
    
    		if Settings.ConfigurationSaving.Enabled then
    			if not isfolder(ConfigurationFolder) then
    				makefolder(ConfigurationFolder)
    			end
    		end
    	end)
    
    
    	makeDraggable(Main, Topbar, false, {dragOffset, dragOffsetMobile})
    	if dragBar then dragBar.Position = useMobileSizing and UDim2.new(0.5, 0, 0.5, dragOffsetMobile) or UDim2.new(0.5, 0, 0.5, dragOffset) makeDraggable(Main, dragInteract, true, {dragOffset, dragOffsetMobile}) end
    
    	for _, TabButton in ipairs(TabList:GetChildren()) do
    		if TabButton.ClassName == "Frame" and TabButton.Name ~= "Placeholder" then
    			TabButton.BackgroundTransparency = 1
    			TabButton.Title.TextTransparency = 1
    			TabButton.Image.ImageTransparency = 1
    			TabButton.UIStroke.Transparency = 1
    		end
    	end
    
    	if Settings.Discord and not useStudio then
    		if isfolder and not isfolder(RayfieldFolder.."/Discord Invites") then
    			makefolder(RayfieldFolder.."/Discord Invites")
    		end
    
    		if isfile and not isfile(RayfieldFolder.."/Discord Invites".."/"..Settings.Discord.Invite..ConfigurationExtension) then
    			if request then
    				pcall(function()
    					request({
    						Url = 'http://127.0.0.1:6463/rpc?v=1',
    						Method = 'POST',
    						Headers = {
    							['Content-Type'] = 'application/json',
    							Origin = 'https://discord.com'
    						},
    						Body = HttpService:JSONEncode({
    							cmd = 'INVITE_BROWSER',
    							nonce = HttpService:GenerateGUID(false),
    							args = {code = Settings.Discord.Invite}
    						})
    					})
    				end)
    			end
    
    			if Settings.Discord.RememberJoins then -- We do logic this way so if the developer changes this setting, the user still won't be prompted, only new users
    				writefile(RayfieldFolder.."/Discord Invites".."/"..Settings.Discord.Invite..ConfigurationExtension,"Rayfield RememberJoins is true for this invite, this invite will not ask you to join again")
    			end
    		end
    	end
    
    	if (Settings.KeySystem) then
    		if not Settings.KeySettings then
    			Passthrough = true
    			return
    		end
    
    		if isfolder and not isfolder(RayfieldFolder.."/Key System") then
    			makefolder(RayfieldFolder.."/Key System")
    		end
    
    		if typeof(Settings.KeySettings.Key) == "string" then Settings.KeySettings.Key = {Settings.KeySettings.Key} end
    
    		if Settings.KeySettings.GrabKeyFromSite then
    			for i, Key in ipairs(Settings.KeySettings.Key) do
    				local Success, Response = pcall(function()
    					Settings.KeySettings.Key[i] = tostring(game:HttpGet(Key):gsub("[\n\r]", " "))
    					Settings.KeySettings.Key[i] = string.gsub(Settings.KeySettings.Key[i], " ", "")
    				end)
    				if not Success then
    					print("Rayfield | "..Key.." Error " ..tostring(Response))
    					warn('Check docs.sirius.menu for help with Rayfield specific development.')
    				end
    			end
    		end
    
    		if not Settings.KeySettings.FileName then
    			Settings.KeySettings.FileName = "No file name specified"
    		end
    
    		if isfile and isfile(RayfieldFolder.."/Key System".."/"..Settings.KeySettings.FileName..ConfigurationExtension) then
    			Passthrough = Settings.KeySettings.ValidateCallback(readfile(RayfieldFolder.."/Key System".."/"..Settings.KeySettings.FileName..ConfigurationExtension))
    		end
    
    		if not Passthrough then
    			local AttemptsRemaining = math.random(2, 5)
    			Rayfield.Enabled = false
    			local KeyUI = useStudio and script.Parent:FindFirstChild('Key') or game:GetObjects("rbxassetid://11380036235")[1]
    
    			KeyUI.Enabled = true
    
    			if gethui then
    				KeyUI.Parent = gethui()
    			elseif syn and syn.protect_gui then
    				syn.protect_gui(KeyUI)
    				KeyUI.Parent = CoreGui
    			elseif not useStudio and CoreGui:FindFirstChild("RobloxGui") then
    				KeyUI.Parent = CoreGui:FindFirstChild("RobloxGui")
    			elseif not useStudio then
    				KeyUI.Parent = CoreGui
    			end
    
    			if gethui then
    				for _, Interface in ipairs(gethui():GetChildren()) do
    					if Interface.Name == KeyUI.Name and Interface ~= KeyUI then
    						Interface.Enabled = false
    						Interface.Name = "KeyUI-Old"
    					end
    				end
    			elseif not useStudio then
    				for _, Interface in ipairs(CoreGui:GetChildren()) do
    					if Interface.Name == KeyUI.Name and Interface ~= KeyUI then
    						Interface.Enabled = false
    						Interface.Name = "KeyUI-Old"
    					end
    				end
    			end
    
    			local KeyMain = KeyUI.Main
    			KeyMain.Title.Text = Settings.KeySettings.Title or Settings.Name
    			KeyMain.Subtitle.Text = Settings.KeySettings.Subtitle or "Key System"
    			KeyMain.NoteMessage.Text = Settings.KeySettings.Note or "No instructions"
    
    			KeyMain.Size = UDim2.new(0, 467, 0, 175)
    			KeyMain.BackgroundTransparency = 1
    			KeyMain.Shadow.Image.ImageTransparency = 1
    			KeyMain.Title.TextTransparency = 1
    			KeyMain.Subtitle.TextTransparency = 1
    			KeyMain.KeyNote.TextTransparency = 1
    			KeyMain.Input.BackgroundTransparency = 1
    			KeyMain.Input.UIStroke.Transparency = 1
    			KeyMain.Input.InputBox.TextTransparency = 1
    			KeyMain.NoteTitle.TextTransparency = 1
    			KeyMain.NoteMessage.TextTransparency = 1
    			KeyMain.Hide.ImageTransparency = 1
    
    			TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    			TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 500, 0, 187)}):Play()
    			TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {ImageTransparency = 0.5}):Play()
    			task.wait(0.05)
    			TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    			TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    			task.wait(0.05)
    			TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    			TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    			TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    			TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    			task.wait(0.05)
    			TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    			TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    			task.wait(0.15)
    			TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {ImageTransparency = 0.3}):Play()
    
    
    			KeyUI.Main.Input.InputBox.FocusLost:Connect(function()
    				if #KeyUI.Main.Input.InputBox.Text == 0 then return end
    				local KeyFound, deniedReason = Settings.KeySettings.ValidateCallback(KeyMain.Input.InputBox.Text)
    				if KeyFound then
    					TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
    					TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 467, 0, 175)}):Play()
    					TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
    					TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    					TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    					TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    					TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
    					TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    					TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    					TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    					TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    					TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
    					task.wait(0.51)
    					Passthrough = true
    					KeyMain.Visible = false
    					if Settings.KeySettings.SaveKey then
    						if writefile then
    							writefile(RayfieldFolder.."/Key System".."/"..Settings.KeySettings.FileName..ConfigurationExtension, KeyMain.Input.InputBox.Text)
    						end
    						RayfieldLibrary:Notify({Title = "Key System", Content = "The key for this script has been saved successfully.", Image = 3605522284})
    					end
    				else
    					task.spawn(function()
    						local originalNoteTitleText = KeyMain.NoteTitle.Text
    						local originalNoteText = KeyMain.NoteMessage.Text
    						if #deniedReason >= 46 then
    							KeyMain.NoteMessage.TextSize = 12
    						end
    						KeyMain.NoteTitle.Text = "Error"
    						KeyMain.NoteMessage.Text = deniedReason
    						task.wait(3)
    						if #deniedReason >= 46 then
    							KeyMain.NoteMessage.TextSize = 14
    						end
    						KeyMain.NoteTitle.Text = originalNoteTitleText
    						KeyMain.NoteMessage.Text = originalNoteText
    					end)
    					if AttemptsRemaining == 0 then
    						TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
    						TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 467, 0, 175)}):Play()
    						TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
    						TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    						TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    						TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    						TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
    						TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    						TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    						TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    						TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    						TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
    						task.wait(0.45)
    						Players.LocalPlayer:Kick("No Attempts Remaining")
    						game:Shutdown()
    					end
    					KeyMain.Input.InputBox.Text = ""
    					AttemptsRemaining = AttemptsRemaining - 1
    					TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 467, 0, 175)}):Play()
    					TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Elastic), {Position = UDim2.new(0.495,0,0.5,0)}):Play()
    					task.wait(0.1)
    					TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Elastic), {Position = UDim2.new(0.505,0,0.5,0)}):Play()
    					task.wait(0.1)
    					TweenService:Create(KeyMain, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {Position = UDim2.new(0.5,0,0.5,0)}):Play()
    					TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 500, 0, 187)}):Play()
    				end
    			end)
    
    			KeyMain.Hide.MouseButton1Click:Connect(function()
    				TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
    				TweenService:Create(KeyMain, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 467, 0, 175)}):Play()
    				TweenService:Create(KeyMain.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
    				TweenService:Create(KeyMain.Title, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    				TweenService:Create(KeyMain.Subtitle, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    				TweenService:Create(KeyMain.KeyNote, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    				TweenService:Create(KeyMain.Input, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
    				TweenService:Create(KeyMain.Input.UIStroke, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    				TweenService:Create(KeyMain.Input.InputBox, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    				TweenService:Create(KeyMain.NoteTitle, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    				TweenService:Create(KeyMain.NoteMessage, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    				TweenService:Create(KeyMain.Hide, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
    				task.wait(0.51)
    				RayfieldLibrary:Destroy()
    				KeyUI:Destroy()
    			end)
    		else
    			Passthrough = true
    		end
    	end
    	if Settings.KeySystem then
    		repeat task.wait() until Passthrough
    	end
    
    	task.wait(0.5)
    	TweenService:Create(Main, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0.6}):Play()
    	task.wait(0.1)
    	TweenService:Create(LoadingFrame.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    	task.wait(0.05)
    	TweenService:Create(LoadingFrame.Subtitle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    	task.wait(0.05)
    	TweenService:Create(LoadingFrame.Version, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    
    	Rayfield.Enabled = true
    	Notifications.Template.Visible = false
    	Notifications.Visible = true
    
    	Elements.Template.LayoutOrder = 100000
    	Elements.Template.Visible = false
    
    	Elements.UIPageLayout.FillDirection = Enum.FillDirection.Horizontal
    	TabList.Template.Visible = false
    
    	-- Tab
    	local FirstTab = false
    	local Window = {}
    	getgenv().LEAFHUB_WINDOW = Window
    	function Window:SetWindowName(newName)
    		Settings.Name = newName
    		Topbar.Title.Text = newName
    	end
    
    	function Window:CreateTab(Name, Image, Ext)
    		local SDone = false
    		local TabButton = TabList.Template:Clone()
    		TabButton.Name = Name
    		TabButton.Title.Text = Name
    		TabButton.Parent = TabList
    		TabButton.Title.TextWrapped = false
    		TabButton.Size = UDim2.new(0, TabButton.Title.TextBounds.X + 30, 0, 30)
    
    		if Image and Image ~= 0 then
    			if typeof(Image) == 'string' then
    				local asset = getIcon(Image)
    
    				TabButton.Image.Image = 'rbxassetid://'..asset.id
    				TabButton.Image.ImageRectOffset = asset.imageRectOffset
    				TabButton.Image.ImageRectSize = asset.imageRectSize
    			else
    				TabButton.Image.Image = "rbxassetid://"..Image
    			end
    
    			TabButton.Title.AnchorPoint = Vector2.new(0, 0.5)
    			TabButton.Title.Position = UDim2.new(0, 37, 0.5, 0)
    			TabButton.Image.Visible = true
    			TabButton.Title.TextXAlignment = Enum.TextXAlignment.Left
    			TabButton.Size = UDim2.new(0, TabButton.Title.TextBounds.X + 52, 0, 30)
    		end
    
    
    
    		TabButton.BackgroundTransparency = 1
    		TabButton.Title.TextTransparency = 1
    		TabButton.Image.ImageTransparency = 1
    		TabButton.UIStroke.Transparency = 1
    
    		TabButton.Visible = not Ext or false
    
    		-- Create Elements Page
    		local TabPage = Elements.Template:Clone()
    		TabPage.Name = Name
    		TabPage.Visible = true
    
    		TabPage.LayoutOrder = #Elements:GetChildren() or Ext and 10000
    
    		for _, TemplateElement in ipairs(TabPage:GetChildren()) do
    			if TemplateElement.ClassName == "Frame" and TemplateElement.Name ~= "Placeholder" then
    				TemplateElement:Destroy()
    			end
    		end
    
    		TabPage.Parent = Elements
    		if not FirstTab and not Ext then
    			Elements.UIPageLayout.Animated = false
    			Elements.UIPageLayout:JumpTo(TabPage)
    			Elements.UIPageLayout.Animated = true
    		end
    
    		TabButton.UIStroke.Color = SelectedTheme.TabStroke
    
    		if Elements.UIPageLayout.CurrentPage == TabPage then
    			TabButton.BackgroundColor3 = SelectedTheme.TabBackgroundSelected
    			TabButton.Image.ImageColor3 = SelectedTheme.SelectedTabTextColor
    			TabButton.Title.TextColor3 = SelectedTheme.SelectedTabTextColor
    		else
    			TabButton.BackgroundColor3 = SelectedTheme.TabBackground
    			TabButton.Image.ImageColor3 = SelectedTheme.TabTextColor
    			TabButton.Title.TextColor3 = SelectedTheme.TabTextColor
    		end
    
    
    		-- Animate
    		task.wait(0.1)
    		if FirstTab or Ext then
    			TabButton.BackgroundColor3 = SelectedTheme.TabBackground
    			TabButton.Image.ImageColor3 = SelectedTheme.TabTextColor
    			TabButton.Title.TextColor3 = SelectedTheme.TabTextColor
    			TweenService:Create(TabButton, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.7}):Play()
    			TweenService:Create(TabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0.2}):Play()
    			TweenService:Create(TabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0.2}):Play()
    			TweenService:Create(TabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
    		elseif not Ext then
    			FirstTab = Name
    			TabButton.BackgroundColor3 = SelectedTheme.TabBackgroundSelected
    			TabButton.Image.ImageColor3 = SelectedTheme.SelectedTabTextColor
    			TabButton.Title.TextColor3 = SelectedTheme.SelectedTabTextColor
    			TweenService:Create(TabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0}):Play()
    			TweenService:Create(TabButton, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    			TweenService:Create(TabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    		end
    
    
    		TabButton.Interact.MouseButton1Click:Connect(function()
    			if Minimised then return end
    			TweenService:Create(TabButton, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    			TweenService:Create(TabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    			TweenService:Create(TabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    			TweenService:Create(TabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0}):Play()
    			TweenService:Create(TabButton, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.TabBackgroundSelected}):Play()
    			TweenService:Create(TabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextColor3 = SelectedTheme.SelectedTabTextColor}):Play()
    			TweenService:Create(TabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageColor3 = SelectedTheme.SelectedTabTextColor}):Play()
    
    			for _, OtherTabButton in ipairs(TabList:GetChildren()) do
    				if OtherTabButton.Name ~= "Template" and OtherTabButton.ClassName == "Frame" and OtherTabButton ~= TabButton and OtherTabButton.Name ~= "Placeholder" then
    					TweenService:Create(OtherTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.TabBackground}):Play()
    					TweenService:Create(OtherTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextColor3 = SelectedTheme.TabTextColor}):Play()
    					TweenService:Create(OtherTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageColor3 = SelectedTheme.TabTextColor}):Play()
    					TweenService:Create(OtherTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.7}):Play()
    					TweenService:Create(OtherTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0.2}):Play()
    					TweenService:Create(OtherTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0.2}):Play()
    					TweenService:Create(OtherTabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
    				end
    			end
    
    			if Elements.UIPageLayout.CurrentPage ~= TabPage then
    				Elements.UIPageLayout:JumpTo(TabPage)
    			end
    		end)
    
    		local Tab = {}
    
    		-- Button
    		function Tab:CreateButton(ButtonSettings)
    			local ButtonValue = {}
    
    			local Button = Elements.Template.Button:Clone()
    			Button.Name = ButtonSettings.Name
    			Button.Title.Text = ButtonSettings.Name
    			Button.Visible = true
    			Button.Parent = TabPage
    
    			Button.BackgroundTransparency = 1
    			Button.UIStroke.Transparency = 1
    			Button.Title.TextTransparency = 1
    
    			TweenService:Create(Button, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    			TweenService:Create(Button.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    			TweenService:Create(Button.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    
    
    			Button.Interact.MouseButton1Click:Connect(function()
    				local Success, Response = pcall(ButtonSettings.Callback)
    				if not Success then
    					TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
    					TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    					TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    					Button.Title.Text = "Callback Error"
    					print("Rayfield | "..ButtonSettings.Name.." Callback Error " ..tostring(Response))
    					warn('Check docs.sirius.menu for help with Rayfield specific development.')
    					task.wait(0.5)
    					Button.Title.Text = ButtonSettings.Name
    					TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    					TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {TextTransparency = 0.9}):Play()
    					TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    				else
    					if not ButtonSettings.Ext then
    						SaveConfiguration(ButtonSettings.Name..'\n')
    					end
    					TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
    					TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    					TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    					task.wait(0.2)
    					TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    					TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {TextTransparency = 0.9}):Play()
    					TweenService:Create(Button.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    				end
    			end)
    
    			Button.MouseEnter:Connect(function()
    				TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
    				TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {TextTransparency = 0.7}):Play()
    			end)
    
    			Button.MouseLeave:Connect(function()
    				TweenService:Create(Button, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    				TweenService:Create(Button.ElementIndicator, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {TextTransparency = 0.9}):Play()
    			end)
    
    			function ButtonValue:Set(NewButton)
    				Button.Title.Text = NewButton
    				Button.Name = NewButton
    			end
    
    			return ButtonValue
    		end
    
    		-- ColorPicker
    		function Tab:CreateColorPicker(ColorPickerSettings) -- by Throit
    			ColorPickerSettings.Type = "ColorPicker"
    			local ColorPicker = Elements.Template.ColorPicker:Clone()
    			local Background = ColorPicker.CPBackground
    			local Display = Background.Display
    			local Main = Background.MainCP
    			local Slider = ColorPicker.ColorSlider
    			ColorPicker.ClipsDescendants = true
    			ColorPicker.Name = ColorPickerSettings.Name
    			ColorPicker.Title.Text = ColorPickerSettings.Name
    			ColorPicker.Visible = true
    			ColorPicker.Parent = TabPage
    			ColorPicker.Size = UDim2.new(1, -10, 0, 45)
    			Background.Size = UDim2.new(0, 39, 0, 22)
    			Display.BackgroundTransparency = 0
    			Main.MainPoint.ImageTransparency = 1
    			ColorPicker.Interact.Size = UDim2.new(1, 0, 1, 0)
    			ColorPicker.Interact.Position = UDim2.new(0.5, 0, 0.5, 0)
    			ColorPicker.RGB.Position = UDim2.new(0, 17, 0, 70)
    			ColorPicker.HexInput.Position = UDim2.new(0, 17, 0, 90)
    			Main.ImageTransparency = 1
    			Background.BackgroundTransparency = 1
    
    			for _, rgbinput in ipairs(ColorPicker.RGB:GetChildren()) do
    				if rgbinput:IsA("Frame") then
    					rgbinput.BackgroundColor3 = SelectedTheme.InputBackground
    					rgbinput.UIStroke.Color = SelectedTheme.InputStroke
    				end
    			end
    
    			ColorPicker.HexInput.BackgroundColor3 = SelectedTheme.InputBackground
    			ColorPicker.HexInput.UIStroke.Color = SelectedTheme.InputStroke
    
    			local opened = false
    			local mouse = Players.LocalPlayer:GetMouse()
    			Main.Image = "http://www.roblox.com/asset/?id=11415645739"
    			local mainDragging = false
    			local sliderDragging = false
    			ColorPicker.Interact.MouseButton1Down:Connect(function()
    				task.spawn(function()
    					TweenService:Create(ColorPicker, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
    					TweenService:Create(ColorPicker.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    					task.wait(0.2)
    					TweenService:Create(ColorPicker, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    					TweenService:Create(ColorPicker.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    				end)
    
    				if not opened then
    					opened = true
    					TweenService:Create(Background, TweenInfo.new(0.45, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 18, 0, 15)}):Play()
    					task.wait(0.1)
    					TweenService:Create(ColorPicker, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, -10, 0, 120)}):Play()
    					TweenService:Create(Background, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 173, 0, 86)}):Play()
    					TweenService:Create(Display, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
    					TweenService:Create(ColorPicker.Interact, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Position = UDim2.new(0.289, 0, 0.5, 0)}):Play()
    					TweenService:Create(ColorPicker.RGB, TweenInfo.new(0.8, Enum.EasingStyle.Exponential), {Position = UDim2.new(0, 17, 0, 40)}):Play()
    					TweenService:Create(ColorPicker.HexInput, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Position = UDim2.new(0, 17, 0, 73)}):Play()
    					TweenService:Create(ColorPicker.Interact, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(0.574, 0, 1, 0)}):Play()
    					TweenService:Create(Main.MainPoint, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {ImageTransparency = 0}):Play()
    					TweenService:Create(Main, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {ImageTransparency = SelectedTheme ~= RayfieldLibrary.Theme.Default and 0.25 or 0.1}):Play()
    					TweenService:Create(Background, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    				else
    					opened = false
    					TweenService:Create(ColorPicker, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, -10, 0, 45)}):Play()
    					TweenService:Create(Background, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(0, 39, 0, 22)}):Play()
    					TweenService:Create(ColorPicker.Interact, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, 0, 1, 0)}):Play()
    					TweenService:Create(ColorPicker.Interact, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
    					TweenService:Create(ColorPicker.RGB, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Position = UDim2.new(0, 17, 0, 70)}):Play()
    					TweenService:Create(ColorPicker.HexInput, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Position = UDim2.new(0, 17, 0, 90)}):Play()
    					TweenService:Create(Display, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    					TweenService:Create(Main.MainPoint, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
    					TweenService:Create(Main, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
    					TweenService:Create(Background, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
    				end
    
    			end)
    
    			UserInputService.InputEnded:Connect(function(input, gameProcessed) if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
    					mainDragging = false
    					sliderDragging = false
    				end end)
    			Main.MouseButton1Down:Connect(function()
    				if opened then
    					mainDragging = true
    				end
    			end)
    			Main.MainPoint.MouseButton1Down:Connect(function()
    				if opened then
    					mainDragging = true
    				end
    			end)
    			Slider.MouseButton1Down:Connect(function()
    				sliderDragging = true
    			end)
    			Slider.SliderPoint.MouseButton1Down:Connect(function()
    				sliderDragging = true
    			end)
    			local h,s,v = ColorPickerSettings.Color:ToHSV()
    			local color = Color3.fromHSV(h,s,v)
    			local hex = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
    			ColorPicker.HexInput.InputBox.Text = hex
    			local function setDisplay()
    				--Main
    				Main.MainPoint.Position = UDim2.new(s,-Main.MainPoint.AbsoluteSize.X/2,1-v,-Main.MainPoint.AbsoluteSize.Y/2)
    				Main.MainPoint.ImageColor3 = Color3.fromHSV(h,s,v)
    				Background.BackgroundColor3 = Color3.fromHSV(h,1,1)
    				Display.BackgroundColor3 = Color3.fromHSV(h,s,v)
    				--Slider
    				local x = h * Slider.AbsoluteSize.X
    				Slider.SliderPoint.Position = UDim2.new(0,x-Slider.SliderPoint.AbsoluteSize.X/2,0.5,0)
    				Slider.SliderPoint.ImageColor3 = Color3.fromHSV(h,1,1)
    				local color = Color3.fromHSV(h,s,v)
    				local r,g,b = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
    				ColorPicker.RGB.RInput.InputBox.Text = tostring(r)
    				ColorPicker.RGB.GInput.InputBox.Text = tostring(g)
    				ColorPicker.RGB.BInput.InputBox.Text = tostring(b)
    				hex = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
    				ColorPicker.HexInput.InputBox.Text = hex
    			end
    			setDisplay()
    			ColorPicker.HexInput.InputBox.FocusLost:Connect(function()
    				if not pcall(function()
    						local r, g, b = string.match(ColorPicker.HexInput.InputBox.Text, "^#?(%w%w)(%w%w)(%w%w)$")
    						local rgbColor = Color3.fromRGB(tonumber(r, 16),tonumber(g, 16), tonumber(b, 16))
    						h,s,v = rgbColor:ToHSV()
    						hex = ColorPicker.HexInput.InputBox.Text
    						setDisplay()
    						ColorPickerSettings.Color = rgbColor
    					end)
    				then
    					ColorPicker.HexInput.InputBox.Text = hex
    				end
    				pcall(function()ColorPickerSettings.Callback(Color3.fromHSV(h,s,v))end)
    				local r,g,b = math.floor((h*255)+0.5),math.floor((s*255)+0.5),math.floor((v*255)+0.5)
    				ColorPickerSettings.Color = Color3.fromRGB(r,g,b)
    				if not ColorPickerSettings.Ext then
    					SaveConfiguration(ColorPickerSettings.Flag..'\n'..tostring(ColorPickerSettings.Color))
    				end
    			end)
    			--RGB
    			local function rgbBoxes(box,toChange)
    				local value = tonumber(box.Text)
    				local color = Color3.fromHSV(h,s,v)
    				local oldR,oldG,oldB = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
    				local save
    				if toChange == "R" then save = oldR
oldR = value elseif toChange == "G" then save = oldG
oldG = value else save = oldB
oldB = value end
    				if value then
    					value = math.clamp(value,0,255)
    					h,s,v = Color3.fromRGB(oldR,oldG,oldB):ToHSV()
    
    					setDisplay()
    				else
    					box.Text = tostring(save)
    				end
    				local r,g,b = math.floor((h*255)+0.5),math.floor((s*255)+0.5),math.floor((v*255)+0.5)
    				ColorPickerSettings.Color = Color3.fromRGB(r,g,b)
    				if not ColorPickerSettings.Ext then
    					SaveConfiguration()
    				end
    			end
    			ColorPicker.RGB.RInput.InputBox.FocusLost:connect(function()
    				rgbBoxes(ColorPicker.RGB.RInput.InputBox,"R")
    				pcall(function()ColorPickerSettings.Callback(Color3.fromHSV(h,s,v))end)
    			end)
    			ColorPicker.RGB.GInput.InputBox.FocusLost:connect(function()
    				rgbBoxes(ColorPicker.RGB.GInput.InputBox,"G")
    				pcall(function()ColorPickerSettings.Callback(Color3.fromHSV(h,s,v))end)
    			end)
    			ColorPicker.RGB.BInput.InputBox.FocusLost:connect(function()
    				rgbBoxes(ColorPicker.RGB.BInput.InputBox,"B")
    				pcall(function()ColorPickerSettings.Callback(Color3.fromHSV(h,s,v))end)
    			end)
    
    			RunService.RenderStepped:connect(function()
    				if mainDragging then
    					local localX = math.clamp(mouse.X-Main.AbsolutePosition.X,0,Main.AbsoluteSize.X)
    					local localY = math.clamp(mouse.Y-Main.AbsolutePosition.Y,0,Main.AbsoluteSize.Y)
    					Main.MainPoint.Position = UDim2.new(0,localX-Main.MainPoint.AbsoluteSize.X/2,0,localY-Main.MainPoint.AbsoluteSize.Y/2)
    					s = localX / Main.AbsoluteSize.X
    					v = 1 - (localY / Main.AbsoluteSize.Y)
    					Display.BackgroundColor3 = Color3.fromHSV(h,s,v)
    					Main.MainPoint.ImageColor3 = Color3.fromHSV(h,s,v)
    					Background.BackgroundColor3 = Color3.fromHSV(h,1,1)
    					local color = Color3.fromHSV(h,s,v)
    					local r,g,b = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
    					ColorPicker.RGB.RInput.InputBox.Text = tostring(r)
    					ColorPicker.RGB.GInput.InputBox.Text = tostring(g)
    					ColorPicker.RGB.BInput.InputBox.Text = tostring(b)
    					ColorPicker.HexInput.InputBox.Text = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
    					pcall(function()ColorPickerSettings.Callback(Color3.fromHSV(h,s,v))end)
    					ColorPickerSettings.Color = Color3.fromRGB(r,g,b)
    					if not ColorPickerSettings.Ext then
    						SaveConfiguration()
    					end
    				end
    				if sliderDragging then
    					local localX = math.clamp(mouse.X-Slider.AbsolutePosition.X,0,Slider.AbsoluteSize.X)
    					h = localX / Slider.AbsoluteSize.X
    					Display.BackgroundColor3 = Color3.fromHSV(h,s,v)
    					Slider.SliderPoint.Position = UDim2.new(0,localX-Slider.SliderPoint.AbsoluteSize.X/2,0.5,0)
    					Slider.SliderPoint.ImageColor3 = Color3.fromHSV(h,1,1)
    					Background.BackgroundColor3 = Color3.fromHSV(h,1,1)
    					Main.MainPoint.ImageColor3 = Color3.fromHSV(h,s,v)
    					local color = Color3.fromHSV(h,s,v)
    					local r,g,b = math.floor((color.R*255)+0.5),math.floor((color.G*255)+0.5),math.floor((color.B*255)+0.5)
    					ColorPicker.RGB.RInput.InputBox.Text = tostring(r)
    					ColorPicker.RGB.GInput.InputBox.Text = tostring(g)
    					ColorPicker.RGB.BInput.InputBox.Text = tostring(b)
    					ColorPicker.HexInput.InputBox.Text = string.format("#%02X%02X%02X",color.R*0xFF,color.G*0xFF,color.B*0xFF)
    					pcall(function()ColorPickerSettings.Callback(Color3.fromHSV(h,s,v))end)
    					ColorPickerSettings.Color = Color3.fromRGB(r,g,b)
    					if not ColorPickerSettings.Ext then
    						SaveConfiguration()
    					end
    				end
    			end)
    
    			if Settings.ConfigurationSaving then
    				if Settings.ConfigurationSaving.Enabled and ColorPickerSettings.Flag then
    					RayfieldLibrary.Flags[ColorPickerSettings.Flag] = ColorPickerSettings
    				end
    			end
    
    			function ColorPickerSettings:Set(RGBColor)
    				ColorPickerSettings.Color = RGBColor
    				h,s,v = ColorPickerSettings.Color:ToHSV()
    				color = Color3.fromHSV(h,s,v)
    				setDisplay()
    			end
    
    			ColorPicker.MouseEnter:Connect(function()
    				TweenService:Create(ColorPicker, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
    			end)
    
    			ColorPicker.MouseLeave:Connect(function()
    				TweenService:Create(ColorPicker, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    			end)
    
    			Rayfield.Main:GetPropertyChangedSignal('BackgroundColor3'):Connect(function()
    				for _, rgbinput in ipairs(ColorPicker.RGB:GetChildren()) do
    					if rgbinput:IsA("Frame") then
    						rgbinput.BackgroundColor3 = SelectedTheme.InputBackground
    						rgbinput.UIStroke.Color = SelectedTheme.InputStroke
    					end
    				end
    
    				ColorPicker.HexInput.BackgroundColor3 = SelectedTheme.InputBackground
    				ColorPicker.HexInput.UIStroke.Color = SelectedTheme.InputStroke
    			end)
    
    			return ColorPickerSettings
    		end
    
    		-- Section
    		function Tab:CreateSection(SectionName)
    
    			local SectionValue = {}
    
    			if SDone then
    				local SectionSpace = Elements.Template.SectionSpacing:Clone()
    				SectionSpace.Visible = true
    				SectionSpace.Parent = TabPage
    			end
    
    			local Section = Elements.Template.SectionTitle:Clone()
    			Section.Title.Text = SectionName
    			Section.Visible = true
    			Section.Parent = TabPage
    
    			Section.Title.TextTransparency = 1
    			TweenService:Create(Section.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0.4}):Play()
    
    			function SectionValue:Set(NewSection)
    				Section.Title.Text = NewSection
    			end
    
    			SDone = true
    
    			return SectionValue
    		end
    
    		-- Divider
    		function Tab:CreateDivider()
    			local DividerValue = {}
    
    			local Divider = Elements.Template.Divider:Clone()
    			Divider.Visible = true
    			Divider.Parent = TabPage
    
    			Divider.Divider.BackgroundTransparency = 1
    			TweenService:Create(Divider.Divider, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.85}):Play()
    
    			function DividerValue:Set(Value)
    				Divider.Visible = Value
    			end
    
    			return DividerValue
    		end
    
    		-- Label
    		function Tab:CreateLabel(LabelText : string, Icon: number, Color : Color3, IgnoreTheme : boolean)
    			local LabelValue = {}
    
    			local Label = Elements.Template.Label:Clone()
    			Label.Title.Text = LabelText
    			Label.Visible = true
    			Label.Parent = TabPage
    
    			Label.BackgroundColor3 = Color or SelectedTheme.SecondaryElementBackground
    			Label.UIStroke.Color = Color or SelectedTheme.SecondaryElementStroke
    
    			if Icon then
    				if typeof(Icon) == 'string' then
    					local asset = getIcon(Icon)
    
    					Label.Icon.Image = 'rbxassetid://'..asset.id
    					Label.Icon.ImageRectOffset = asset.imageRectOffset
    					Label.Icon.ImageRectSize = asset.imageRectSize
    				else
    					Label.Icon.Image = "rbxassetid://" .. (Icon or 0)
    				end
    			else
    				Label.Icon.Image = "rbxassetid://" .. 0
    			end
    
    			if Icon and Label:FindFirstChild('Icon') then
    				Label.Title.Position = UDim2.new(0, 45, 0.5, 0)
    				Label.Title.Size = UDim2.new(1, -100, 0, 14)
    
    				if Icon then
    					if typeof(Icon) == 'string' then
    						local asset = getIcon(Icon)
    
    						Label.Icon.Image = 'rbxassetid://'..asset.id
    						Label.Icon.ImageRectOffset = asset.imageRectOffset
    						Label.Icon.ImageRectSize = asset.imageRectSize
    					else
    						Label.Icon.Image = "rbxassetid://" .. (Icon or 0)
    					end
    				else
    					Label.Icon.Image = "rbxassetid://" .. 0
    				end
    
    				Label.Icon.Visible = true
    			end
    
    			Label.Icon.ImageTransparency = 1
    			Label.BackgroundTransparency = 1
    			Label.UIStroke.Transparency = 1
    			Label.Title.TextTransparency = 1
    
    			TweenService:Create(Label, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = Color and 0.8 or 0}):Play()
    			TweenService:Create(Label.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = Color and 0.7 or 0}):Play()
    			TweenService:Create(Label.Icon, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0.2}):Play()
    			TweenService:Create(Label.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = Color and 0.2 or 0}):Play()
    
    			function LabelValue:Set(NewLabel, Icon, Color)
    				Label.Title.Text = NewLabel
    
    				if Color then
    					Label.BackgroundColor3 = Color or SelectedTheme.SecondaryElementBackground
    					Label.UIStroke.Color = Color or SelectedTheme.SecondaryElementStroke
    				end
    
    				if Icon and Label:FindFirstChild('Icon') then
    					Label.Title.Position = UDim2.new(0, 45, 0.5, 0)
    					Label.Title.Size = UDim2.new(1, -100, 0, 14)
    
    					if Icon then
    						if typeof(Icon) == 'string' then
    							local asset = getIcon(Icon)
    
    							Label.Icon.Image = 'rbxassetid://'..asset.id
    							Label.Icon.ImageRectOffset = asset.imageRectOffset
    							Label.Icon.ImageRectSize = asset.imageRectSize
    						else
    							Label.Icon.Image = "rbxassetid://" .. (Icon or 0)
    						end
    					else
    						Label.Icon.Image = "rbxassetid://" .. 0
    					end
    
    					Label.Icon.Visible = true
    				end
    			end
    
    			Rayfield.Main:GetPropertyChangedSignal('BackgroundColor3'):Connect(function()
    				Label.BackgroundColor3 = IgnoreTheme and (Color or Label.BackgroundColor3) or SelectedTheme.SecondaryElementBackground
    				Label.UIStroke.Color = IgnoreTheme and (Color or Label.BackgroundColor3) or SelectedTheme.SecondaryElementStroke
    			end)
    
    			return LabelValue
    		end
    
    		-- Paragraph
    		function Tab:CreateParagraph(ParagraphSettings)
    			local ParagraphValue = {}
    
    			local Paragraph = Elements.Template.Paragraph:Clone()
    			Paragraph.Title.Text = ParagraphSettings.Title
    			Paragraph.Content.Text = ParagraphSettings.Content
    			Paragraph.Visible = true
    			Paragraph.Parent = TabPage
    
    			Paragraph.BackgroundTransparency = 1
    			Paragraph.UIStroke.Transparency = 1
    			Paragraph.Title.TextTransparency = 1
    			Paragraph.Content.TextTransparency = 1
    
    			Paragraph.BackgroundColor3 = SelectedTheme.SecondaryElementBackground
    			Paragraph.UIStroke.Color = SelectedTheme.SecondaryElementStroke
    
    			TweenService:Create(Paragraph, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    			TweenService:Create(Paragraph.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    			TweenService:Create(Paragraph.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    			TweenService:Create(Paragraph.Content, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    
    			function ParagraphValue:Set(NewParagraphSettings)
    				Paragraph.Title.Text = NewParagraphSettings.Title
    				Paragraph.Content.Text = NewParagraphSettings.Content
    			end
    
    			Rayfield.Main:GetPropertyChangedSignal('BackgroundColor3'):Connect(function()
    				Paragraph.BackgroundColor3 = SelectedTheme.SecondaryElementBackground
    				Paragraph.UIStroke.Color = SelectedTheme.SecondaryElementStroke
    			end)
    
    			return ParagraphValue
    		end
    
    		-- Input
    		function Tab:CreateInput(InputSettings)
    			local Input = Elements.Template.Input:Clone()
    			Input.Name = InputSettings.Name
    			Input.Title.Text = InputSettings.Name
    			Input.Visible = true
    			Input.Parent = TabPage
    
    			Input.BackgroundTransparency = 1
    			Input.UIStroke.Transparency = 1
    			Input.Title.TextTransparency = 1
    
    			Input.InputFrame.InputBox.Text = InputSettings.CurrentValue or ''
    
    			Input.InputFrame.BackgroundColor3 = SelectedTheme.InputBackground
    			Input.InputFrame.UIStroke.Color = SelectedTheme.InputStroke
    
    			TweenService:Create(Input, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    			TweenService:Create(Input.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    			TweenService:Create(Input.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    
    			Input.InputFrame.InputBox.PlaceholderText = InputSettings.PlaceholderText
    			Input.InputFrame.Size = UDim2.new(0, Input.InputFrame.InputBox.TextBounds.X + 24, 0, 30)
    
    			Input.InputFrame.InputBox.FocusLost:Connect(function()
    				local Success, Response = pcall(function()
    					InputSettings.Callback(Input.InputFrame.InputBox.Text)
    					InputSettings.CurrentValue = Input.InputFrame.InputBox.Text
    				end)
    
    				if not Success then
    					TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
    					TweenService:Create(Input.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    					Input.Title.Text = "Callback Error"
    					print("Rayfield | "..InputSettings.Name.." Callback Error " ..tostring(Response))
    					warn('Check docs.sirius.menu for help with Rayfield specific development.')
    					task.wait(0.5)
    					Input.Title.Text = InputSettings.Name
    					TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    					TweenService:Create(Input.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    				end
    
    				if InputSettings.RemoveTextAfterFocusLost then
    					Input.InputFrame.InputBox.Text = ""
    				end
    
    				if not InputSettings.Ext then
    					SaveConfiguration()
    				end
    			end)
    
    			Input.MouseEnter:Connect(function()
    				TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
    			end)
    
    			Input.MouseLeave:Connect(function()
    				TweenService:Create(Input, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    			end)
    
    			Input.InputFrame.InputBox:GetPropertyChangedSignal("Text"):Connect(function()
    				TweenService:Create(Input.InputFrame, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0, Input.InputFrame.InputBox.TextBounds.X + 24, 0, 30)}):Play()
    			end)
    
    			function InputSettings:Set(text)
    				Input.InputFrame.InputBox.Text = text
    				InputSettings.CurrentValue = text
    
    				local Success, Response = pcall(function()
    					InputSettings.Callback(text)
    				end)
    
    				if not InputSettings.Ext then
    					SaveConfiguration()
    				end
    			end
    
    			if Settings.ConfigurationSaving then
    				if Settings.ConfigurationSaving.Enabled and InputSettings.Flag then
    					RayfieldLibrary.Flags[InputSettings.Flag] = InputSettings
    				end
    			end
    
    			Rayfield.Main:GetPropertyChangedSignal('BackgroundColor3'):Connect(function()
    				Input.InputFrame.BackgroundColor3 = SelectedTheme.InputBackground
    				Input.InputFrame.UIStroke.Color = SelectedTheme.InputStroke
    			end)
    
    			return InputSettings
    		end
    
    		-- Dropdown
    		function Tab:CreateDropdown(DropdownSettings)
    			local Dropdown = Elements.Template.Dropdown:Clone()
    			if string.find(DropdownSettings.Name,"closed") then
    				Dropdown.Name = "Dropdown"
    			else
    				Dropdown.Name = DropdownSettings.Name
    			end
    			Dropdown.Title.Text = DropdownSettings.Name
    			Dropdown.Visible = true
    			Dropdown.Parent = TabPage
    
    			Dropdown.List.Visible = false
    			if DropdownSettings.CurrentOption then
    				if type(DropdownSettings.CurrentOption) == "string" then
    					DropdownSettings.CurrentOption = {DropdownSettings.CurrentOption}
    				end
    				if not DropdownSettings.MultipleOptions and type(DropdownSettings.CurrentOption) == "table" then
    					DropdownSettings.CurrentOption = {DropdownSettings.CurrentOption[1]}
    				end
    			else
    				DropdownSettings.CurrentOption = {}
    			end
    
    			if DropdownSettings.MultipleOptions then
    				if DropdownSettings.CurrentOption and type(DropdownSettings.CurrentOption) == "table" then
    					if #DropdownSettings.CurrentOption == 1 then
    						Dropdown.Selected.Text = DropdownSettings.CurrentOption[1]
    					elseif #DropdownSettings.CurrentOption == 0 then
    						Dropdown.Selected.Text = "None"
    					else
    						Dropdown.Selected.Text = "Various"
    					end
    				else
    					DropdownSettings.CurrentOption = {}
    					Dropdown.Selected.Text = "None"
    				end
    			else
    				Dropdown.Selected.Text = DropdownSettings.CurrentOption[1] or "None"
    			end
    
    			Dropdown.Toggle.ImageColor3 = SelectedTheme.TextColor
    			TweenService:Create(Dropdown, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    
    			Dropdown.BackgroundTransparency = 1
    			Dropdown.UIStroke.Transparency = 1
    			Dropdown.Title.TextTransparency = 1
    
    			Dropdown.Size = UDim2.new(1, -10, 0, 45)
    
    			TweenService:Create(Dropdown, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    			TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    			TweenService:Create(Dropdown.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    
    			for _, ununusedoption in ipairs(Dropdown.List:GetChildren()) do
    				if ununusedoption.ClassName == "Frame" and ununusedoption.Name ~= "Placeholder" then
    					ununusedoption:Destroy()
    				end
    			end
    
    			Dropdown.Toggle.Rotation = 180
    
    			Dropdown.Interact.MouseButton1Click:Connect(function()
    				TweenService:Create(Dropdown, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
    				TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    				task.wait(0.1)
    				TweenService:Create(Dropdown, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    				TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    				if Debounce then return end
    				if Dropdown.List.Visible then
    					Debounce = true
    					TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, -10, 0, 45)}):Play()
    					for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
    						if DropdownOpt.ClassName == "Frame" and DropdownOpt.Name ~= "Placeholder" then
    							TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
    							TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    							TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    						end
    					end
    					TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ScrollBarImageTransparency = 1}):Play()
    					TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Rotation = 180}):Play()
    					task.wait(0.35)
    					Dropdown.List.Visible = false
    					Debounce = false
    				else
    					TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, -10, 0, 180)}):Play()
    					Dropdown.List.Visible = true
    					TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ScrollBarImageTransparency = 0.7}):Play()
    					TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Rotation = 0}):Play()
    					for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
    						if DropdownOpt.ClassName == "Frame" and DropdownOpt.Name ~= "Placeholder" then
    							if DropdownOpt.Name ~= Dropdown.Selected.Text then
    								TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    							end
    							TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    							TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    						end
    					end
    				end
    			end)
    
    			Dropdown.MouseEnter:Connect(function()
    				if not Dropdown.List.Visible then
    					TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
    				end
    			end)
    
    			Dropdown.MouseLeave:Connect(function()
    				TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    			end)
    
    			local function SetDropdownOptions()
    				for _, Option in ipairs(DropdownSettings.Options) do
    					local DropdownOption = Elements.Template.Dropdown.List.Template:Clone()
    					DropdownOption.Name = Option
    					DropdownOption.Title.Text = Option
    					DropdownOption.Parent = Dropdown.List
    					DropdownOption.Visible = true
    
    					DropdownOption.BackgroundTransparency = 1
    					DropdownOption.UIStroke.Transparency = 1
    					DropdownOption.Title.TextTransparency = 1
    
    					--local Dropdown = Tab:CreateDropdown({
    					--	Name = "Dropdown Example",
    					--	Options = {"Option 1","Option 2"},
    					--	CurrentOption = {"Option 1"},
    					--  MultipleOptions = true,
    					--	Flag = "Dropdown1",
    					--	Callback = function(TableOfOptions)
    
    					--	end,
    					--})
    
    
    					DropdownOption.Interact.ZIndex = 50
    					DropdownOption.Interact.MouseButton1Click:Connect(function()
    						if not DropdownSettings.MultipleOptions and table.find(DropdownSettings.CurrentOption, Option) then
    							return
    						end
    
    						if table.find(DropdownSettings.CurrentOption, Option) then
    							table.remove(DropdownSettings.CurrentOption, table.find(DropdownSettings.CurrentOption, Option))
    							if DropdownSettings.MultipleOptions then
    								if #DropdownSettings.CurrentOption == 1 then
    									Dropdown.Selected.Text = DropdownSettings.CurrentOption[1]
    								elseif #DropdownSettings.CurrentOption == 0 then
    									Dropdown.Selected.Text = "None"
    								else
    									Dropdown.Selected.Text = "Various"
    								end
    							else
    								Dropdown.Selected.Text = DropdownSettings.CurrentOption[1]
    							end
    						else
    							if not DropdownSettings.MultipleOptions then
    								table.clear(DropdownSettings.CurrentOption)
    							end
    							table.insert(DropdownSettings.CurrentOption, Option)
    							if DropdownSettings.MultipleOptions then
    								if #DropdownSettings.CurrentOption == 1 then
    									Dropdown.Selected.Text = DropdownSettings.CurrentOption[1]
    								elseif #DropdownSettings.CurrentOption == 0 then
    									Dropdown.Selected.Text = "None"
    								else
    									Dropdown.Selected.Text = "Various"
    								end
    							else
    								Dropdown.Selected.Text = DropdownSettings.CurrentOption[1]
    							end
    							TweenService:Create(DropdownOption.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    							TweenService:Create(DropdownOption, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.DropdownSelected}):Play()
    							Debounce = true
    						end
    
    
    						local Success, Response = pcall(function()
    							DropdownSettings.Callback(DropdownSettings.CurrentOption)
    						end)
    
    						if not Success then
    							TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
    							TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    							Dropdown.Title.Text = "Callback Error"
    							print("Rayfield | "..DropdownSettings.Name.." Callback Error " ..tostring(Response))
    							warn('Check docs.sirius.menu for help with Rayfield specific development.')
    							task.wait(0.5)
    							Dropdown.Title.Text = DropdownSettings.Name
    							TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    							TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    						end
    
    						for _, droption in ipairs(Dropdown.List:GetChildren()) do
    							if droption.ClassName == "Frame" and droption.Name ~= "Placeholder" and not table.find(DropdownSettings.CurrentOption, droption.Name) then
    								TweenService:Create(droption, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.DropdownUnselected}):Play()
    							end
    						end
    						if not DropdownSettings.MultipleOptions then
    							task.wait(0.1)
    							TweenService:Create(Dropdown, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, -10, 0, 45)}):Play()
    							for _, DropdownOpt in ipairs(Dropdown.List:GetChildren()) do
    								if DropdownOpt.ClassName == "Frame" and DropdownOpt.Name ~= "Placeholder" then
    									TweenService:Create(DropdownOpt, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {BackgroundTransparency = 1}):Play()
    									TweenService:Create(DropdownOpt.UIStroke, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    									TweenService:Create(DropdownOpt.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    								end
    							end
    							TweenService:Create(Dropdown.List, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {ScrollBarImageTransparency = 1}):Play()
    							TweenService:Create(Dropdown.Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Rotation = 180}):Play()
    							task.wait(0.35)
    							Dropdown.List.Visible = false
    						end
    						Debounce = false
    						if not DropdownSettings.Ext then
    							SaveConfiguration()
    						end
    					end)
    
    					Rayfield.Main:GetPropertyChangedSignal('BackgroundColor3'):Connect(function()
    						DropdownOption.UIStroke.Color = SelectedTheme.ElementStroke
    					end)
    				end
    			end
    			SetDropdownOptions()
    
    			for _, droption in ipairs(Dropdown.List:GetChildren()) do
    				if droption.ClassName == "Frame" and droption.Name ~= "Placeholder" then
    					if not table.find(DropdownSettings.CurrentOption, droption.Name) then
    						droption.BackgroundColor3 = SelectedTheme.DropdownUnselected
    					else
    						droption.BackgroundColor3 = SelectedTheme.DropdownSelected
    					end
    
    					Rayfield.Main:GetPropertyChangedSignal('BackgroundColor3'):Connect(function()
    						if not table.find(DropdownSettings.CurrentOption, droption.Name) then
    							droption.BackgroundColor3 = SelectedTheme.DropdownUnselected
    						else
    							droption.BackgroundColor3 = SelectedTheme.DropdownSelected
    						end
    					end)
    				end
    			end
    
    			function DropdownSettings:Set(NewOption)
    				DropdownSettings.CurrentOption = NewOption
    
    				if typeof(DropdownSettings.CurrentOption) == "string" then
    					DropdownSettings.CurrentOption = {DropdownSettings.CurrentOption}
    				end
    
    				if not DropdownSettings.MultipleOptions then
    					DropdownSettings.CurrentOption = {DropdownSettings.CurrentOption[1]}
    				end
    
    				if DropdownSettings.MultipleOptions then
    					if #DropdownSettings.CurrentOption == 1 then
    						Dropdown.Selected.Text = DropdownSettings.CurrentOption[1]
    					elseif #DropdownSettings.CurrentOption == 0 then
    						Dropdown.Selected.Text = "None"
    					else
    						Dropdown.Selected.Text = "Various"
    					end
    				else
    					Dropdown.Selected.Text = DropdownSettings.CurrentOption[1]
    				end
    
    
    				local Success, Response = pcall(function()
    					DropdownSettings.Callback(NewOption)
    				end)
    				if not Success then
    					TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
    					TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    					Dropdown.Title.Text = "Callback Error"
    					print("Rayfield | "..DropdownSettings.Name.." Callback Error " ..tostring(Response))
    					warn('Check docs.sirius.menu for help with Rayfield specific development.')
    					task.wait(0.5)
    					Dropdown.Title.Text = DropdownSettings.Name
    					TweenService:Create(Dropdown, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    					TweenService:Create(Dropdown.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    				end
    
    				for _, droption in ipairs(Dropdown.List:GetChildren()) do
    					if droption.ClassName == "Frame" and droption.Name ~= "Placeholder" then
    						if not table.find(DropdownSettings.CurrentOption, droption.Name) then
    							droption.BackgroundColor3 = SelectedTheme.DropdownUnselected
    						else
    							droption.BackgroundColor3 = SelectedTheme.DropdownSelected
    						end
    					end
    				end
    				--SaveConfiguration()
    			end
    
    			function DropdownSettings:Refresh(optionsTable: table) -- updates a dropdown with new options from optionsTable
    				DropdownSettings.Options = optionsTable
    				for _, option in Dropdown.List:GetChildren() do
    					if option.ClassName == "Frame" and option.Name ~= "Placeholder" then
    						option:Destroy()
    					end
    				end
    				SetDropdownOptions()
    			end
    
    			if Settings.ConfigurationSaving then
    				if Settings.ConfigurationSaving.Enabled and DropdownSettings.Flag then
    					RayfieldLibrary.Flags[DropdownSettings.Flag] = DropdownSettings
    				end
    			end
    
    			Rayfield.Main:GetPropertyChangedSignal('BackgroundColor3'):Connect(function()
    				Dropdown.Toggle.ImageColor3 = SelectedTheme.TextColor
    				TweenService:Create(Dropdown, TweenInfo.new(0.4, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    			end)
    
    			return DropdownSettings
    		end
    
    		-- Keybind
    		function Tab:CreateKeybind(KeybindSettings)
    			local CheckingForKey = false
    			local Keybind = Elements.Template.Keybind:Clone()
    			Keybind.Name = KeybindSettings.Name
    			Keybind.Title.Text = KeybindSettings.Name
    			Keybind.Visible = true
    			Keybind.Parent = TabPage
    
    			Keybind.BackgroundTransparency = 1
    			Keybind.UIStroke.Transparency = 1
    			Keybind.Title.TextTransparency = 1
    
    			Keybind.KeybindFrame.BackgroundColor3 = SelectedTheme.InputBackground
    			Keybind.KeybindFrame.UIStroke.Color = SelectedTheme.InputStroke
    
    			TweenService:Create(Keybind, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    			TweenService:Create(Keybind.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    			TweenService:Create(Keybind.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    
    			Keybind.KeybindFrame.KeybindBox.Text = KeybindSettings.CurrentKeybind
    			Keybind.KeybindFrame.Size = UDim2.new(0, Keybind.KeybindFrame.KeybindBox.TextBounds.X + 24, 0, 30)
    
    			Keybind.KeybindFrame.KeybindBox.Focused:Connect(function()
    				CheckingForKey = true
    				Keybind.KeybindFrame.KeybindBox.Text = ""
    			end)
    			Keybind.KeybindFrame.KeybindBox.FocusLost:Connect(function()
    				CheckingForKey = false
    				if Keybind.KeybindFrame.KeybindBox.Text == nil or "" then
    					Keybind.KeybindFrame.KeybindBox.Text = KeybindSettings.CurrentKeybind
    					if not KeybindSettings.Ext then
    						SaveConfiguration()
    					end
    				end
    			end)
    
    			Keybind.MouseEnter:Connect(function()
    				TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
    			end)
    
    			Keybind.MouseLeave:Connect(function()
    				TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    			end)
    
    			UserInputService.InputBegan:Connect(function(input, processed)
    				if CheckingForKey then
    					if input.KeyCode ~= Enum.KeyCode.Unknown then
    						local SplitMessage = string.split(tostring(input.KeyCode), ".")
    						local NewKeyNoEnum = SplitMessage[3]
    						Keybind.KeybindFrame.KeybindBox.Text = tostring(NewKeyNoEnum)
    						KeybindSettings.CurrentKeybind = tostring(NewKeyNoEnum)
    						Keybind.KeybindFrame.KeybindBox:ReleaseFocus()
    						if not KeybindSettings.Ext then
    							SaveConfiguration()
    						end
    
    						if KeybindSettings.CallOnChange then
    							KeybindSettings.Callback(tostring(NewKeyNoEnum))
    						end
    					end
    				elseif not KeybindSettings.CallOnChange and KeybindSettings.CurrentKeybind ~= nil and (input.KeyCode == Enum.KeyCode[KeybindSettings.CurrentKeybind] and not processed) then -- Test
    					local Held = true
    					local Connection
    					Connection = input.Changed:Connect(function(prop)
    						if prop == "UserInputState" then
    							Connection:Disconnect()
    							Held = false
    						end
    					end)
    
    					if not KeybindSettings.HoldToInteract then
    						local Success, Response = pcall(KeybindSettings.Callback)
    						if not Success then
    							TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
    							TweenService:Create(Keybind.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    							Keybind.Title.Text = "Callback Error"
    							print("Rayfield | "..KeybindSettings.Name.." Callback Error " ..tostring(Response))
    							warn('Check docs.sirius.menu for help with Rayfield specific development.')
    							task.wait(0.5)
    							Keybind.Title.Text = KeybindSettings.Name
    							TweenService:Create(Keybind, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    							TweenService:Create(Keybind.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    						end
    					else
    						task.wait(0.25)
    						if Held then
    							local Loop
Loop = RunService.Stepped:Connect(function()
    								if not Held then
    									KeybindSettings.Callback(false) -- maybe pcall this
    									Loop:Disconnect()
    								else
    									KeybindSettings.Callback(true) -- maybe pcall this
    								end
    							end)
    						end
    					end
    				end
    			end)
    
    			Keybind.KeybindFrame.KeybindBox:GetPropertyChangedSignal("Text"):Connect(function()
    				TweenService:Create(Keybind.KeybindFrame, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0, Keybind.KeybindFrame.KeybindBox.TextBounds.X + 24, 0, 30)}):Play()
    			end)
    
    			function KeybindSettings:Set(NewKeybind)
    				Keybind.KeybindFrame.KeybindBox.Text = tostring(NewKeybind)
    				KeybindSettings.CurrentKeybind = tostring(NewKeybind)
    				Keybind.KeybindFrame.KeybindBox:ReleaseFocus()
    				if not KeybindSettings.Ext then
    					SaveConfiguration()
    				end
    
    				if KeybindSettings.CallOnChange then
    					KeybindSettings.Callback(tostring(NewKeybind))
    				end
    			end
    
    			if Settings.ConfigurationSaving then
    				if Settings.ConfigurationSaving.Enabled and KeybindSettings.Flag then
    					RayfieldLibrary.Flags[KeybindSettings.Flag] = KeybindSettings
    				end
    			end
    
    			Rayfield.Main:GetPropertyChangedSignal('BackgroundColor3'):Connect(function()
    				Keybind.KeybindFrame.BackgroundColor3 = SelectedTheme.InputBackground
    				Keybind.KeybindFrame.UIStroke.Color = SelectedTheme.InputStroke
    			end)
    
    			return KeybindSettings
    		end
    
    		-- Toggle
    		function Tab:CreateToggle(ToggleSettings)
    			local ToggleValue = {}
    
    			local Toggle = Elements.Template.Toggle:Clone()
    			Toggle.Name = ToggleSettings.Name
    			Toggle.Title.Text = ToggleSettings.Name
    			Toggle.Visible = true
    			Toggle.Parent = TabPage
    
    			Toggle.BackgroundTransparency = 1
    			Toggle.UIStroke.Transparency = 1
    			Toggle.Title.TextTransparency = 1
    			Toggle.Switch.BackgroundColor3 = SelectedTheme.ToggleBackground
    
    			if SelectedTheme ~= RayfieldLibrary.Theme.Default then
    				Toggle.Switch.Shadow.Visible = false
    			end
    
    			TweenService:Create(Toggle, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    			TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    			TweenService:Create(Toggle.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    
    			if ToggleSettings.CurrentValue == true then
    				Toggle.Switch.Indicator.Position = UDim2.new(1, -20, 0.5, 0)
    				Toggle.Switch.Indicator.UIStroke.Color = SelectedTheme.ToggleEnabledStroke
    				Toggle.Switch.Indicator.BackgroundColor3 = SelectedTheme.ToggleEnabled
    				Toggle.Switch.UIStroke.Color = SelectedTheme.ToggleEnabledOuterStroke
    			else
    				Toggle.Switch.Indicator.Position = UDim2.new(1, -40, 0.5, 0)
    				Toggle.Switch.Indicator.UIStroke.Color = SelectedTheme.ToggleDisabledStroke
    				Toggle.Switch.Indicator.BackgroundColor3 = SelectedTheme.ToggleDisabled
    				Toggle.Switch.UIStroke.Color = SelectedTheme.ToggleDisabledOuterStroke
    			end
    
    			Toggle.MouseEnter:Connect(function()
    				TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
    			end)
    
    			Toggle.MouseLeave:Connect(function()
    				TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    			end)
    
    			Toggle.Interact.MouseButton1Click:Connect(function()
    				if ToggleSettings.CurrentValue == true then
    					ToggleSettings.CurrentValue = false
    					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
    					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -40, 0.5, 0)}):Play()
    					TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledStroke}):Play()
    					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleDisabled}):Play()
    					TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledOuterStroke}):Play()
    					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    				else
    					ToggleSettings.CurrentValue = true
    					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
    					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -20, 0.5, 0)}):Play()
    					TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledStroke}):Play()
    					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleEnabled}):Play()
    					TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledOuterStroke}):Play()
    					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    				end
    
    				local Success, Response = pcall(function()
    					if debugX then warn('Running toggle \''..ToggleSettings.Name..'\' (Interact)') end
    
    					ToggleSettings.Callback(ToggleSettings.CurrentValue)
    				end)
    
    				if not Success then
    					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
    					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    					Toggle.Title.Text = "Callback Error"
    					print("Rayfield | "..ToggleSettings.Name.." Callback Error " ..tostring(Response))
    					warn('Check docs.sirius.menu for help with Rayfield specific development.')
    					task.wait(0.5)
    					Toggle.Title.Text = ToggleSettings.Name
    					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    				end
    
    				if not ToggleSettings.Ext then
    					SaveConfiguration()
    				end
    			end)
    
    			function ToggleSettings:Set(NewToggleValue)
    				if NewToggleValue == true then
    					ToggleSettings.CurrentValue = true
    					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
    					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -20, 0.5, 0)}):Play()
    					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,12,0,12)}):Play()
    					TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledStroke}):Play()
    					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleEnabled}):Play()
    					TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleEnabledOuterStroke}):Play()
    					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)}):Play()
    					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    				else
    					ToggleSettings.CurrentValue = false
    					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
    					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.45, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = UDim2.new(1, -40, 0.5, 0)}):Play()
    					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,12,0,12)}):Play()
    					TweenService:Create(Toggle.Switch.Indicator.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledStroke}):Play()
    					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.8, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {BackgroundColor3 = SelectedTheme.ToggleDisabled}):Play()
    					TweenService:Create(Toggle.Switch.UIStroke, TweenInfo.new(0.55, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Color = SelectedTheme.ToggleDisabledOuterStroke}):Play()
    					TweenService:Create(Toggle.Switch.Indicator, TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = UDim2.new(0,17,0,17)}):Play()
    					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    				end
    
    				local Success, Response = pcall(function()
    					if debugX then warn('Running toggle \''..ToggleSettings.Name..'\' (:Set)') end
    
    					ToggleSettings.Callback(ToggleSettings.CurrentValue)
    				end)
    
    				if not Success then
    					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
    					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    					Toggle.Title.Text = "Callback Error"
    					print("Rayfield | "..ToggleSettings.Name.." Callback Error " ..tostring(Response))
    					warn('Check docs.sirius.menu for help with Rayfield specific development.')
    					task.wait(0.5)
    					Toggle.Title.Text = ToggleSettings.Name
    					TweenService:Create(Toggle, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    					TweenService:Create(Toggle.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    				end
    
    				if not ToggleSettings.Ext then
    					SaveConfiguration()
    				end
    			end
    
    			if not ToggleSettings.Ext then
    				if Settings.ConfigurationSaving then
    					if Settings.ConfigurationSaving.Enabled and ToggleSettings.Flag then
    						RayfieldLibrary.Flags[ToggleSettings.Flag] = ToggleSettings
    					end
    				end
    			end
    
    
    			Rayfield.Main:GetPropertyChangedSignal('BackgroundColor3'):Connect(function()
    				Toggle.Switch.BackgroundColor3 = SelectedTheme.ToggleBackground
    
    				if SelectedTheme ~= RayfieldLibrary.Theme.Default then
    					Toggle.Switch.Shadow.Visible = false
    				end
    
    				task.wait()
    
    				if not ToggleSettings.CurrentValue then
    					Toggle.Switch.Indicator.UIStroke.Color = SelectedTheme.ToggleDisabledStroke
    					Toggle.Switch.Indicator.BackgroundColor3 = SelectedTheme.ToggleDisabled
    					Toggle.Switch.UIStroke.Color = SelectedTheme.ToggleDisabledOuterStroke
    				else
    					Toggle.Switch.Indicator.UIStroke.Color = SelectedTheme.ToggleEnabledStroke
    					Toggle.Switch.Indicator.BackgroundColor3 = SelectedTheme.ToggleEnabled
    					Toggle.Switch.UIStroke.Color = SelectedTheme.ToggleEnabledOuterStroke
    				end
    			end)
    
    			return ToggleSettings
    		end
    
    		-- Slider
    		function Tab:CreateSlider(SliderSettings)
    			local SLDragging = false
    			local Slider = Elements.Template.Slider:Clone()
    			Slider.Name = SliderSettings.Name
    			Slider.Title.Text = SliderSettings.Name
    			Slider.Visible = true
    			Slider.Parent = TabPage
    
    			Slider.BackgroundTransparency = 1
    			Slider.UIStroke.Transparency = 1
    			Slider.Title.TextTransparency = 1
    
    			if SelectedTheme ~= RayfieldLibrary.Theme.Default then
    				Slider.Main.Shadow.Visible = false
    			end
    
    			Slider.Main.BackgroundColor3 = SelectedTheme.SliderBackground
    			Slider.Main.UIStroke.Color = SelectedTheme.SliderStroke
    			Slider.Main.Progress.UIStroke.Color = SelectedTheme.SliderStroke
    			Slider.Main.Progress.BackgroundColor3 = SelectedTheme.SliderProgress
    
    			TweenService:Create(Slider, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    			TweenService:Create(Slider.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    			TweenService:Create(Slider.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    
    			Slider.Main.Progress.Size =	UDim2.new(0, Slider.Main.AbsoluteSize.X * ((SliderSettings.CurrentValue + SliderSettings.Range[1]) / (SliderSettings.Range[2] - SliderSettings.Range[1])) > 5 and Slider.Main.AbsoluteSize.X * (SliderSettings.CurrentValue / (SliderSettings.Range[2] - SliderSettings.Range[1])) or 5, 1, 0)
    
    			if not SliderSettings.Suffix then
    				Slider.Main.Information.Text = tostring(SliderSettings.CurrentValue)
    			else
    				Slider.Main.Information.Text = tostring(SliderSettings.CurrentValue) .. " " .. SliderSettings.Suffix
    			end
    
    			Slider.MouseEnter:Connect(function()
    				TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackgroundHover}):Play()
    			end)
    
    			Slider.MouseLeave:Connect(function()
    				TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    			end)
    
    			Slider.Main.Interact.InputBegan:Connect(function(Input)
    				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
    					TweenService:Create(Slider.Main.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    					TweenService:Create(Slider.Main.Progress.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    					SLDragging = true
    				end
    			end)
    
    			Slider.Main.Interact.InputEnded:Connect(function(Input)
    				if Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch then
    					TweenService:Create(Slider.Main.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0.4}):Play()
    					TweenService:Create(Slider.Main.Progress.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0.3}):Play()
    					SLDragging = false
    				end
    			end)
    
    			Slider.Main.Interact.MouseButton1Down:Connect(function(X)
    				local Current = Slider.Main.Progress.AbsolutePosition.X + Slider.Main.Progress.AbsoluteSize.X
    				local Start = Current
    				local Location = X
    				local Loop
Loop = RunService.Stepped:Connect(function()
    					if SLDragging then
    						Location = UserInputService:GetMouseLocation().X
    						Current = Current + 0.025 * (Location - Start)
    
    						if Location < Slider.Main.AbsolutePosition.X then
    							Location = Slider.Main.AbsolutePosition.X
    						elseif Location > Slider.Main.AbsolutePosition.X + Slider.Main.AbsoluteSize.X then
    							Location = Slider.Main.AbsolutePosition.X + Slider.Main.AbsoluteSize.X
    						end
    
    						if Current < Slider.Main.AbsolutePosition.X + 5 then
    							Current = Slider.Main.AbsolutePosition.X + 5
    						elseif Current > Slider.Main.AbsolutePosition.X + Slider.Main.AbsoluteSize.X then
    							Current = Slider.Main.AbsolutePosition.X + Slider.Main.AbsoluteSize.X
    						end
    
    						if Current <= Location and (Location - Start) < 0 then
    							Start = Location
    						elseif Current >= Location and (Location - Start) > 0 then
    							Start = Location
    						end
    						TweenService:Create(Slider.Main.Progress, TweenInfo.new(0.45, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0, Current - Slider.Main.AbsolutePosition.X, 1, 0)}):Play()
    						local NewValue = SliderSettings.Range[1] + (Location - Slider.Main.AbsolutePosition.X) / Slider.Main.AbsoluteSize.X * (SliderSettings.Range[2] - SliderSettings.Range[1])
    
    						NewValue = math.floor(NewValue / SliderSettings.Increment + 0.5) * (SliderSettings.Increment * 10000000) / 10000000
    						NewValue = math.clamp(NewValue, SliderSettings.Range[1], SliderSettings.Range[2])
    
    						if not SliderSettings.Suffix then
    							Slider.Main.Information.Text = tostring(NewValue)
    						else
    							Slider.Main.Information.Text = tostring(NewValue) .. " " .. SliderSettings.Suffix
    						end
    
    						if SliderSettings.CurrentValue ~= NewValue then
    							local Success, Response = pcall(function()
    								SliderSettings.Callback(NewValue)
    							end)
    							if not Success then
    								TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
    								TweenService:Create(Slider.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    								Slider.Title.Text = "Callback Error"
    								print("Rayfield | "..SliderSettings.Name.." Callback Error " ..tostring(Response))
    								warn('Check docs.sirius.menu for help with Rayfield specific development.')
    								task.wait(0.5)
    								Slider.Title.Text = SliderSettings.Name
    								TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    								TweenService:Create(Slider.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    							end
    
    							SliderSettings.CurrentValue = NewValue
    							if not SliderSettings.Ext then
    								SaveConfiguration()
    							end
    						end
    					else
    						TweenService:Create(Slider.Main.Progress, TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0, Location - Slider.Main.AbsolutePosition.X > 5 and Location - Slider.Main.AbsolutePosition.X or 5, 1, 0)}):Play()
    						Loop:Disconnect()
    					end
    				end)
    			end)
    
    			function SliderSettings:Set(NewVal)
    				local NewVal = math.clamp(NewVal, SliderSettings.Range[1], SliderSettings.Range[2])
    
    				TweenService:Create(Slider.Main.Progress, TweenInfo.new(0.45, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = UDim2.new(0, Slider.Main.AbsoluteSize.X * ((NewVal + SliderSettings.Range[1]) / (SliderSettings.Range[2] - SliderSettings.Range[1])) > 5 and Slider.Main.AbsoluteSize.X * (NewVal / (SliderSettings.Range[2] - SliderSettings.Range[1])) or 5, 1, 0)}):Play()
    				Slider.Main.Information.Text = tostring(NewVal) .. " " .. (SliderSettings.Suffix or "")
    
    				local Success, Response = pcall(function()
    					SliderSettings.Callback(NewVal)
    				end)
    
    				if not Success then
    					TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = Color3.fromRGB(85, 0, 0)}):Play()
    					TweenService:Create(Slider.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 1}):Play()
    					Slider.Title.Text = "Callback Error"
    					print("Rayfield | "..SliderSettings.Name.." Callback Error " ..tostring(Response))
    					warn('Check docs.sirius.menu for help with Rayfield specific development.')
    					task.wait(0.5)
    					Slider.Title.Text = SliderSettings.Name
    					TweenService:Create(Slider, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.ElementBackground}):Play()
    					TweenService:Create(Slider.UIStroke, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {Transparency = 0}):Play()
    				end
    
    				SliderSettings.CurrentValue = NewVal
    				if not SliderSettings.Ext then
    					SaveConfiguration()
    				end
    			end
    
    			if Settings.ConfigurationSaving then
    				if Settings.ConfigurationSaving.Enabled and SliderSettings.Flag then
    					RayfieldLibrary.Flags[SliderSettings.Flag] = SliderSettings
    				end
    			end
    
    			Rayfield.Main:GetPropertyChangedSignal('BackgroundColor3'):Connect(function()
    				if SelectedTheme ~= RayfieldLibrary.Theme.Default then
    					Slider.Main.Shadow.Visible = false
    				end
    
    				Slider.Main.BackgroundColor3 = SelectedTheme.SliderBackground
    				Slider.Main.UIStroke.Color = SelectedTheme.SliderStroke
    				Slider.Main.Progress.UIStroke.Color = SelectedTheme.SliderStroke
    				Slider.Main.Progress.BackgroundColor3 = SelectedTheme.SliderProgress
    			end)
    
    			return SliderSettings
    		end
    
    		Rayfield.Main:GetPropertyChangedSignal('BackgroundColor3'):Connect(function()
    			TabButton.UIStroke.Color = SelectedTheme.TabStroke
    
    			if Elements.UIPageLayout.CurrentPage == TabPage then
    				TabButton.BackgroundColor3 = SelectedTheme.TabBackgroundSelected
    				TabButton.Image.ImageColor3 = SelectedTheme.SelectedTabTextColor
    				TabButton.Title.TextColor3 = SelectedTheme.SelectedTabTextColor
    			else
    				TabButton.BackgroundColor3 = SelectedTheme.TabBackground
    				TabButton.Image.ImageColor3 = SelectedTheme.TabTextColor
    				TabButton.Title.TextColor3 = SelectedTheme.TabTextColor
    			end
    		end)
    
    		return Tab
    	end
    
    	Elements.Visible = true
    
    
    	task.wait(1.1)
    	TweenService:Create(Main, TweenInfo.new(0.7, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 390, 0, 90)}):Play()
    	task.wait(0.3)
    	TweenService:Create(LoadingFrame.Title, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    	TweenService:Create(LoadingFrame.Subtitle, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    	TweenService:Create(LoadingFrame.Version, TweenInfo.new(0.2, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    	task.wait(0.1)
    	TweenService:Create(Main, TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = useMobileSizing and UDim2.new(0, 500, 0, 275) or UDim2.new(0, 500, 0, 475)}):Play()
    	TweenService:Create(Main.Shadow.Image, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {ImageTransparency = 0.6}):Play()
    
    	Topbar.BackgroundTransparency = 1
    	Topbar.Divider.Size = UDim2.new(0, 0, 0, 1)
    	Topbar.Divider.BackgroundColor3 = SelectedTheme.ElementStroke
    	Topbar.CornerRepair.BackgroundTransparency = 1
    	Topbar.Title.TextTransparency = 1
    	Topbar.Search.ImageTransparency = 1
    	if Topbar:FindFirstChild('Settings') then
    		Topbar.Settings.ImageTransparency = 1
    	end
    	Topbar.ChangeSize.ImageTransparency = 1
    	Topbar.Hide.ImageTransparency = 1
    
    
    	task.wait(0.5)
    	Topbar.Visible = true
    	TweenService:Create(Topbar, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    	TweenService:Create(Topbar.CornerRepair, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0}):Play()
    	task.wait(0.1)
    	TweenService:Create(Topbar.Divider, TweenInfo.new(1, Enum.EasingStyle.Exponential), {Size = UDim2.new(1, 0, 0, 1)}):Play()
    	TweenService:Create(Topbar.Title, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {TextTransparency = 0}):Play()
    	task.wait(0.05)
    	TweenService:Create(Topbar.Search, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {ImageTransparency = 0.8}):Play()
    	task.wait(0.05)
    	if Topbar:FindFirstChild('Settings') then
    		TweenService:Create(Topbar.Settings, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {ImageTransparency = 0.8}):Play()
    		task.wait(0.05)
    	end
    	TweenService:Create(Topbar.ChangeSize, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {ImageTransparency = 0.8}):Play()
    	task.wait(0.05)
    	TweenService:Create(Topbar.Hide, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {ImageTransparency = 0.8}):Play()
    	task.wait(0.3)
    
    	if dragBar then
    		TweenService:Create(dragBarCosmetic, TweenInfo.new(0.6, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.7}):Play()
    	end
    
    	function Window.ModifyTheme(NewTheme)
    		local success = pcall(ChangeTheme, NewTheme)
    		if not success then
    			RayfieldLibrary:Notify({Title = 'Unable to Change Theme', Content = 'We are unable find a theme on file.', Image = 4400704299})
    		else
    			RayfieldLibrary:Notify({Title = 'Theme Changed', Content = 'Successfully changed theme to '..(typeof(NewTheme) == 'string' and NewTheme or 'Custom Theme')..'.', Image = 4483362748})
    		end
    	end
    
    	local success, result = pcall(function()
    		createSettings(Window)
    	end)
    
    	if not success then warn('Rayfield had an issue creating settings.') end
    
    	return Window
    end
    
    local function setVisibility(visibility: boolean, notify: boolean?)
    	if Debounce then return end
    	if visibility then
    		Hidden = false
    		Unhide()
    	else
    		Hidden = true
    		Hide(notify)
    	end
    end
    
    function RayfieldLibrary:SetVisibility(visibility: boolean)
    	setVisibility(visibility, false)
    end
    
    function RayfieldLibrary:IsVisible(): boolean
    	return not Hidden
    end
    
    local hideHotkeyConnection -- Has to be initialized here since the connection is made later in the script
    function RayfieldLibrary:Destroy()
    	hideHotkeyConnection:Disconnect()
    	Rayfield:Destroy()
    end
    
    Topbar.ChangeSize.MouseButton1Click:Connect(function()
    	if Debounce then return end
    	if Minimised then
    		Minimised = false
    		Maximise()
    	else
    		Minimised = true
    		Minimise()
    	end
    end)
    
    Main.Search.Input:GetPropertyChangedSignal('Text'):Connect(function()
    	if #Main.Search.Input.Text > 0 then
    		if not Elements.UIPageLayout.CurrentPage:FindFirstChild('SearchTitle-fsefsefesfsefesfesfThanks') then
    			local searchTitle = Elements.Template.SectionTitle:Clone()
    			searchTitle.Parent = Elements.UIPageLayout.CurrentPage
    			searchTitle.Name = 'SearchTitle-fsefsefesfsefesfesfThanks'
    			searchTitle.LayoutOrder = -100
    			searchTitle.Title.Text = "Results from '"..Elements.UIPageLayout.CurrentPage.Name.."'"
    			searchTitle.Visible = true
    		end
    	else
    		local searchTitle = Elements.UIPageLayout.CurrentPage:FindFirstChild('SearchTitle-fsefsefesfsefesfesfThanks')
    
    		if searchTitle then
    			searchTitle:Destroy()
    		end
    	end
    
    	for _, element in ipairs(Elements.UIPageLayout.CurrentPage:GetChildren()) do
    		if element.ClassName ~= 'UIListLayout' and element.Name ~= 'Placeholder' and element.Name ~= 'SearchTitle-fsefsefesfsefesfesfThanks' then
    			if element.Name == 'SectionTitle' then
    				if #Main.Search.Input.Text == 0 then
    					element.Visible = true
    				else
    					element.Visible = false
    				end
    			else
    				if string.lower(element.Name):find(string.lower(Main.Search.Input.Text), 1, true) then
    					element.Visible = true
    				else
    					element.Visible = false
    				end
    			end
    		end
    	end
    end)
    
    Main.Search.Input.FocusLost:Connect(function(enterPressed)
    	if #Main.Search.Input.Text == 0 and searchOpen then
    		task.wait(0.12)
    		closeSearch()
    	end
    end)
    
    Topbar.Search.MouseButton1Click:Connect(function()
    	task.spawn(function()
    		if searchOpen then
    			closeSearch()
    		else
    			openSearch()
    		end
    	end)
    end)
    
    if Topbar:FindFirstChild('Settings') then
    	Topbar.Settings.MouseButton1Click:Connect(function()
    		task.spawn(function()
    			for _, OtherTabButton in ipairs(TabList:GetChildren()) do
    				if OtherTabButton.Name ~= "Template" and OtherTabButton.ClassName == "Frame" and OtherTabButton ~= TabButton and OtherTabButton.Name ~= "Placeholder" then
    					TweenService:Create(OtherTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundColor3 = SelectedTheme.TabBackground}):Play()
    					TweenService:Create(OtherTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextColor3 = SelectedTheme.TabTextColor}):Play()
    					TweenService:Create(OtherTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageColor3 = SelectedTheme.TabTextColor}):Play()
    					TweenService:Create(OtherTabButton, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {BackgroundTransparency = 0.7}):Play()
    					TweenService:Create(OtherTabButton.Title, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {TextTransparency = 0.2}):Play()
    					TweenService:Create(OtherTabButton.Image, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0.2}):Play()
    					TweenService:Create(OtherTabButton.UIStroke, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {Transparency = 0.5}):Play()
    				end
    			end
    
    			Elements.UIPageLayout:JumpTo(Elements['Rayfield Settings'])
    		end)
    	end)
    
    end
    
    
    Topbar.Hide.MouseButton1Click:Connect(function()
    	setVisibility(Hidden, not useMobileSizing)
    end)
    
    hideHotkeyConnection = UserInputService.InputBegan:Connect(function(input, processed)
    	if (input.KeyCode == Enum.KeyCode[settingsTable.General.rayfieldOpen.Value or 'K'] and not processed) then
    		if Debounce then return end
    		if Hidden then
    			Hidden = false
    			Unhide()
    		else
    			Hidden = true
    			Hide()
    		end
    	end
    end)
    
    if MPrompt then
    	MPrompt.Interact.MouseButton1Click:Connect(function()
    		if Debounce then return end
    		if Hidden then
    			Hidden = false
    			Unhide()
    		end
    	end)
    end
    
    for _, TopbarButton in ipairs(Topbar:GetChildren()) do
    	if TopbarButton.ClassName == "ImageButton" and TopbarButton.Name ~= 'Icon' then
    		TopbarButton.MouseEnter:Connect(function()
    			TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0}):Play()
    		end)
    
    		TopbarButton.MouseLeave:Connect(function()
    			TweenService:Create(TopbarButton, TweenInfo.new(0.7, Enum.EasingStyle.Exponential), {ImageTransparency = 0.8}):Play()
    		end)
    	end
    end
    
    
    function RayfieldLibrary:LoadConfiguration()
    	local config
    
    	if debugX then
    		warn('Loading Configuration')
    	end
    
    	if useStudio then
    		config = [[{"Toggle1adwawd":true,"ColorPicker1awd":{"B":255,"G":255,"R":255},"Slider1dawd":100,"ColorPicfsefker1":{"B":255,"G":255,"R":255},"Slidefefsr1":80,"dawdawd":"","Input1":"hh","Keybind1":"B","Dropdown1":["Ocean"]}]]
    	end
    
    	if CEnabled then
    		local notified
    		local loaded
    
    		local success, result = pcall(function()
    			if useStudio and config then
    				loaded = LoadConfiguration(config)
    				return
    			end
    
    			if isfile then
    				if isfile(ConfigurationFolder .. "/" .. CFileName .. ConfigurationExtension) then
    					loaded = LoadConfiguration(readfile(ConfigurationFolder .. "/" .. CFileName .. ConfigurationExtension))
    				end
    			else
    				notified = true
    				RayfieldLibrary:Notify({Title = "Rayfield Configurations", Content = "We couldn't enable Configuration Saving as you are not using software with filesystem support.", Image = 4384402990})
    			end
    		end)
    
    		if success and loaded and not notified then
    			RayfieldLibrary:Notify({Title = "Rayfield Configurations", Content = "The configuration file for this script has been loaded from a previous session.", Image = 4384403532})
    		elseif not success and not notified then
    			warn('Rayfield Configurations Error | '..tostring(result))
    			RayfieldLibrary:Notify({Title = "Rayfield Configurations", Content = "We've encountered an issue loading your configuration correctly.\n\nCheck the Developer Console for more information.", Image = 4384402990})
    		end
    	end
    
    	globalLoaded = true
    end
    
    
    
    if useStudio then
    	-- run w/ studio
    	-- Feel free to place your own script here to see how it'd work in Roblox Studio before running it on your execution software.
    
    
    	local Window = RayfieldLibrary:CreateWindow({
    		Name = "Rayfield Example Window",
    		LoadingTitle = "Rayfield Interface Suite",
    		Theme = 'Default',
    		Icon = 0,
    		LoadingSubtitle = "by Sirius",
    		ConfigurationSaving = {
    			Enabled = true,
    			FolderName = nil, -- Create a custom folder for your hub/game
    			FileName = "Big Hub52"
    		},
    		Discord = {
    			Enabled = false,
    			Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
    			RememberJoins = true -- Set this to false to make them join the discord every time they load it up
    		},
    		KeySystem = false, -- Set this to true to use our key system
    		KeySettings = {
    			Title = "Untitled",
    			Subtitle = "Key System",
    			Note = "No method of obtaining the key is provided",
    			FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
    			SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
    			GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
    			Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
    		}
    	})
    
    	local Tab = Window:CreateTab("Tab Example", 'key-round') -- Title, Image
    	local Tab2 = Window:CreateTab("Tab Example 2", 4483362458) -- Title, Image
    
    	local Section = Tab2:CreateSection("Section")
    
    
    	local ColorPicker = Tab2:CreateColorPicker({
    		Name = "Color Picker",
    		Color = Color3.fromRGB(255,255,255),
    		Flag = "ColorPicfsefker1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    		Callback = function(Value)
    			-- The function that takes place every time the color picker is moved/changed
    			-- The variable (Value) is a Color3fromRGB value based on which color is selected
    		end
    	})
    
    	local Slider = Tab2:CreateSlider({
    		Name = "Slider Example",
    		Range = {0, 100},
    		Increment = 10,
    		Suffix = "Bananas",
    		CurrentValue = 40,
    		Flag = "Slidefefsr1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    		Callback = function(Value)
    			-- The function that takes place when the slider changes
    			-- The variable (Value) is a number which correlates to the value the slider is currently at
    		end,
    	})
    
    	local Input = Tab2:CreateInput({
    		Name = "Input Example",
    		CurrentValue = '',
    		PlaceholderText = "Input Placeholder",
    		Flag = 'dawdawd',
    		RemoveTextAfterFocusLost = false,
    		Callback = function(Text)
    			-- The function that takes place when the input is changed
    			-- The variable (Text) is a string for the value in the text box
    		end,
    	})
    
    
    	--RayfieldLibrary:Notify({Title = "Rayfield Interface", Content = "Welcome to Rayfield. These - are the brand new notification design for Rayfield, with custom sizing and Rayfield calculated wait times.", Image = 4483362458})
    
    	local Section = Tab:CreateSection("Section Example")
    
    	local Button = Tab:CreateButton({
    		Name = "Change Theme",
    		Callback = function()
    			-- The function that takes place when the button is pressed
    			Window.ModifyTheme('DarkBlue')
    		end,
    	})
    
    	local Toggle = Tab:CreateToggle({
    		Name = "Toggle Example",
    		CurrentValue = false,
    		Flag = "Toggle1adwawd", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    		Callback = function(Value)
    			-- The function that takes place when the toggle is pressed
    			-- The variable (Value) is a boolean on whether the toggle is true or false
    		end,
    	})
    
    	local ColorPicker = Tab:CreateColorPicker({
    		Name = "Color Picker",
    		Color = Color3.fromRGB(255,255,255),
    		Flag = "ColorPicker1awd", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    		Callback = function(Value)
    			-- The function that takes place every time the color picker is moved/changed
    			-- The variable (Value) is a Color3fromRGB value based on which color is selected
    		end
    	})
    
    	local Slider = Tab:CreateSlider({
    		Name = "Slider Example",
    		Range = {0, 100},
    		Increment = 10,
    		Suffix = "Bananas",
    		CurrentValue = 40,
    		Flag = "Slider1dawd", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    		Callback = function(Value)
    			-- The function that takes place when the slider changes
    			-- The variable (Value) is a number which correlates to the value the slider is currently at
    		end,
    	})
    
    	local Input = Tab:CreateInput({
    		Name = "Input Example",
    		CurrentValue = "Helo",
    		PlaceholderText = "Adaptive Input",
    		RemoveTextAfterFocusLost = false,
    		Flag = 'Input1',
    		Callback = function(Text)
    			-- The function that takes place when the input is changed
    			-- The variable (Text) is a string for the value in the text box
    		end,
    	})
    
    	local thoptions = {}
    	for themename, theme in pairs(RayfieldLibrary.Theme) do
    		table.insert(thoptions, themename)
    	end
    
    	local Dropdown = Tab:CreateDropdown({
    		Name = "Theme",
    		Options = thoptions,
    		CurrentOption = {"Default"},
    		MultipleOptions = false,
    		Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    		Callback = function(Options)
    			--Window.ModifyTheme(Options[1])
    			-- The function that takes place when the selected option is changed
    			-- The variable (Options) is a table of strings for the current selected options
    		end,
    	})
    
    
    	--Window.ModifyTheme({
    	--	TextColor = Color3.fromRGB(50, 55, 60),
    	--	Background = Color3.fromRGB(240, 245, 250),
    	--	Topbar = Color3.fromRGB(215, 225, 235),
    	--	Shadow = Color3.fromRGB(200, 210, 220),
    
    	--	NotificationBackground = Color3.fromRGB(210, 220, 230),
    	--	NotificationActionsBackground = Color3.fromRGB(225, 230, 240),
    
    	--	TabBackground = Color3.fromRGB(200, 210, 220),
    	--	TabStroke = Color3.fromRGB(180, 190, 200),
    	--	TabBackgroundSelected = Color3.fromRGB(175, 185, 200),
    	--	TabTextColor = Color3.fromRGB(50, 55, 60),
    	--	SelectedTabTextColor = Color3.fromRGB(30, 35, 40),
    
    	--	ElementBackground = Color3.fromRGB(210, 220, 230),
    	--	ElementBackgroundHover = Color3.fromRGB(220, 230, 240),
    	--	SecondaryElementBackground = Color3.fromRGB(200, 210, 220),
    	--	ElementStroke = Color3.fromRGB(190, 200, 210),
    	--	SecondaryElementStroke = Color3.fromRGB(180, 190, 200),
    
    	--	SliderBackground = Color3.fromRGB(200, 220, 235),  -- Lighter shade
    	--	SliderProgress = Color3.fromRGB(70, 130, 180),
    	--	SliderStroke = Color3.fromRGB(150, 180, 220),
    
    	--	ToggleBackground = Color3.fromRGB(210, 220, 230),
    	--	ToggleEnabled = Color3.fromRGB(70, 160, 210),
    	--	ToggleDisabled = Color3.fromRGB(180, 180, 180),
    	--	ToggleEnabledStroke = Color3.fromRGB(60, 150, 200),
    	--	ToggleDisabledStroke = Color3.fromRGB(140, 140, 140),
    	--	ToggleEnabledOuterStroke = Color3.fromRGB(100, 120, 140),
    	--	ToggleDisabledOuterStroke = Color3.fromRGB(120, 120, 130),
    
    	--	DropdownSelected = Color3.fromRGB(220, 230, 240),
    	--	DropdownUnselected = Color3.fromRGB(200, 210, 220),
    
    	--	InputBackground = Color3.fromRGB(220, 230, 240),
    	--	InputStroke = Color3.fromRGB(180, 190, 200),
    	--	PlaceholderColor = Color3.fromRGB(150, 150, 150)
    	--})
    
    	local Keybind = Tab:CreateKeybind({
    		Name = "Keybind Example",
    		CurrentKeybind = "Q",
    		HoldToInteract = false,
    		Flag = "Keybind1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    		Callback = function(Keybind)
    			-- The function that takes place when the keybind is pressed
    			-- The variable (Keybind) is a boolean for whether the keybind is being held or not (HoldToInteract needs to be true)
    		end,
    	})
    
    	local Label = Tab:CreateLabel("Label Example")
    
    	local Label2 = Tab:CreateLabel("Warning", 4483362458, Color3.fromRGB(255, 159, 49),  true)
    
    	local Paragraph = Tab:CreateParagraph({Title = "Paragraph Example", Content = "Paragraph ExampleParagraph ExampleParagraph ExampleParagraph ExampleParagraph ExampleParagraph ExampleParagraph ExampleParagraph ExampleParagraph ExampleParagraph ExampleParagraph ExampleParagraph ExampleParagraph ExampleParagraph Example"})
    end
    
    if CEnabled and Main:FindFirstChild('Notice') then
    	Main.Notice.BackgroundTransparency = 1
    	Main.Notice.Title.TextTransparency = 1
    	Main.Notice.Size = UDim2.new(0, 0, 0, 0)
    	Main.Notice.Position = UDim2.new(0.5, 0, 0, -100)
    	Main.Notice.Visible = true
    
    
    	TweenService:Create(Main.Notice, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 280, 0, 35), Position = UDim2.new(0.5, 0, 0, -50), BackgroundTransparency = 0.5}):Play()
    	TweenService:Create(Main.Notice.Title, TweenInfo.new(0.5, Enum.EasingStyle.Exponential), {TextTransparency = 0.1}):Play()
    end
    
    task.delay(4, function()
    	RayfieldLibrary.LoadConfiguration()
    	if Main:FindFirstChild('Notice') and Main.Notice.Visible then
    		TweenService:Create(Main.Notice, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.InOut), {Size = UDim2.new(0, 100, 0, 25), Position = UDim2.new(0.5, 0, 0, -100), BackgroundTransparency = 1}):Play()
    		TweenService:Create(Main.Notice.Title, TweenInfo.new(0.3, Enum.EasingStyle.Exponential), {TextTransparency = 1}):Play()
    
    		task.wait(0.5)
    		Main.Notice.Visible = false
    	end
    end)
    
    return RayfieldLibrary
end)()
local LuaArmorAPI = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
LuaArmorAPI.script_id = "624a0bc4ce8a5660f80ecd8d6d16b2a4"

local validKey = nil
function validateKey(enteredKey)
    local wasSucess, serverResponseOrError = pcall(LuaArmorAPI.check_key, enteredKey)
    if not wasSucess then
        return false, ("Unknown error occured while authenticating: %s"):format(serverResponseOrError)
    end

    if serverResponseOrError.code == "KEY_VALID" then
        validKey = enteredKey
        return true
    else
        local userFacingMessage
        local receivedCode = serverResponseOrError.code
        if receivedCode == "KEY_EXPIRED" then
            userFacingMessage = "Your daily key has expired! Please get a new one in our discord."
        elseif receivedCode == "KEY_BANNED" then
            userFacingMessage = "Sorry, you have been blacklisted."
        elseif receivedCode == "KEY_HWID_LOCKED" then
            userFacingMessage = "Your key is HWID locked, please request a HWID reset in our discord."
        elseif receivedCode == "KEY_INCORRECT" or receivedCode == "KEY_INVALID" then
            userFacingMessage = "This key is invalid."
        else
            userFacingMessage = ("Unknown error occured while authenticating: %s"):format(serverResponseOrError.code)
        end

        return false, userFacingMessage
    end
end

task.spawn(function()
	RayfieldLib:CreateWindow({
		Name = "Fartsaken",
		Icon = "microwave",
		LoadingTitle = "Fartsaken",
		LoadingSubtitle = "by ivannetta",

		DisableRayfieldPrompts = false,
		DisableBuildWarnings = false,

		ConfigurationSaving = {
			Enabled = true,
			FolderName = nil,
			FileName = "FartsakenConfiga",
		},

		Discord = {
			Enabled = true,
			Invite = "fartsaken",
			RememberJoins = true,
		},

		KeySystem = true,
		KeySettings = {
			Title = "Fartsaken | Key System",
			Subtitle = "A tree filled with keys is the best tree...",
			Note = "Key link copied to clipboard!",
			FileName = "fartsaken_key",
			SaveKey = true,
			GrabKeyFromSite = false,
			ValidateCallback = validateKey,
		},
	})
end)

-- thank you leafy and dottik ily

repeat
    task.wait()
until validKey ~= nil and getgenv().LEAFHUB_WINDOW ~= nil
task.wait(0.5)
script_key = validKey
getgenv().LEAFHUB_RAYFIELD = RayfieldLib
LuaArmorAPI.load_script()

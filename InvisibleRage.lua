-- Invisible RAGE v4
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer

-- GUI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "InvisibleRAGE"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Watermark
local watermark = Instance.new("TextLabel")
watermark.Parent = ScreenGui
watermark.Size = UDim2.new(0, 200, 0, 30)
watermark.Position = UDim2.new(1, -210, 0, 10)
watermark.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
watermark.BackgroundTransparency = 0.2
watermark.BorderSizePixel = 2
watermark.BorderColor3 = Color3.fromRGB(170, 0, 255)
watermark.Text = "Invisible RAGE | v4"
watermark.TextColor3 = Color3.fromRGB(255, 255, 255)
watermark.Font = Enum.Font.GothamBold
watermark.TextSize = 14
watermark.TextStrokeTransparency = 0.5
watermark.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
watermark.Draggable = true
watermark.Active = true

-- ESP Container
local ESPContainer = Instance.new("Folder")
ESPContainer.Name = "ESPContainer"
ESPContainer.Parent = ScreenGui

-- Main Frame
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 250, 0, 350)
MainFrame.Position = UDim2.new(0, 10, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
MainFrame.BackgroundTransparency = 0.2
MainFrame.BorderSizePixel = 2
MainFrame.BorderColor3 = Color3.fromRGB(170, 0, 255)
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Visible = true

local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.Size = UDim2.new(1, 0, 0, 30)
Title.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
Title.Text = "Invisible RAGE"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18

local CloseButton = Instance.new("TextButton")
CloseButton.Parent = MainFrame
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
CloseButton.Text = "X"
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 16
CloseButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = false
end)

-- TABS
local TabFrame = Instance.new("Frame")
TabFrame.Parent = MainFrame
TabFrame.Size = UDim2.new(1, 0, 0, 30)
TabFrame.Position = UDim2.new(0, 0, 0, 30)
TabFrame.BackgroundColor3 = Color3.fromRGB(20, 0, 30)

local AimbotTab = Instance.new("TextButton")
AimbotTab.Parent = TabFrame
AimbotTab.Size = UDim2.new(0.33, 0, 1, 0)
AimbotTab.BackgroundColor3 = Color3.fromRGB(170, 0, 255)
AimbotTab.Text = "Aimbot"
AimbotTab.TextColor3 = Color3.fromRGB(255, 255, 255)
AimbotTab.Font = Enum.Font.Gotham
AimbotTab.TextSize = 14

local RenderTab = Instance.new("TextButton")
RenderTab.Parent = TabFrame
RenderTab.Size = UDim2.new(0.33, 0, 1, 0)
RenderTab.Position = UDim2.new(0.33, 0, 0, 0)
RenderTab.BackgroundColor3 = Color3.fromRGB(100, 0, 150)
RenderTab.Text = "Render"
RenderTab.TextColor3 = Color3.fromRGB(255, 255, 255)
RenderTab.Font = Enum.Font.Gotham
RenderTab.TextSize = 14

local MiscTab = Instance.new("TextButton")
MiscTab.Parent = TabFrame
MiscTab.Size = UDim2.new(0.34, 0, 1, 0)
MiscTab.Position = UDim2.new(0.66, 0, 0, 0)
MiscTab.BackgroundColor3 = Color3.fromRGB(70, 0, 100)
MiscTab.Text = "Misc"
MiscTab.TextColor3 = Color3.fromRGB(255, 255, 255)
MiscTab.Font = Enum.Font.Gotham
MiscTab.TextSize = 14

-- CONTAINERS
local AimbotContainer = Instance.new("ScrollingFrame")
AimbotContainer.Parent = MainFrame
AimbotContainer.Size = UDim2.new(1, -10, 1, -75)
AimbotContainer.Position = UDim2.new(0, 5, 0, 65)
AimbotContainer.BackgroundColor3 = Color3.fromRGB(40, 0, 60)
AimbotContainer.BorderSizePixel = 0
AimbotContainer.ScrollBarThickness = 5
AimbotContainer.CanvasSize = UDim2.new(0, 0, 0, 300)
AimbotContainer.Visible = true

local RenderContainer = Instance.new("ScrollingFrame")
RenderContainer.Parent = MainFrame
RenderContainer.Size = UDim2.new(1, -10, 1, -75)
RenderContainer.Position = UDim2.new(0, 5, 0, 65)
RenderContainer.BackgroundColor3 = Color3.fromRGB(40, 0, 60)
RenderContainer.BorderSizePixel = 0
RenderContainer.ScrollBarThickness = 5
RenderContainer.CanvasSize = UDim2.new(0, 0, 0, 350)
RenderContainer.Visible = false

local MiscContainer = Instance.new("ScrollingFrame")
MiscContainer.Parent = MainFrame
MiscContainer.Size = UDim2.new(1, -10, 1, -75)
MiscContainer.Position = UDim2.new(0, 5, 0, 65)
MiscContainer.BackgroundColor3 = Color3.fromRGB(40, 0, 60)
MiscContainer.BorderSizePixel = 0
MiscContainer.ScrollBarThickness = 5
MiscContainer.CanvasSize = UDim2.new(0, 0, 0, 400)
MiscContainer.Visible = false

-- TAB FUNCTIONS
AimbotTab.MouseButton1Click:Connect(function()
    AimbotContainer.Visible = true
    RenderContainer.Visible = false
    MiscContainer.Visible = false
    AimbotTab.BackgroundColor3 = tabColors.Visual
    RenderTab.BackgroundColor3 = Color3.fromRGB(100, 0, 150)
    MiscTab.BackgroundColor3 = Color3.fromRGB(70, 0, 100)
end)

RenderTab.MouseButton1Click:Connect(function()
    AimbotContainer.Visible = false
    RenderContainer.Visible = true
    MiscContainer.Visible = false
    AimbotTab.BackgroundColor3 = Color3.fromRGB(100, 0, 150)
    RenderTab.BackgroundColor3 = tabColors.Visual
    MiscTab.BackgroundColor3 = Color3.fromRGB(70, 0, 100)
end)

MiscTab.MouseButton1Click:Connect(function()
    AimbotContainer.Visible = false
    RenderContainer.Visible = false
    MiscContainer.Visible = true
    AimbotTab.BackgroundColor3 = Color3.fromRGB(100, 0, 150)
    RenderTab.BackgroundColor3 = Color3.fromRGB(100, 0, 150)
    MiscTab.BackgroundColor3 = tabColors.Visual
end)

-- FEATURE STATES
local FeatureStates = {
    -- Aimbot
    Aimbot = false,
    ShowFOV = true,
    FOVSize = 150,
    Smoothing = 0.55,
    OnlyVisible = true,
    TeamCheck = true,
    AutoShoot = false,
    
    -- Render
    ESPBoxes = true,
    ESPNames = true,
    ESPHealth = true,
    ESPTraces = false,
    Chams = false,
    GlowPlayer = false,
    SkyColor = false,
    
    -- Misc
    HitboxESP = false,
    HitboxSize = 1,
    SpinBot = false,
    Theme = "Purple"
}

local ThemeColors = {
    Purple = Color3.fromRGB(170, 0, 255),
    Green = Color3.fromRGB(0, 255, 0),
    White = Color3.fromRGB(255, 255, 255),
    Blue = Color3.fromRGB(0, 100, 255),
    Red = Color3.fromRGB(255, 0, 0),
    Rainbow = Color3.fromRGB(255, 0, 255)
}

local tabColors = {
    Visual = ThemeColors[FeatureStates.Theme]
}

-- UI CREATION
local yPos = 5

local function CreateToggle(container, text, setting)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Parent = container
    toggleFrame.Size = UDim2.new(1, -10, 0, 30)
    toggleFrame.Position = UDim2.new(0, 5, 0, yPos)
    toggleFrame.BackgroundColor3 = Color3.fromRGB(60, 0, 80)
    toggleFrame.BorderSizePixel = 1
    toggleFrame.BorderColor3 = tabColors.Visual
    
    local label = Instance.new("TextLabel")
    label.Parent = toggleFrame
    label.Size = UDim2.new(0.7, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local toggle = Instance.new("TextButton")
    toggle.Parent = toggleFrame
    toggle.Size = UDim2.new(0, 40, 0, 20)
    toggle.Position = UDim2.new(1, -45, 0.5, -10)
    toggle.BackgroundColor3 = FeatureStates[setting] and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
    toggle.Text = FeatureStates[setting] and "ON" or "OFF"
    toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggle.Font = Enum.Font.Gotham
    toggle.TextSize = 12
    
    toggle.MouseButton1Click:Connect(function()
        FeatureStates[setting] = not FeatureStates[setting]
        toggle.BackgroundColor3 = FeatureStates[setting] and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        toggle.Text = FeatureStates[setting] and "ON" or "OFF"
        
        if setting == "SkyColor" then
            if FeatureStates.SkyColor then
                Lighting.Ambient = tabColors.Visual
                Lighting.ColorShift_Top = tabColors.Visual
                Lighting.ColorShift_Bottom = tabColors.Visual
            else
                Lighting.Ambient = Color3.new(0, 0, 0)
                Lighting.ColorShift_Top = Color3.new(1, 1, 1)
                Lighting.ColorShift_Bottom = Color3.new(1, 1, 1)
            end
        end
    end)
    
    yPos = yPos + 35
end

local function CreateSlider(container, text, setting, min, max)
    local sliderFrame = Instance.new("Frame")
    sliderFrame.Parent = container
    sliderFrame.Size = UDim2.new(1, -10, 0, 40)
    sliderFrame.Position = UDim2.new(0, 5, 0, yPos)
    sliderFrame.BackgroundColor3 = Color3.fromRGB(60, 0, 80)
    sliderFrame.BorderSizePixel = 1
    sliderFrame.BorderColor3 = tabColors.Visual
    
    local label = Instance.new("TextLabel")
    label.Parent = sliderFrame
    label.Size = UDim2.new(1, -10, 0, 15)
    label.Position = UDim2.new(0, 5, 0, 2)
    label.BackgroundTransparency = 1
    label.Text = text .. ": " .. FeatureStates[setting]
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 12
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local slider = Instance.new("TextButton")
    slider.Parent = sliderFrame
    slider.Size = UDim2.new(1, -20, 0, 10)
    slider.Position = UDim2.new(0, 10, 0, 20)
    slider.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
    slider.Text = ""
    
    local fill = Instance.new("Frame")
    fill.Parent = slider
    fill.Size = UDim2.new((FeatureStates[setting] - min) / (max - min), 0, 1, 0)
    fill.BackgroundColor3 = tabColors.Visual
    fill.BorderSizePixel = 0
    
    local dragging = false
    
    slider.MouseButton1Down:Connect(function()
        dragging = true
    end)
    
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local pos = UserInputService:GetMouseLocation()
            local absPos = slider.AbsolutePosition
            local size = slider.AbsoluteSize.X
            local relative = math.clamp((pos.X - absPos.X) / size, 0, 1)
            FeatureStates[setting] = min + (max - min) * relative
            fill.Size = UDim2.new(relative, 0, 1, 0)
            label.Text = text .. ": " .. math.floor(FeatureStates[setting] * 100) / 100
        end
    end)
    
    yPos = yPos + 45
end

local function CreateDropdown(container, text, setting, options)
    local dropdownFrame = Instance.new("Frame")
    dropdownFrame.Parent = container
    dropdownFrame.Size = UDim2.new(1, -10, 0, 30)
    dropdownFrame.Position = UDim2.new(0, 5, 0, yPos)
    dropdownFrame.BackgroundColor3 = Color3.fromRGB(60, 0, 80)
    dropdownFrame.BorderSizePixel = 1
    dropdownFrame.BorderColor3 = tabColors.Visual
    
    local label = Instance.new("TextLabel")
    label.Parent = dropdownFrame
    label.Size = UDim2.new(0.5, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = Color3.fromRGB(255, 255, 255)
    label.Font = Enum.Font.Gotham
    label.TextSize = 14
    label.TextXAlignment = Enum.TextXAlignment.Left
    
    local dropdown = Instance.new("TextButton")
    dropdown.Parent = dropdownFrame
    dropdown.Size = UDim2.new(0, 80, 0, 20)
    dropdown.Position = UDim2.new(1, -85, 0.5, -10)
    dropdown.BackgroundColor3 = tabColors.Visual
    dropdown.Text = FeatureStates[setting]
    dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
    dropdown.Font = Enum.Font.Gotham
    dropdown.TextSize = 12
    
    local menuOpen = false
    local menuFrame = nil
    
    dropdown.MouseButton1Click:Connect(function()
        if menuOpen then
            if menuFrame then menuFrame:Destroy() end
            menuOpen = false
            return
        end
        
        menuFrame = Instance.new("Frame")
        menuFrame.Parent = ScreenGui
        menuFrame.Size = UDim2.new(0, 80, 0, #options * 25)
        menuFrame.Position = UDim2.new(0, dropdown.AbsolutePosition.X, 0, dropdown.AbsolutePosition.Y + 20)
        menuFrame.BackgroundColor3 = Color3.fromRGB(30, 0, 50)
        menuFrame.BorderSizePixel = 2
        menuFrame.BorderColor3 = tabColors.Visual
        menuFrame.ZIndex = 10
        
        for i, opt in ipairs(options) do
            local optBtn = Instance.new("TextButton")
            optBtn.Parent = menuFrame
            optBtn.Size = UDim2.new(1, 0, 0, 25)
            optBtn.Position = UDim2.new(0, 0, 0, (i-1) * 25)
            optBtn.BackgroundColor3 = Color3.fromRGB(60, 0, 80)
            optBtn.Text = opt
            optBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
            optBtn.Font = Enum.Font.Gotham
            optBtn.TextSize = 12
            optBtn.ZIndex = 11
            
            optBtn.MouseButton1Click:Connect(function()
                FeatureStates[setting] = opt
                dropdown.Text = opt
                tabColors.Visual = ThemeColors[opt]
                ApplyThemeToAll()
                if FeatureStates.SkyColor then
                    Lighting.Ambient = tabColors.Visual
                    Lighting.ColorShift_Top = tabColors.Visual
                    Lighting.ColorShift_Bottom = tabColors.Visual
                end
                menuFrame:Destroy()
                menuOpen = false
            end)
        end
        
        menuOpen = true
    end)
    
    yPos = yPos + 35
end

-- Apply Theme Function
local function ApplyThemeToAll()
    MainFrame.BorderColor3 = tabColors.Visual
    Title.BackgroundColor3 = tabColors.Visual
    watermark.BorderColor3 = tabColors.Visual
    
    if AimbotContainer.Visible then
        AimbotTab.BackgroundColor3 = tabColors.Visual
        RenderTab.BackgroundColor3 = Color3.fromRGB(100, 0, 150)
        MiscTab.BackgroundColor3 = Color3.fromRGB(70, 0, 100)
    elseif RenderContainer.Visible then
        AimbotTab.BackgroundColor3 = Color3.fromRGB(100, 0, 150)
        RenderTab.BackgroundColor3 = tabColors.Visual
        MiscTab.BackgroundColor3 = Color3.fromRGB(70, 0, 100)
    elseif MiscContainer.Visible then
        AimbotTab.BackgroundColor3 = Color3.fromRGB(100, 0, 150)
        RenderTab.BackgroundColor3 = Color3.fromRGB(100, 0, 150)
        MiscTab.BackgroundColor3 = tabColors.Visual
    end
    
    for _, container in ipairs({AimbotContainer, RenderContainer, MiscContainer}) do
        for _, child in ipairs(container:GetChildren()) do
            if child:IsA("Frame") and child.BorderColor3 then
                child.BorderColor3 = tabColors.Visual
                for _, subChild in ipairs(child:GetChildren()) do
                    if subChild:IsA("Frame") and subChild.BackgroundColor3 == Color3.fromRGB(170, 0, 255) then
                        subChild.BackgroundColor3 = tabColors.Visual
                    end
                end
            end
        end
    end
    
    fovCircle.Color = tabColors.Visual
end

-- CREATE UI ELEMENTS
-- Aimbot
CreateToggle(AimbotContainer, "Aimbot", "Aimbot")
CreateToggle(AimbotContainer, "Show FOV", "ShowFOV")
CreateSlider(AimbotContainer, "FOV Size", "FOVSize", 50, 500)
CreateSlider(AimbotContainer, "Smoothing", "Smoothing", 0, 1)
CreateToggle(AimbotContainer, "Only Visible", "OnlyVisible")
CreateToggle(AimbotContainer, "Team Check", "TeamCheck")
CreateToggle(AimbotContainer, "Auto Shoot", "AutoShoot")

-- Render
yPos = 5
CreateToggle(RenderContainer, "ESP Boxes", "ESPBoxes")
CreateToggle(RenderContainer, "ESP Names", "ESPNames")
CreateToggle(RenderContainer, "ESP Health", "ESPHealth")
CreateToggle(RenderContainer, "ESP Traces", "ESPTraces")
CreateToggle(RenderContainer, "Chams", "Chams")
CreateToggle(RenderContainer, "Glow Player", "GlowPlayer")
CreateToggle(RenderContainer, "Sky Color", "SkyColor")

-- Misc
yPos = 5
CreateToggle(MiscContainer, "Hitbox ESP", "HitboxESP")
CreateSlider(MiscContainer, "Hitbox Size", "HitboxSize", 0.5, 3)
CreateToggle(MiscContainer, "Spin Bot", "SpinBot")
CreateDropdown(MiscContainer, "Theme", "Theme", {"Purple", "Green", "White", "Blue", "Red", "Rainbow"})

local uploadButton = Instance.new("TextButton")
uploadButton.Parent = MiscContainer
uploadButton.Size = UDim2.new(1, -10, 0, 30)
uploadButton.Position = UDim2.new(0, 5, 0, yPos)
uploadButton.BackgroundColor3 = tabColors.Visual
uploadButton.Text = "UNLOAD CHEAT"
uploadButton.TextColor3 = Color3.fromRGB(255, 255, 255)
uploadButton.Font = Enum.Font.GothamBold
uploadButton.TextSize = 14
uploadButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
    fovCircle:Remove()
    for _, line in pairs(traceLines) do
        line:Remove()
    end
    espCache = {}
    chamsCache = {}
    traceLines = {}
    glowCache = {}
end)

-- FOV CIRCLE
local fovCircle = Drawing.new("Circle")
fovCircle.Thickness = 2
fovCircle.NumSides = 60
fovCircle.Radius = 150
fovCircle.Filled = false
fovCircle.Visible = true
fovCircle.Color = tabColors.Visual
fovCircle.Transparency = 1

-- AIMBOT LOGIC (без Silent Aim)
RunService.RenderStepped:Connect(function()
    fovCircle.Radius = FeatureStates.FOVSize
    fovCircle.Visible = FeatureStates.ShowFOV
    fovCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
    fovCircle.Color = tabColors.Visual
    
    if FeatureStates.Aimbot then
        local closestTarget = nil
        local shortestDistance = FeatureStates.FOVSize
        
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                if FeatureStates.TeamCheck and player.Team == LocalPlayer.Team then
                    continue
                end
                
                local head = player.Character:FindFirstChild("Head")
                if head then
                    local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)
                    if onScreen then
                        local distance = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)).Magnitude
                        
                        if distance < shortestDistance then
                            if FeatureStates.OnlyVisible then
                                local ray = Ray.new(Camera.CFrame.Position, (head.Position - Camera.CFrame.Position).Unit * 1000)
                                local hit, _ = workspace:FindPartOnRay(ray, LocalPlayer.Character)
                                if hit and hit:IsDescendantOf(player.Character) then
                                    closestTarget = head
                                    shortestDistance = distance
                                end
                            else
                                closestTarget = head
                                shortestDistance = distance
                            end
                        end
                    end
                end
            end
        end
        
        if closestTarget then
            local targetPos = closestTarget.Position
            local currentPos = Camera.CFrame.Position
            local newPos = currentPos:Lerp(targetPos, FeatureStates.Smoothing)
            Camera.CFrame = CFrame.lookAt(currentPos, newPos)
            
            if FeatureStates.AutoShoot then
                mouse1press()
                wait(0.1)
                mouse1release()
            end
        end
    end
end)

-- SPIN BOT
local spinAngle = 0
local spinSpeed = 300

RunService.RenderStepped:Connect(function()
    if FeatureStates.SpinBot and LocalPlayer.Character then
        local root = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if root then
            spinAngle = spinAngle + spinSpeed
            root.CFrame = CFrame.new(root.Position) * CFrame.Angles(0, math.rad(spinAngle), 0)
        end
    end
end)

-- ESP CACHE
local espCache = {}
local chamsCache = {}
local traceLines = {}
local glowCache = {}

-- ESP UPDATE (исправленная версия)
local function updateVisuals()
    -- Cleanup dead players
    for pl, data in pairs(espCache) do
        if not pl.Character or not pl.Parent then
            if data.Frame then data.Frame:Destroy() end
            espCache[pl] = nil
        end
    end
    
    for pl, highlight in pairs(chamsCache) do
        if not pl.Character or not pl.Parent then
            if highlight then highlight:Destroy() end
            chamsCache[pl] = nil
        end
    end
    
    for pl, glow in pairs(glowCache) do
        if not pl.Character or not pl.Parent then
            if glow then 
                for _, g in ipairs(glow) do g:Destroy() end
            end
            glowCache[pl] = nil
        end
    end

    -- Если все ESP функции выключены - УДАЛЯЕМ ВСЕ
    if not (FeatureStates.ESPBoxes or FeatureStates.ESPNames or FeatureStates.ESPHealth or FeatureStates.Chams or FeatureStates.GlowPlayer) then
        -- Удаляем боксы
        for _, obj in ipairs(ESPContainer:GetChildren()) do
            obj:Destroy()
        end
        -- Очищаем кэш
        espCache = {}
        chamsCache = {}
        glowCache = {}
        return
    end

    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local char = player.Character
            local root = char:FindFirstChild("HumanoidRootPart")
            local head = char:FindFirstChild("Head")
            if not root or not head then continue end

            -- ESP Boxes
            if FeatureStates.ESPBoxes or FeatureStates.ESPNames or FeatureStates.ESPHealth then
                if not espCache[player] then
                    local frame = Instance.new("Frame")
                    frame.BackgroundTransparency = 1
                    frame.Size = UDim2.new(0, 100, 0, 150)
                    frame.AnchorPoint = Vector2.new(0.5, 0.5) -- ← Центрирование
                    frame.Parent = ESPContainer
                    
                    local box = Instance.new("Frame")
                    box.BackgroundTransparency = 1
                    box.BorderSizePixel = 0
                    box.Size = UDim2.new(1, 0, 1, 0)
                    box.Parent = frame
                    
                    -- Borders
                    local left = Instance.new("Frame")
                    left.Size = UDim2.new(0, 2, 1, 0)
                    left.BackgroundColor3 = tabColors.Visual
                    left.BorderSizePixel = 0
                    left.Parent = box
                    
                    local right = Instance.new("Frame")
                    right.Size = UDim2.new(0, 2, 1, 0)
                    right.Position = UDim2.new(1, -2, 0, 0)
                    right.BackgroundColor3 = tabColors.Visual
                    right.BorderSizePixel = 0
                    right.Parent = box
                    
                    local top = Instance.new("Frame")
                    top.Size = UDim2.new(1, 0, 0, 2)
                    top.BackgroundColor3 = tabColors.Visual
                    top.BorderSizePixel = 0
                    top.Parent = box
                    
                    local bottom = Instance.new("Frame")
                    bottom.Size = UDim2.new(1, 0, 0, 2)
                    bottom.Position = UDim2.new(0, 0, 1, -2)
                    bottom.BackgroundColor3 = tabColors.Visual
                    bottom.BorderSizePixel = 0
                    bottom.Parent = box
                    
                    local nameLabel = Instance.new("TextLabel")
                    nameLabel.BackgroundTransparency = 1
                    nameLabel.TextColor3 = Color3.new(1, 1, 1)
                    nameLabel.TextStrokeColor3 = Color3.new(0,0,0)
                    nameLabel.TextStrokeTransparency = 0.5
                    nameLabel.TextSize = 14
                    nameLabel.Font = Enum.Font.GothamBold
                    nameLabel.Size = UDim2.new(1, 0, 0, 20)
                    nameLabel.Position = UDim2.new(0, 0, 0, -25) -- Чуть выше бокса
                    nameLabel.Parent = frame

                    local healthBarBg = Instance.new("Frame")
                    healthBarBg.Size = UDim2.new(0, 3, 1, 0)
                    healthBarBg.Position = UDim2.new(0, -5, 0, 0)
                    healthBarBg.BackgroundColor3 = Color3.new(0,0,0)
                    healthBarBg.BorderSizePixel = 0
                    healthBarBg.Parent = frame

                    local healthBarFill = Instance.new("Frame")
                    healthBarFill.Size = UDim2.new(1, 0, 1, 0)
                    healthBarFill.BackgroundColor3 = Color3.new(0, 1, 0)
                    healthBarFill.BorderSizePixel = 0
                    healthBarFill.Parent = healthBarBg

                    espCache[player] = {Frame = frame, Box = box, Name = nameLabel, Health = healthBarFill, HealthBg = healthBarBg}
                end

                local data = espCache[player]
                local pos, onScreen = Camera:WorldToViewportPoint(root.Position)
                
                if onScreen then
                    data.Frame.Visible = true
                    
                    -- Центрируем по корню (HumanoidRootPart)
                    data.Frame.Position = UDim2.new(0, pos.X, 0, pos.Y)
                    
                    -- Вычисляем размер на основе расстояния
                    local dist = (Camera.CFrame.Position - root.Position).Magnitude
                    local height = math.clamp(4000 / dist, 40, 250)
                    local width = height * 0.5
                    
                    data.Frame.Size = UDim2.new(0, width, 0, height)
                    
                    -- Обновляем цвет боксов
                    for _, child in ipairs(data.Box:GetChildren()) do
                        if child:IsA("Frame") then
                            child.BackgroundColor3 = tabColors.Visual
                        end
                    end
                    
                    -- Имя
                    data.Name.Visible = FeatureStates.ESPNames
                    data.Name.Text = player.Name
                    data.Name.Position = UDim2.new(0, 0, 0, -25) -- Фиксированное смещение вверх
                    
                    -- Здоровье
                    if FeatureStates.ESPHealth then
                        data.HealthBg.Visible = true
                        local hum = char:FindFirstChild("Humanoid")
                        if hum then
                            local hp = hum.Health / hum.MaxHealth
                            hp = math.clamp(hp, 0, 1)
                            data.Health.Size = UDim2.new(1, 0, hp, 0)
                            data.Health.Position = UDim2.new(0, 0, 1, -hp * height)
                            
                            if hp > 0.6 then
                                data.Health.BackgroundColor3 = Color3.new(0, 1, 0)
                            elseif hp > 0.3 then
                                data.Health.BackgroundColor3 = Color3.new(1, 1, 0)
                            else
                                data.Health.BackgroundColor3 = Color3.new(1, 0, 0)
                            end
                        end
                    else
                        data.HealthBg.Visible = false
                    end
                else
                    data.Frame.Visible = false
                end
            end

            -- Chams
            if FeatureStates.Chams then
                if not chamsCache[player] then
                    local highlight = Instance.new("Highlight")
                    highlight.FillColor = tabColors.Visual
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.FillTransparency = 0.5
                    highlight.OutlineTransparency = 0
                    chamsCache[player] = highlight
                end
                chamsCache[player].FillColor = tabColors.Visual
                chamsCache[player].Adornee = char
                chamsCache[player].Parent = char
            else
                if chamsCache[player] then
                    chamsCache[player]:Destroy()
                    chamsCache[player] = nil
                end
            end
            
            -- Glow Player
            if FeatureStates.GlowPlayer then
                if not glowCache[player] then
                    local parts = {}
                    for _, part in ipairs(char:GetChildren()) do
                        if part:IsA("BasePart") then
                            local glow = Instance.new("SelectionBox")
                            glow.Name = "GlowBox"
                            glow.Parent = part
                            glow.Adornee = part
                            glow.Color3 = tabColors.Visual
                            glow.LineThickness = 2
                            glow.SurfaceTransparency = 0.7
                            table.insert(parts, glow)
                        end
                    end
                    glowCache[player] = parts
                else
                    for _, glow in ipairs(glowCache[player]) do
                        if glow and glow.Parent then
                            glow.Color3 = tabColors.Visual
                        end
                    end
                end
            else
                if glowCache[player] then
                    for _, glow in ipairs(glowCache[player]) do
                        if glow then glow:Destroy() end
                    end
                    glowCache[player] = nil
                end
            end
        end
    end
end

-- TRACES
local function updateTraces()
    if FeatureStates.ESPTraces then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local root = player.Character:FindFirstChild("HumanoidRootPart")
                if root then
                    local pos, onScreen = Camera:WorldToViewportPoint(root.Position)
                    
                    if onScreen then
                        if not traceLines[player] then
                            local line = Drawing.new("Line")
                            line.Thickness = 2
                            line.Color = tabColors.Visual
                            line.Transparency = 1
                            line.Visible = true
                            traceLines[player] = line
                        end
                        
                        traceLines[player].From = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y)
                        traceLines[player].To = Vector2.new(pos.X, pos.Y)
                        traceLines[player].Visible = true
                        traceLines[player].Color = tabColors.Visual
                    else
                        if traceLines[player] then
                            traceLines[player].Visible = false
                        end
                    end
                end
            end
        end
        
        for player, line in pairs(traceLines) do
            if not player.Character or not player.Parent then
                line:Remove()
                traceLines[player] = nil
            end
        end
    else
        for _, line in pairs(traceLines) do
            line:Remove()
        end
        traceLines = {}
    end
end

RunService.RenderStepped:Connect(updateVisuals)
RunService.RenderStepped:Connect(updateTraces)

-- HITBOX LOGIC
RunService.RenderStepped:Connect(function()
    if FeatureStates.HitboxESP then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                for _, part in ipairs(player.Character:GetChildren()) do
                    if part:IsA("BasePart") and not part:FindFirstChild("HitboxOutline") then
                        local outline = Instance.new("SelectionBox")
                        outline.Name = "HitboxOutline"
                        outline.Parent = part
                        outline.Adornee = part
                        outline.Color3 = tabColors.Visual
                        outline.LineThickness = FeatureStates.HitboxSize
                    elseif part:IsA("BasePart") and part:FindFirstChild("HitboxOutline") then
                        part.HitboxOutline.Color3 = tabColors.Visual
                    end
                end
            end
        end
    else
        for _, player in ipairs(Players:GetPlayers()) do
            if player.Character then
                for _, part in ipairs(player.Character:GetChildren()) do
                    if part:IsA("BasePart") then
                        local outline = part:FindFirstChild("HitboxOutline")
                        if outline then
                            outline:Destroy()
                        end
                    end
                end
            end
        end
    end
end)

-- RAINBOW THEME
local hue = 0
RunService.RenderStepped:Connect(function()
    if FeatureStates.Theme == "Rainbow" then
        hue = hue + 0.002
        if hue > 1 then hue = 0 end
        tabColors.Visual = Color3.fromHSV(hue, 1, 1)
        ApplyThemeToAll()
        if FeatureStates.SkyColor then
            Lighting.Ambient = tabColors.Visual
            Lighting.ColorShift_Top = tabColors.Visual
            Lighting.ColorShift_Bottom = tabColors.Visual
        end
    end
end)

-- TOGGLE GUI WITH INSERT
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not gameProcessed and input.KeyCode == Enum.KeyCode.Insert then
        MainFrame.Visible = not MainFrame.Visible
        watermark.Visible = MainFrame.Visible
    end
end)

print("Invisible RAGE v4 загружен! Нажми INSERT для скрытия.")

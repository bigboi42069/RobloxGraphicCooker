local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({
    Name = "Cooked Graphics Settings",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "OrionRTX"
})

local Tab = Window:MakeTab({
    Name = "Graphics",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

local Section = Tab:AddSection({
    Name = "Lighting Effects"
})

-- Color Correction Effect for Saturation
local colorCorrection = game.Lighting:FindFirstChild("ColorCorrection") or Instance.new("ColorCorrectionEffect", game.Lighting)
colorCorrection.Name = "ColorCorrection"
colorCorrection.Enabled = false

Tab:AddToggle({
    Name = "Enable Saturation",
    Default = false,
    Callback = function(Value)
        colorCorrection.Enabled = Value
    end
})

Tab:AddSlider({
    Name = "Saturation",
    Min = -100000,
    Max = 100000,
    Default = 0,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 0.1,
    ValueName = "Saturation",
    Callback = function(Value)
        colorCorrection.Saturation = Value
    end    
})

-- Ambient Lighting Intensity
local ambientValue = Color3.fromRGB(128, 128, 128)  -- Default value
local ambientEnabled = false

Tab:AddToggle({
    Name = "Enable Ambient Lighting Intensity",
    Default = false,
    Callback = function(Value)
        ambientEnabled = Value
        if Value then
            game.Lighting.Ambient = ambientValue
        else
            game.Lighting.Ambient = Color3.fromRGB(0, 0, 0)
        end
    end
})

Tab:AddSlider({
    Name = "Ambient Lighting Intensity",
    Min = 0,
    Max = 255,
    Default = 128,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 0.1,
    ValueName = "Intensity",
    Callback = function(Value)
        ambientValue = Color3.fromRGB(Value, Value, Value)
        if ambientEnabled then
            game.Lighting.Ambient = ambientValue
        end
    end    
})

-- Brightness
local brightnessValue = 10  -- Default Brightness
local brightnessEnabled = false

Tab:AddToggle({
    Name = "Enable Brightness",
    Default = false,
    Callback = function(Value)
        brightnessEnabled = Value
        if Value then
            game.Lighting.Brightness = brightnessValue
        else
            game.Lighting.Brightness = 10
        end
    end
})

Tab:AddSlider({
    Name = "Brightness Level",
    Min = 0,
    Max = 1000000,
    Default = 10,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 0.1,
    ValueName = "Brightness",
    Callback = function(Value)
        brightnessValue = Value
        if brightnessEnabled then
            game.Lighting.Brightness = Value
        end
    end    
})

-- Bloom Effect
local bloom = game.Lighting:FindFirstChild("Bloom") or Instance.new("BloomEffect", game.Lighting)
bloom.Name = "Bloom"
bloom.Enabled = false

Tab:AddToggle({
    Name = "Enable Bloom",
    Default = false,
    Callback = function(Value)
        bloom.Enabled = Value
    end
})

Tab:AddSlider({
    Name = "Bloom Intensity",
    Min = 0,
    Max = 100000,
    Default = 1,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 0.1,
    ValueName = "Bloom",
    Callback = function(Value)
        bloom.Intensity = Value
    end    
})

-- Sun Rays Effect
local sunRays = game.Lighting:FindFirstChild("SunRays") or Instance.new("SunRaysEffect", game.Lighting)
sunRays.Name = "SunRays"
sunRays.Enabled = false

Tab:AddToggle({
    Name = "Enable Sun Rays",
    Default = false,
    Callback = function(Value)
        sunRays.Enabled = Value
    end
})

Tab:AddSlider({
    Name = "Sun Rays Intensity",
    Min = 0,
    Max = 1000000,
    Default = 1,
    Color = Color3.fromRGB(255, 255, 255),
    Increment = 0.1,
    ValueName = "Sun Rays",
    Callback = function(Value)
        sunRays.Intensity = Value
    end    
})

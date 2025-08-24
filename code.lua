-- Animation Spoofer Core
-- Returns a function to spoof/play animation

local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")

local function spoofAnimation(animId)
    if not animId or animId == "" then
        warn("Animation ID missing")
        return
    end

    local player = Players.LocalPlayer
    local character = player and (player.Character or player.CharacterAdded:Wait())
    if character then
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        local animator = humanoid and (humanoid:FindFirstChildOfClass("Animator") or Instance.new("Animator", humanoid))

        -- Play animation
        local anim = Instance.new("Animation")
        anim.AnimationId = "rbxassetid://"..animId
        if animator then
            local track = animator:LoadAnimation(anim)
            track.Looped = true
            track:Play()
        end
    end

    -- Create folder in ServerStorage
    local folder = ServerStorage:FindFirstChild("spoofed_animations")
    if not folder then
        folder = Instance.new("Folder")
        folder.Name = "spoofed_animations"
        folder.Parent = ServerStorage
    end

    -- Add KeyframeSequence
    local kfs = Instance.new("KeyframeSequence")
    kfs.Name = "Spoofed_"..animId
    kfs.Parent = folder

    local key = Instance.new("KeyframeSequenceKey")
    key.Time = 0
    key.Value = 1
    key.Parent = kfs

    print("Animation Spoofer: Spoofed "..animId.." added to ServerStorage")
end

return spoofAnimation

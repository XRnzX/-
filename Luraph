-- obfuscated good luck getting my main code lmfaoo 🤣🔒
-- Animation Spoofer Core for GitHub
-- Returns a function to be called with animation ID

local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")

local function spoofAnimation(animId)
    if not animId or animId == "" then
        warn("Animation ID not provided!")
        return
    end

    local player = Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoid = character:WaitForChild("Humanoid")
    local animator = humanoid:FindFirstChildOfClass("Animator")
    if not animator then
        animator = Instance.new("Animator")
        animator.Parent = humanoid
    end

    -- Play animation on local player
    local animation = Instance.new("Animation")
    animation.AnimationId = "rbxassetid://"..animId
    local track = animator:LoadAnimation(animation)
    track.Looped = true
    track:Play()

    -- Create folder in ServerStorage if missing
    local folder = ServerStorage:FindFirstChild("spoofed_animations")
    if not folder then
        folder = Instance.new("Folder")
        folder.Name = "spoofed_animations"
        folder.Parent = ServerStorage
    end

    -- Convert to KeyframeSequence
    local kfs = Instance.new("KeyframeSequence")
    kfs.Name = "Spoofed_"..animId
    kfs.Parent = folder
    local key = Instance.new("KeyframeSequenceKey")
    key.Time = 0
    key.Value = 1
    key.Parent = kfs

    print("Animation Spoofer: Spoofed animation "..animId.." stored in ServerStorage")
end

return spoofAnimation

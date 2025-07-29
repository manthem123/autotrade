local Configs = {
    TargetPet = "Corrupted Kitsune", -- Pet name here
    TargetUser = "buzz_bae", -- Player name to give the pet here
}











-- Wait until the game load
repeat task.wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Variables
local LP = game:GetService("Players").LocalPlayer
local SelectedPet = nil

-- Search for the target pet
for _, v in ipairs(LP:WaitForChild("Backpack"):GetChildren()) do
    if v.Name:match("^" .. Configs.TargetPet .. " %[" ) then
        SelectedPet = v
        break
    end
end

-- Euip it and give it to the target player
if SelectedPet then
    LP.Character.Humanoid:EquipTool(SelectedPet)
    task.wait(1)
    game:GetService("ReplicatedStorage"):WaitForChild("GameEvents"):WaitForChild("PetGiftingService"):FireServer("GivePet", game:GetService("Players"):WaitForChild(Configs.TargetUser))
end

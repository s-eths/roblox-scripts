repeat task.wait() until game:IsLoaded();
repeat task.wait() until game:GetService("Workspace").Players:WaitForChild(game:GetService("Players").LocalPlayer.Name):FindFirstChild("FULLY_LOADED_CHAR");

if game:GetService("Players").LocalPlayer.DataFolder.Currency.Value < 100000 then
    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("you cant even afford a single crate.", "All");
    return;
end;

local TIMER_START = tick();
local CRATE_AMOUNT = math.floor(game:GetService("Players").LocalPlayer.DataFolder.Currency.Value / 100000);

game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("attempting to open " .. CRATE_AMOUNT .. " crates.", "All");
repeat
    task.wait()
    if game:GetService("Players").LocalPlayer.DataFolder.Currency.Value >= 1000000 then
        game:GetService("ReplicatedStorage"):WaitForChild("MainEvent"):FireServer("PurchaseSkinCrate", true);
    elseif game:GetService("Players").LocalPlayer.DataFolder.Currency.Value <= 1000000 then
        game:GetService("ReplicatedStorage"):WaitForChild("MainEvent"):FireServer("PurchaseSkinCrate", false);
    end;
until game:GetService("Players").LocalPlayer.DataFolder.Currency.Value < 100000;
game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("sucessfully opened " .. CRATE_AMOUNT .. " crates in " .. string.format("%.2f", tick() - loopStartTick) .. " seconds", "All");
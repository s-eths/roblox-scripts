getgenv().TOGGLE_KEY = "v";

if __LOADED then return end;
getgenv().__LOADED = true;
getgenv().TOGGLED = nil;

for i, v in next, getconnections(game:GetService("Players").LocalPlayer.Idled) do
    v:Disable();
end;

if tonumber(game:GetService("Players").LocalPlayer.DataFolder.Currency.Value) >= 250 then
    repeat
        task.wait();
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Workspace").Ignored.Shop["[HeavyWeights] - $250"].Head.Position) * CFrame.new(0, 3, 0);
        fireclickdetector(game:GetService("Workspace").Ignored.Shop["[HeavyWeights] - $250"].ClickDetector, 3);
    until game:GetService("Players").LocalPlayer.Character:FindFirstChild("[HeavyWeights]") or game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("[HeavyWeights]")
end;

task.spawn(function()
    while task.wait() do
        if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("[HeavyWeights]") then
            game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("[HeavyWeights]").Parent = game:GetService("Players").LocalPlayer.Character;
        end;
    end;
end);

task.spawn(function()
    Mouse.KeyDown:Connect(function(v)
        if v == TOGGLE_KEY and not TOGGLED then
            TOGGLED = true;
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Position) * CFrame.new(0, 300, 0);
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = true;
            game:GetService("RunService"):Set3dRenderingEnabled(false);
            setfpscap(5);
            while TOGGLED do
                task.wait();
                game:GetService("Players").LocalPlayer.Character["[HeavyWeights]"]:Activate();
            end;
        elseif v == TOGGLE_KEY and TOGGLED then
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Position) * CFrame.new(0, -300, 0);
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Anchored = false;
            TOGGLED = false;
            setfpscap(60);
            game:GetService("RunService"):Set3dRenderingEnabled(true);
        end;
    end);
end);
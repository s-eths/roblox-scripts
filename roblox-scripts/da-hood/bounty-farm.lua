getgenv().config = {
    MONEY_COLLECTOR = 12345,
    DEATH_BOTS = {
        12345,
        12345, 
    },
    FPS = 3,
};

repeat task.wait() until game:IsLoaded();

settings().Physics.PhysicsEnvironmentalThrottle = 1;
settings().Rendering.QualityLevel = "Level01";
UserSettings():GetService("UserGameSettings").MasterVolume = 0;

if config.MONEY_COLLECTOR == game:GetService("Players").LocalPlayer.UserId then
    setfpscap(60);
elseif table.find(config.DEATH_BOTS, game:GetService("Players").LocalPlayer.UserId) then
    setfpscap(10);
else
    setfpscap(config.FPS);
end;

if config.MONEY_COLLECTOR ~= game:GetService("Players").LocalPlayer.UserId and not table.find(config.DEATH_BOTS, game:GetService("Players").LocalPlayer.UserId) then
    game:GetService("RunService"):Set3dRenderingEnabled(false);
end;

for i, v in next, getconnections(game:GetService("Players").LocalPlayer.Idled) do
    v:Disable();
end;

repeat task.wait() until game:GetService("Workspace").Players:WaitForChild(game:GetService("Players").LocalPlayer.Name):FindFirstChild("FULLY_LOADED_CHAR");

getgenv().FUNCTIONS = {
    DEATHBOT_1 = config.DEATH_BOTS[1];
    DEATHBOT_2 = config.DEATH_BOTS[2];
};

if config.MONEY_COLLECTOR == game:GetService("Players").LocalPlayer.UserId then
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-479.177490234375, 21.25499153137207, -368.8803405761719);
end;

game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(Data)
    if string.lower(Data.Message) == "bounty set haha" then
        if table.find(config.DEATH_BOTS, game:GetService("Players").LocalPlayer.UserId) then
            task.spawn(function()
                repeat
                    task.wait();
                    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[game:GetService("Players"):GetNameFromUserIdAsync(config.MONEY_COLLECTOR)].Character.HumanoidRootPart.CFrame.Position) + Vector3.new(0, 0, -3);
                until not game:GetService("Workspace").Players:FindFirstChild(game:GetService("Players").LocalPlayer.Name);
            end);
        elseif config.MONEY_COLLECTOR == game:GetService("Players").LocalPlayer.UserId then
            task.spawn(function()
                repeat
                    task.wait();
                    if not game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Combat") then
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Combat"):Activate();
                    else
                        game:GetService("Players").LocalPlayer.Backpack:FindFirstChild("Combat").Parent = game:GetService("Players").LocalPlayer.Character;
                        game:GetService("Players").LocalPlayer.Character:FindFirstChild("Combat"):Activate();
                    end;
                until game:GetService("Workspace").Players[game:GetService("Players"):GetNameFromUserIdAsync(FUNCTIONS.DEATHBOT_1)].BodyEffects["K.O"].Value and game:GetService("Workspace").Players[game:GetService("Players"):GetNameFromUserIdAsync(FUNCTIONS.DEATHBOT_2)].BodyEffects["K.O"].Value;
            end);
        end;
    end;
end);

if config.MONEY_COLLECTOR == game:GetService("Players").LocalPlayer.UserId then
    task.spawn(function()
        while task.wait() do
            for i, v in next, game:GetService("Workspace").Players:GetChildren() do
                if v.Name == game:GetService("Players"):GetNameFromUserIdAsync(FUNCTIONS.DEATHBOT_1) or v.Name == game:GetService("Players"):GetNameFromUserIdAsync(FUNCTIONS.DEATHBOT_2) then
                    if v.BodyEffects["K.O"].Value and v.BodyEffects["Grabbed"].Value == nil then
                        repeat
                            task.wait();
                            if game:GetService("Players")[v.Name].Character:FindFirstChild("HumanoidRootPart") and game:GetService("Players")[v.Name].Character:FindFirstChild("UpperTorso") then
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[v.Name].Character.UpperTorso.Position + Vector3.new(0, 3, 0));
                                game:GetService("ReplicatedStorage").MainEvent:FireServer("Stomp");
                            end;
                        until not game:GetService("Workspace").Players:FindFirstChild(v.Name);
                    end;
                end;
            end;
            task.wait(1);
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-479.177490234375, 21.25499153137207, -368.8803405761719);
        end;
    end);
end;

if config.MONEY_COLLECTOR ~= game:GetService("Players").LocalPlayer.UserId and not table.find(config.DEATH_BOTS, game:GetService("Players").LocalPlayer.UserId) then
    local CASH_AMOUNT = game:GetService("Players").LocalPlayer.DataFolder.Currency.Value;
    repeat
        task.wait();
        if game:GetService("Players").LocalPlayer.DataFolder.Currency.Value < 2500000 then
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SetBounty"):InvokeServer(game:GetService("Players"):GetNameFromUserIdAsync(FUNCTIONS.DEATHBOT_1), game:GetService("Players").LocalPlayer.DataFolder.Currency.Value);
            task.wait();
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SetBounty"):InvokeServer(game:GetService("Players"):GetNameFromUserIdAsync(FUNCTIONS.DEATHBOT_2), game:GetService("Players").LocalPlayer.DataFolder.Currency.Value);
        else
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SetBounty"):InvokeServer(game:GetService("Players"):GetNameFromUserIdAsync(FUNCTIONS.DEATHBOT_1), 2500000);
            task.wait();
            game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("SetBounty"):InvokeServer(game:GetService("Players"):GetNameFromUserIdAsync(FUNCTIONS.DEATHBOT_2), 2500000);
        end
        if CASH_AMOUNT - game:GetService("Players").LocalPlayer.DataFolder.Currency.Value >= 50000 then
            game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("bounty set haha", "All");
            CASH_AMOUNT = game:GetService("Players").LocalPlayer.DataFolder.Currency.Value;
        end;
    until game:GetService("Players").LocalPlayer.DataFolder.Currency.Value < 50000;
    task.wait(3);
    game:Shutdown();
end;
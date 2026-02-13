getgenv().config = {
    ["TOGGLE"] = false;
    ["ITEMS"] = {"TipJar", "[SprayCan]", "Combat", "[Phone]", "[Katana]"};
    ["WHITELISTED_USER_IDs"] = {3089996348};
};

repeat task.wait() until game:IsLoaded();

if table.find(config.WHITELISTED_USER_IDs, game:GetService("Players").LocalPlayer.UserId) then
    local function REMOVE_USELESS_ITEMS()
        for i, v in next, game:GetService("Players").LocalPlayer.Backpack:GetChildren() do
            if table.find(config.ITEMS, v.Name) then
                v.Parent = game:GetService("Players").LocalPlayer.StarterGear;
            end;
        end;
    end;

    local function RETURN_USELESS_ITEMS()
        for i, v in next, game:GetService("Players").LocalPlayer.StarterGear:GetChildren() do
            v.Parent = game:GetService("Players").LocalPlayer.Backpack;
        end;
    end;

    task.spawn(function()
        while task.wait() do
            if config.TOGGLE then
                repeat task.wait() until not game:GetService("Workspace").Players:FindFirstChild(game:GetService("Players").LocalPlayer.Name);
                repeat task.wait() until game:GetService("Workspace").Players:FindFirstChild(game:GetService("Players").LocalPlayer.Name);
                task.wait(3);
                REMOVE_USELESS_ITEMS();
            end;
        end;
    end);

    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.OnMessageDoneFiltering.OnClientEvent:Connect(function(Data)
        if game:GetService("Players"):GetUserIdFromNameAsync(Data.FromSpeaker) == game:GetService("Players").LocalPlayer.UserId then
            if string.lower(Data.Message) == "enable" then
                getgenv().config.TOGGLE = true;
                REMOVE_USELESS_ITEMS();
            elseif string.lower(Data.Message) == "disable" then
                getgenv().config.TOGGLE = false;
                RETURN_USELESS_ITEMS();
            end;
        end;
    end);
end;
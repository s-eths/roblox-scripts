getgenv().ENABLED = true;

local ESP_FOLDER = game:GetService("CoreGui"):FindFirstChild("ESP_FOLDER") or Instance.new("Folder");
if ESP_FOLDER.Name == "Folder" then
    ESP_FOLDER.Name = "ESP_FOLDER";
    ESP_FOLDER.Parent = game:GetService("CoreGui");
end;

while ENABLED do
    task.wait();
    for i, v in next, game:GetService("Players"):GetChildren() do
        if v.Character ~= nil then
            local ESP = ESP_FOLDER:FindFirstChild(v.Name) or Instance.new("Highlight");
            pcall(function()
                ESP.Name = v.Name;
            end);
            if ESP.Name ~= game:GetService("Players").LocalPlayer.Name then
                ESP.Parent = ESP_FOLDER;
                ESP.Adornee = v.Character;
                ESP.DepthMode = "AlwaysOnTop";
                ESP.FillColor = Color3.fromRGB(0, 0, 0);
                ESP.OutlineColor = Color3.fromRGB(255, 255, 255);
                ESP.FillTransparency = 0.5;
                ESP.OutlineTransparency = 0;
            end;
        end;
    end;
else
    game:GetService("CoreGui")["ESP_FOLDER"]:Destroy();
end;
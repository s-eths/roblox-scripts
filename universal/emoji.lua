for i, v in next, game:GetService("Players"):GetChildren() do
    if v.Name == "USERNAME" then
        if v.Character then
            v.Character:FindFirstChild("Humanoid").DisplayName = "[😎] " .. v.Character:FindFirstChild("Humanoid").DisplayName;
        end;
    end;
end;
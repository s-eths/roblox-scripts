while task.wait() do
    for i, v in next, game:GetService("Workspace").Players:GetChildren() do
        if v.BodyEffects["K.O"].Value and v.BodyEffects["Grabbed"].Value == nil then
            local Players = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game:GetService("Players")[v.Name].Character.UpperTorso.Position + Vector3.new(0, 3, 0));
            game:GetService("ReplicatedStorage").MainEvent:FireServer("Stomp");
        end;
    end;
end;
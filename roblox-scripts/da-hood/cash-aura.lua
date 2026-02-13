for i, v in next, game:GetService("Workspace").Ignored.Drop:GetChildren() do
    if v.Name == "MoneyDrop" then
        if (v.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 15 then
            fireclickdetector(v.ClickDetector);
        end;
    end;
end;
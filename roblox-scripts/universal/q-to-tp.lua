local MOUSE = game:GetService("Players").LocalPlayer:GetMouse();

MOUSE.KeyDown:Connect(function(v)
    if v == "q" and MOUSE.Target then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Mouse.Hit.X, Mouse.Hit.Y, Mouse.Hit.Z)
    end;
end);
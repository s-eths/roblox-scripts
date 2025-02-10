local old;
old = hookmetamethod(game, "__index", function(SELF, KEY)
    if KEY == "Walkspeed" and SELF == game:GetService("Players").LocalPlayer.Character.Humanoid or Key == "JumpPower" and Self == game:GetService("Players").LocalPlayer.Character.Humanoid then
        return nil;
    end;
    return old(SELF, KEY);
end);

game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = 100;
game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = 100;
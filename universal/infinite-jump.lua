game:GetService("UserInputService").InputBegan:connect(function(v)
    if v.UserInputType == Enum.UserInputType.Keyboard and v.KeyCode == Enum.KeyCode.Space then
        game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState("Jumping");
    end;
end);
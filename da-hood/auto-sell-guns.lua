-- made by @s.eths | this will sell every gun you own for da hood cash, dont use unless you want to sell EVERY skin on your account.

getgenv().ENABLED = true;

while ENABLED do
    task.wait();
    for i, v in next, game:GetService("Players").LocalPlayer.PlayerGui.MainScreenGui.WeaponSkinsGUI.Body.Wrapper.SkinView.Frame.Skins.Contents.Entries:GetChildren() do
        if v.Name ~= "UIGridLayout" and v.Name ~= "UIPadding" and v.Name ~= "SkinEntryTemplate" then
            if v.Preview.AmountValue.Text ~= "x0" then
                local Amount = v.Preview.AmountValue.Text:gsub("x", "");
                local Type, Name = v.Name:match("^(.-%])(.+)$");
                game:GetService("ReplicatedStorage"):WaitForChild("MainEvent"):FireServer("SellSkins", Type, Name, Amount);
                task.wait(1);
            end;
        end;
    end;
end;
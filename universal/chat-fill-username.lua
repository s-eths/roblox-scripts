game:GetService("Players").LocalPlayer.Chatted:Connect(function(v)
    local args = string.split(string.lower(v), " ");
    if args[1] == "find" then
        for i, v in next, game:GetService("Players"):GetPlayers() do
            if string.sub(string.lower(v.Name), 1, string.len(args[2])) == string.lower(args[2]) or string.sub(string.lower(v.DisplayName), 1, string.len(args[2])) == string.lower(args[2]) then
                print(v.Name);
            end;
        end;
    end;
end);
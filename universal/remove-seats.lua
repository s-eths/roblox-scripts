for i, v in next game:GetService("Workspace"):GetDescendants() do
    if v:IsA("Seat") then
        v:Destroy();
    end;
end;
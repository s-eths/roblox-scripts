-- made by @s.eths | currently only supports galaxy skin for rev, db, tac. also the gun beam color is not 1:1, its close but not exact

getgenv().ENABLED = true;

local ASSET_IDS = {
    ["[Double-Barrel SG]"] = "rbxassetid://9401441647";
    ["[TacticalShotgun]"] = "rbxassetid://9402279010";
    ["[Revolver]"] = "rbxassetid://9370936730";
}

local function EQUIP_GALAXY_SKIN(WEAPON)
    game:GetService("Workspace").Players[game:GetService("Players").LocalPlayer.Name]:FindFirstChild(WEAPON).Default.TextureID = ASSET_IDS[WEAPON];
    local GalaxyParticleEmitter = Instance.new("ParticleEmitter");
    GalaxyParticleEmitter.Name = "Galaxy";
    GalaxyParticleEmitter.Texture = "rbxassetid://7422600824";
    GalaxyParticleEmitter.LightEmission = 0.7;
    GalaxyParticleEmitter.Lifetime = NumberRange.new(1, 1);
    GalaxyParticleEmitter.Rate = 3;
    GalaxyParticleEmitter.Rotation = NumberRange.new(0, 360);
    GalaxyParticleEmitter.RotSpeed = NumberRange.new(0, 15);
    GalaxyParticleEmitter.Speed = NumberRange.new(1, 1);
    GalaxyParticleEmitter.SpreadAngle = Vector2.new(-45, 45);
    GalaxyParticleEmitter.ZOffset = 1;
    GalaxyParticleEmitter.LockedToPart = true;
    GalaxyParticleEmitter.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.new(0.419608, 0.376471, 1));
        ColorSequenceKeypoint.new(1, Color3.new(0.419608, 0.376471, 1));
    });
    GalaxyParticleEmitter.Size = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0.5);
        NumberSequenceKeypoint.new(0.496, 1.2);
        NumberSequenceKeypoint.new(1, 0.5);
    });
    GalaxyParticleEmitter.Squash = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0);
        NumberSequenceKeypoint.new(0.173364, 0.525);
        NumberSequenceKeypoint.new(0.584386, -1.7625);
        NumberSequenceKeypoint.new(0.98163, 0.0749998);
        NumberSequenceKeypoint.new(1, 0);
    });
    GalaxyParticleEmitter.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 0);
        NumberSequenceKeypoint.new(0.107922, 1);
        NumberSequenceKeypoint.new(0.391504, 0.25);
        NumberSequenceKeypoint.new(0.670494, 0.78125);
        NumberSequenceKeypoint.new(0.845006, 0);
        NumberSequenceKeypoint.new(1, 1);
    });
    GalaxyParticleEmitter.Orientation = Enum.ParticleOrientation.FacingCamera;
    GalaxyParticleEmitter.Parent = game:GetService("Workspace").Players[game:GetService("Players").LocalPlayer.Name]:FindFirstChild(WEAPON).Default;
end;

game:GetService("Workspace").Players[game:GetService("Players").LocalPlayer.Name].ChildAdded:Connect(function(v)
    if ENABLED then
        if v.Name == "[Double-Barrel SG]" then
            if v.Default.TextureID ~= ASSET_IDS["[Double-Barrel SG]"] and not v.Default:FindFirstChild("Galaxy") then
                task.wait(0.1);
                EQUIP_GALAXY_SKIN("[Double-Barrel SG]");
            end;
        elseif v.Name == "[TacticalShotgun]" then
            if v.Default.TextureID ~= ASSET_IDS["[TacticalShotgun]"] and not v.Default:FindFirstChild("Galaxy") then
                task.wait(0.1);
                EQUIP_GALAXY_SKIN("[TacticalShotgun]");
            end;
        elseif v.Name == "[Revolver]" then
            if v.Default.TextureID ~= ASSET_IDS["[Revolver]"] and not v.Default:FindFirstChild("Galaxy") then
                task.wait(0.1);
                EQUIP_GALAXY_SKIN("[Revolver]");
            end;
        end;
    end;
end);

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function()
    repeat task.wait(); until game:GetService("Workspace").Players:FindFirstChild(game:GetService("Players").LocalPlayer.Name);
    game:GetService("Workspace").Players[game:GetService("Players").LocalPlayer.Name].ChildAdded:Connect(function(v)
        if ENABLED then
            if v.Name == "[Double-Barrel SG]" then
                if v.Default.TextureID ~= ASSET_IDS["[Double-Barrel SG]"] and not v.Default:FindFirstChild("Galaxy") then
                    task.wait(0.1);
                    EQUIP_GALAXY_SKIN("[Double-Barrel SG]");
                end;
            elseif v.Name == "[TacticalShotgun]" then
                if v.Default.TextureID ~= ASSET_IDS["[TacticalShotgun]"] and not v.Default:FindFirstChild("Galaxy") then
                    task.wait(0.1);
                    EQUIP_GALAXY_SKIN("[TacticalShotgun]");
                end;
            elseif v.Name == "[Revolver]" then
                if v.Default.TextureID ~= ASSET_IDS["[Revolver]"] and not v.Default:FindFirstChild("Galaxy") then
                    task.wait(0.1);
                    EQUIP_GALAXY_SKIN("[Revolver]");
                end;
            end;
        end;
    end);
end);

game:GetService("Workspace").Ignored.Siren.Radius.ChildAdded:Connect(function(v)
    if ENABLED then
        if v.Name == "BULLET_RAYS" then
            local GunBeam = v:WaitForChild("NewGunBeam", 5);
            if GunBeam then
                GunBeam.Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.new(0, 0.0980392, 0.231373));
                    ColorSequenceKeypoint.new(1, Color3.new(0.0980392, 0.231373, 1));
                });
            end;
        end;
    end;
end);

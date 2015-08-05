function OnStartTouch(trigger)
    print(trigger.activator)
    print(trigger.caller)
end

function TopRightTeleport(trigger)
    local nPlayerID = getPlayerOwner(trigger.activator)
    PlayerResource:IncrementAssists(nPlayerID,nPlayerID)
    local assists = PlayerResource:GetAssists(nPlayerID)
    if assists == 5 then
        local teamNum = trigger.activator:GetTeamNumber()
        local playerNum = nPlayerID + 1
        local msg = "PLAYER " .. playerNum .. " IS THE WINNER!!! CONGRATULATIONS!" 
        GameRules:SendCustomMessage(msg, 1, 1)
        GameRules:SetGameWinner(teamNum)
        GameRules:Defeated()
    else
        local prevUnit = trigger.activator:GetUnitName()
        local spawner_2 = Entities:FindByName ( nil, "spawner_2")
        local unitName = getRandomUnit(prevUnit)
        local creature = CreateUnitByName(unitName, spawner_2:GetAbsOrigin() + RandomVector( RandomFloat( 0, 200 ) ), true, PlayerResource:GetPlayer(nPlayerID), PlayerResource:GetPlayer(nPlayerID), nPlayerID)
        creature:SetControllableByPlayer(nPlayerID, true)
        local abilityString = "jungle_player" .. nPlayerID
        creature:AddAbility(abilityString)
        creature:FindAbilityByName(abilityString):SetLevel(1)
        SendToConsole("dota_camera_set_lookatpos -256 -1856")
        trigger.activator:RemoveSelf()
    end
end

function BottomLeftTeleport(trigger)
    local nPlayerID = getPlayerOwner(trigger.activator)
    PlayerResource:IncrementAssists(nPlayerID,nPlayerID)
    local assists = PlayerResource:GetAssists(nPlayerID)
    if assists == 5 then
        local teamNum = trigger.activator:GetTeamNumber()
        local playerNum = nPlayerID + 1
        local msg = "PLAYER " .. playerNum .. " IS THE WINNER!!! CONGRATULATIONS!" 
        GameRules:SendCustomMessage(msg, 1, 1)
        GameRules:SetGameWinner(teamNum)
        GameRules:Defeated()
    else
        local prevUnit = trigger.activator:GetUnitName()
        local spawner_1 = Entities:FindByName ( nil, "spawner_1")
        local unitName = getRandomUnit(prevUnit)
        local creature = CreateUnitByName(unitName , spawner_1:GetAbsOrigin() + RandomVector( RandomFloat( 0, 200 ) ), true, PlayerResource:GetPlayer(nPlayerID), PlayerResource:GetPlayer(nPlayerID), nPlayerID)
        creature:SetControllableByPlayer(nPlayerID, true)
        local abilityString = "jungle_player" .. nPlayerID
        creature:AddAbility(abilityString)
        creature:FindAbilityByName(abilityString):SetLevel(1)
        SendToConsole("dota_camera_set_lookatpos -3520 448")
        trigger.activator:RemoveSelf()
    end
end

function getPlayerOwner(spawnedUnit)
        
        if spawnedUnit:HasAbility("jungle_player0") then
            return 0
        end
        
        if spawnedUnit:HasAbility("jungle_player1") then
            return 1
        end
        
        if spawnedUnit:HasAbility("jungle_player2") then
            return 2
        end
        
        if spawnedUnit:HasAbility("jungle_player3") then
            return 3
        end
        
        if spawnedUnit:HasAbility("jungle_player4") then
            return 4
        end
        
        if spawnedUnit:HasAbility("jungle_player5") then
            return 5
        end
        
        if spawnedUnit:HasAbility("jungle_player6") then
            return 6
        end
        
        if spawnedUnit:HasAbility("jungle_player7") then
            return 7
        end
        
        if spawnedUnit:HasAbility("jungle_player8") then
            return 8
        end
        
        if spawnedUnit:HasAbility("jungle_player9") then
            return 9
        end

end

function getRandomUnit(prevUnit)
    local unitList = {"Test of Patience", "Radiator", "Cheater", "Sniper", "Regenerator", "Leoric", "Immortal", "Nom Nom", "Naga Siren", "Pulverizer",
    "Sandman", "Venom", "Banisher", "Eehar", "Freezer", "Doom", "Zoom Zoom", "Breaking the Sound Barrier", "Vanisher", "E02K", "Razor", "Untouchable"}
    local unit = unitList[math.random(22)]
    if unit == prevUnit then
        unit = getRandomUnit(prevUnit)
        return unit
    else
        return unit
    end
end

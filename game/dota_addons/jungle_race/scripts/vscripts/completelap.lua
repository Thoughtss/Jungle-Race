function OnStartTouch(trigger)
    print(trigger.activator)
    print(trigger.caller)
end

function Teleport(trigger)
    print(trigger.activator)
    print(trigger.caller)
    local nPlayerID = getPlayerOwner(trigger.activator)
    local spawner_2 = Entities:FindByName ( nil, "spawner_2")
    local creature = CreateUnitByName("npc_dota_neutral_alpha_wolf" , spawner_2:GetAbsOrigin() + RandomVector( RandomFloat( 0, 200 ) ), true, PlayerResource:GetPlayer(nPlayerID), PlayerResource:GetPlayer(nPlayerID), nPlayerID)
    creature:SetControllableByPlayer(nPlayerID, true)
    PlayerResource:IncrementAssists(nPlayerID,nPlayerID)
    trigger.activator:RemoveSelf() 
    SendToConsole("dota_camera_center") -- Camera has to follow otherwise, the player might be lost.
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
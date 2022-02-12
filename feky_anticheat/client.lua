--[[
    #####################################################################
    #                                                                   #
    #                 feky_anticheat - FekyDEV - 11-02-2022             #
    #                                                                   #
    #####################################################################
]]--

CreateThread(function()
    local currWeapon = 0
    local fireWeapon = nil
    local fireCount = 0

    local first_count = 0 -- INF AMMO
    local count1 = 0      -- INF AMMO
    local count2 = 0      -- INF AMMO
    local make_sure = 0   -- INF AMMO


    while true do
        Wait(100)
    
        local playerped = GetPlayerPed(PlayerId())

        -- Infinity Ammo
        if IsPedShooting(playerped) then
            fireWeapon = GetSelectedPedWeapon(playerped)
            fireCount = fireCount + 1
            local ammo = GetAmmoInPedWeapon(playerped, fireWeapon)

            if first_count == 0 then
                first_count = (first_count + 1)
                if count1 == 0 then
                    count1 = ammo
                    print("1.Strela = "..count1)
                end
            else
                if count2 == 0 and count1 > 0 then
                    count2 = ammo
                    print("2.Strela = "..count2)

                    if count2 >= count1 then

                        make_sure = (make_sure + 1)
                        
                        if make_sure < 3 then
                            print("Analyzing...")
                            first_count = 0
                            count1 = 0
                            count2 = 0
                        elseif make_sure == 3 then
                            print("Definitly cheater!")
                        end
                        
                    else 
                        print("Nothing")
                        first_count = 0
                        count1 = 0
                        count2 = 0
                    end
                end
            end

        end
    end
end)

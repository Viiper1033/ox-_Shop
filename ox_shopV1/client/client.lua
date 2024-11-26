local Options = {}


if config and config.nouriture then
    for k, v in ipairs(config.nouriture) do
        table.insert(Options, {
            title = v.label,
            description = ("Prix: %s$"):format(v.price),
            icon = v.icon,
            iconColor = v.iconColor,
            image = v.image,
            onSelect = function()
                local itemName = v.item
                local itemPrice = v.price
                
                TriggerServerEvent('buyItem', itemName, itemPrice)
            end
        })
    end
end

lib.registerContext({
    id = 'menu_food',
    title = 'Nourriture',
    menu = 'menu_shop',
    options = Options
})

lib.registerContext({
    id = 'menu_shop',
    title = 'Superette',
    options = {
        {
            title = 'Nourriture',
            description = 'Catégorie de nourriture',
            icon = 'fa-bars',
            iconColor = '#65e137',
            iconAnimation = 'spin',
            onSelect = function()
                lib.showContext('menu_food')
            end
        }
    }
})


Citizen.CreateThread(function()
    while true do
        local sleep = 1000
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        if config and config.shopPosition then
            local distance = #(config.shopPosition - playerCoords)

            if distance < 2 then
                sleep = 0
                lib.showTextUI('[E] - Ouvrir le shop', {
                    position = "left-center",
                    icon = 'hand',
                    style = {
                        borderRadius = 7,
                        backgroundColor = '#48BB78',
                        color = 'white'
                    }
                })

                if IsControlJustPressed(0, 51) then
                    lib.showContext('menu_shop')
                end
            else
                lib.hideTextUI()
            end

        end

        Wait(sleep)
    end
end)

RegisterNetEvent('client:notify')
AddEventHandler('client:notify', function(data)
    lib.notify({
        id = 'notif_shop',
        title = 'Notification',
        description = data.message,
        position = 'top',
        style = data.style or {}, -- Utilise le style personnalisé si fourni
        icon = data.type == "success" and "check" or "times", -- Icône différente selon le type
        iconColor = data.type == "success" and "#ffffff" or "#E53E3E" -- Couleur selon le type
    })
end)

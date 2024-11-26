-- Fonction pour envoyer des logs via un webhook Discord
local function sendDiscordLog(webhookURL, title, description, color)
    if config.webhooks.enabled and webhookURL then
        PerformHttpRequest(webhookURL, function(err, text, headers) end, "POST", json.encode({
            embeds = {{
                title = title,
                description = description,
                color = color, -- Couleur en format décimal (exemple : 16711680 = rouge)
                footer = {text = os.date("%Y-%m-%d %H:%M:%S")}
            }}
        }), {["Content-Type"] = "application/json"})
    end
end

-- Événement pour acheter un article
RegisterServerEvent('buyItem')
AddEventHandler('buyItem', function(itemName, itemPrice)
    local source = source 
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer ~= nil then
        local PlayerMoney = xPlayer.getMoney()

        if PlayerMoney >= itemPrice then
            xPlayer.removeMoney(itemPrice) 
            xPlayer.addInventoryItem(itemName, 1)

            -- Notification de succès
            local successMessage = string.format(config.notifications.purchaseSuccess.message, itemName, itemPrice)
            TriggerClientEvent('client:notify', source, {
                message = successMessage,
                type = config.notifications.purchaseSuccess.type,
                style = config.notifications.purchaseSuccess.style
            })

            -- Log d'achat réussi
            sendDiscordLog(
                config.webhooks.purchaseSuccessLog,
                "Achat Réussi",
                string.format("**Joueur :** %s\n**Article :** %s\n**Prix :** %s$", GetPlayerName(source), itemName, itemPrice),
                3066993 -- Vert (couleur Discord)
            )
        else
            -- Notification de fonds insuffisants
            TriggerClientEvent('client:notify', source, {
                message = config.notifications.insufficientFunds.message,
                type = config.notifications.insufficientFunds.type,
                style = config.notifications.insufficientFunds.style
            })

            -- Log d'achat refusé
            sendDiscordLog(
                config.webhooks.purchaseFailedLog,
                "Achat Refusé",
                string.format("**Joueur :** %s a tenté d'acheter **%s** pour **%s$**, mais n'avait pas assez d'argent.", GetPlayerName(source), itemName, itemPrice),
                15158332 -- Rouge (couleur Discord)
            )
        end

    end
end)

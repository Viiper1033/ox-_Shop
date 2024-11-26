config = {}

config.shopPosition = vec3(-1223.9774169922, -907.54858398438, 12.326354026794)

config.nouriture = { 
    {label = 'Burger', item = 'burger', price = 15, image = 'https://static.vecteezy.com/system/resources/previews/033/293/316/non_2x/burger-cheese-burger-hamburger-ham-burger-beef-burger-burger-transparent-background-ai-generated-png.png', icon = 'bread-slice', iconColor = '#ff5733'},
    {label = 'Eau', item = 'water', price = 10, image = 'https://static.vecteezy.com/system/resources/thumbnails/049/632/650/small_2x/a-single-plastic-water-bottle-with-a-transparent-background-png.png',  icon = 'glass-water', iconColor = '#0099e5'},
    {label = 'Ecola', item = 'cola', price = 12, image = 'https://png.pngtree.com/png-clipart/20220110/ourmid/pngtree-cartoon-hand-painted-coke-bottle-png-image_4286431.png',  icon = 'martini-glass',  iconColor = '#e50000'}
}

config.notifications = {
    insufficientFunds = {
        message = "Vous n'avez pas assez d'argent pour acheter cet article.",
        type = "error", 
        style = {
            backgroundColor = "#ffffff", 
            color = "#000000", 
            fontSize = '25px' -- Taille du texte
        }
    },
    purchaseSuccess = {
        message = "Vous avez acheté : %s pour %s$.",
        type = "success",
        style = {
            backgroundColor = "#000000", 
            color = "#FFFFFF", 
            fontSize = '18px' 
        }
    }
}

-- Configuration des webhooks pour les logs
config.webhooks = {
    enabled = true, -- Activez ou désactivez les logs via Webhooks
    purchaseSuccessLog = "https://discord.com/api/webhooks/1310239742142709806/pWnCG-S2llNabnYorY6PYiJhyQqAgMicGJ4VIGEeOujY-xlCuxSL1eWaJJHtJTd8hFi3", -- Webhook pour les achats réussis
    purchaseFailedLog = "https://discord.com/api/webhooks/1310239813147824198/Ec399FPKDcvZpHqi1RV9uNWpo-qM_bBWMdPJZ4MXsr8msTSrXdd6ZNAIAcJyVSjIjDVV"   -- Webhook pour les achats refusés
}

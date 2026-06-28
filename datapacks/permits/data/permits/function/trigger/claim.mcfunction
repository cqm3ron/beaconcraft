# If the permit is renamed but still unassigned, convert the name into shop data first
execute if data entity @s {SelectedItem:{components:{"minecraft:custom_data":{permit:1b}}}} if data entity @s SelectedItem.components."minecraft:custom_name" run data modify storage permits:shop shop set from entity @s SelectedItem.components."minecraft:custom_name"
execute if data entity @s {SelectedItem:{components:{"minecraft:custom_data":{permit:1b}}}} if data entity @s SelectedItem.components."minecraft:custom_name" run item modify entity @s weapon.mainhand permits:setshopfromname

# Tell the player if the permit is already owned by someone else
execute unless data entity @s {SelectedItem:{components:{"minecraft:custom_data":{owner:"null"}}}} run tellraw @s {"text":"This permit already belongs to someone else.","color":"red"}
# Tell the player if no shop is set
execute if data entity @s {SelectedItem:{components:{"minecraft:custom_data":{owner:"null"}}}} unless data entity @s SelectedItem.components."minecraft:custom_data".shop unless data entity @s SelectedItem.components."minecraft:custom_name" run tellraw @s {"text":"Set a shop name before claiming this permit.","color":"red"}
execute if data entity @s {SelectedItem:{components:{"minecraft:custom_data":{owner:"null",shop:"Unassigned"}}}} unless data entity @s SelectedItem.components."minecraft:custom_name" run tellraw @s {"text":"Set a shop name before claiming this permit.","color":"red"}
execute if data entity @s {SelectedItem:{components:{"minecraft:custom_data":{owner:"null",shop:""}}}} unless data entity @s SelectedItem.components."minecraft:custom_name" run tellraw @s {"text":"Set a shop name before claiming this permit.","color":"red"}
# Only set owner if unclaimed and a valid shop is set
execute if data entity @s {SelectedItem:{components:{"minecraft:custom_data":{owner:"null"}}}} if data entity @s SelectedItem.components."minecraft:custom_data".shop unless data entity @s {SelectedItem:{components:{"minecraft:custom_data":{shop:"Unassigned"}}}} unless data entity @s {SelectedItem:{components:{"minecraft:custom_data":{shop:""}}}} run data modify storage permits:shop shop set from entity @s SelectedItem.components."minecraft:custom_data".shop
execute if data entity @s {SelectedItem:{components:{"minecraft:custom_data":{owner:"null"}}}} if data entity @s SelectedItem.components."minecraft:custom_data".shop unless data entity @s {SelectedItem:{components:{"minecraft:custom_data":{shop:"Unassigned"}}}} unless data entity @s {SelectedItem:{components:{"minecraft:custom_data":{shop:""}}}} run item modify entity @s weapon.mainhand permits:setowner
scoreboard players set @s permit_claim 0
scoreboard players enable @s permit_claim
# Prevent despawn
execute if entity @s[nbt={Item:{components:{"minecraft:custom_model_data":{strings:["permit"]}}}}] run data merge entity @s {Age:-32768}
tag @s add permit_checked

# Flag owned permits for return handling
execute if entity @s[tag=permit_checked,nbt={Item:{components:{"minecraft:custom_model_data":{strings:["permit"]}}}}] unless entity @s[nbt={Item:{components:{"minecraft:custom_data":{owner:"null"}}}}] run tag @s add permit_owned
# Prevent despawn
execute if entity @s[nbt={Item:{components:{"minecraft:custom_data":{permit:true}}}}] run data merge entity @s {Age:-32768}
tag @s add permit_checked
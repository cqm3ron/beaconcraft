execute if entity @e[type=item, nbt={Item:{id:"minecraft:diamond"}}] as @e[type=item,nbt={Item:{id:"minecraft:diamond"}}] at @s if block ~ ~-1 ~ minecraft:amethyst_block if block ~ ~-1 ~1 minecraft:smooth_quartz_stairs if block ~ ~-1 ~-1 smooth_quartz_stairs if block ~1 ~-1 ~ minecraft:smooth_quartz_stairs if block ~-1 ~-1 ~ minecraft:smooth_quartz_stairs if block ~1 ~-1 ~1 minecraft:quartz_pillar if block ~1 ~-1 ~-1 quartz_pillar if block ~-1 ~-1 ~1 minecraft:quartz_pillar if block ~-1 ~-1 ~-1 minecraft:quartz_pillar unless entity @e[tag=auction_origin,distance=..2] run tag @s add auction_init
execute if entity @e[type=item, nbt={Item:{id:"minecraft:diamond"}}] as @e[type=item,nbt={Item:{id:"minecraft:diamond"}}] at @s if entity @e[tag=auction_origin,distance=..0.8] run tag @s add auction_remover
execute as @e[tag=auction_init] run function auction:create_altar
execute at @e[tag=auction_origin] run particle dust_color_transition{from_color:[0.392,0.278,0.620],to_color:[0.996,0.796,0.902],scale:1} ~ ~ ~ 0.3 1 0.3 0 3 force
execute as @e[tag=auction_remover] run kill @n[tag=auction_origin]
execute as @e[tag=auction_remover] run execute as @n[tag=auctioned_permit] run data merge entity @s {PickupDelay:10, NoGravity:0b}
execute as @e[tag=permit_remover] run execute as @n[tag=auctioned_permit] run data merge entity @s {PickupDelay:10, NoGravity:0b}
execute as @e[tag=auction_remover] run execute as @n[tag=auctioned_permit] run tag @s remove auctioned_permit
execute as @e[tag=permit_remover] run execute as @n[tag=auctioned_permit] run tag @s remove auctioned_permit
execute as @e[tag=auction_remover] run execute as @n[tag=auctioned_permit] run tag @s remove positioned_auctioned_permit
execute as @e[tag=permit_remover] run execute as @n[tag=auctioned_permit] run tag @s remove positioned_auctioned_permit
execute as @e[tag=auction_remover] run kill @s 
execute as @e[tag=permit_remover] run kill @s 
execute at @e[tag=auction_origin] as @n[distance=..0.8, type=item,nbt={Item:{components:{"minecraft:custom_data":{permit:true}}}}] unless entity @s[nbt={Item:{components:{"minecraft:custom_data":{"owner":"null"}}}}] unless entity @e[tag=auctioned_permit, distance=..5] run tag @s add auctioned_permit

execute as @e[tag=auctioned_permit] unless entity @s[tag=positioned_auctioned_permit] run data merge entity @s {PickupDelay:-1, NoGravity:1b, Motion:[]}
execute as @e[tag=auctioned_permit] unless entity @s[tag=positioned_auctioned_permit] at @n[tag=auction_origin] run tp @s ~ ~ ~


execute as @e[tag=auctioned_permit] unless entity @s[tag=positioned_auctioned_permit] run stopwatch create minecraft:unclaim_timer
tag @e[tag=auctioned_permit] add positioned_auctioned_permit

execute as @e[tag=auctioned_permit] at @n[tag=auction_origin] run data modify entity @s Item.components."minecraft:custom_data".owner set value "null"
execute as @e[tag=auctioned_permit] if data entity @s Item.components."minecraft:custom_data"{owner:"null"} run data modify entity @s Item.components."minecraft:lore"[0] set value {"text":"Owner: Unclaimed","color":"gray","italic":false}

execute if stopwatch minecraft:unclaim_timer 1.. at @e[tag=auction_origin] run summon minecraft:block_display ~ ~ ~ {Tags:[permit_remover]}
execute if stopwatch minecraft:unclaim_timer 1.. at @e[tag=auction_origin] run particle minecraft:explosion ~ ~ ~
execute if stopwatch minecraft:unclaim_timer 1.. at @e[tag=auction_origin] run playsound minecraft:entity.player.levelup master @a ~ ~ ~ 1 2 0
execute if stopwatch minecraft:unclaim_timer 1.. store result score #rx rand run random value -1..1
execute if stopwatch minecraft:unclaim_timer 1.. store result score #ry rand run random value 10..40
execute if stopwatch minecraft:unclaim_timer 1.. store result score #rz rand run random value -1..1
execute if stopwatch minecraft:unclaim_timer 1.. as @e[tag=auctioned_permit] store result entity @s Motion[0] double 0.01 run scoreboard players get #rx rand
execute if stopwatch minecraft:unclaim_timer 1.. as @e[tag=auctioned_permit] store result entity @s Motion[1] double 0.01 run scoreboard players get #ry rand
execute if stopwatch minecraft:unclaim_timer 1.. as @e[tag=auctioned_permit] store result entity @s Motion[2] double 0.01 run scoreboard players get #rz rand

execute if stopwatch minecraft:unclaim_timer 1.. run stopwatch remove minecraft:unclaim_timer
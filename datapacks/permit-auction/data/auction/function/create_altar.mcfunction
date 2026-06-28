execute as @s run data modify entity @s Motion set value []
execute as @s at @s align xyz run tp @s ~0.5 ~ ~0.5
# remove all old auction origins
kill @e[tag=auction_origin]
# summon new auction origin
execute as @e[tag=auction_init] at @s run summon minecraft:block_display ~ ~ ~ {Tags:["auction_origin"]}
# remove auction initialiser
kill @e[tag=auction_init]
execute store result score #owner0 perm_uuid0 run data get entity @s Item.components."minecraft:custom_data".owner[0]
execute store result score #owner1 perm_uuid1 run data get entity @s Item.components."minecraft:custom_data".owner[1]
execute store result score #owner2 perm_uuid2 run data get entity @s Item.components."minecraft:custom_data".owner[2]
execute store result score #owner3 perm_uuid3 run data get entity @s Item.components."minecraft:custom_data".owner[3]
execute as @a run function permits:try_return
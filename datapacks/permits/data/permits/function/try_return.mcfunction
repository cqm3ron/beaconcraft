execute store result score #p0 perm_uuid0 run data get entity @s UUID[0]
execute store result score #p1 perm_uuid1 run data get entity @s UUID[1]
execute store result score #p2 perm_uuid2 run data get entity @s UUID[2]
execute store result score #p3 perm_uuid3 run data get entity @s UUID[3]
execute if score #p0 perm_uuid0 = #owner0 perm_uuid0 if score #p1 perm_uuid1 = #owner1 perm_uuid1 if score #p2 perm_uuid2 = #owner2 perm_uuid2 if score #p3 perm_uuid3 = #owner3 perm_uuid3 run tp @e[type=item,tag=permit_owned,sort=nearest,limit=1] @s
execute if score #p0 perm_uuid0 = #owner0 perm_uuid0 if score #p1 perm_uuid1 = #owner1 perm_uuid1 if score #p2 perm_uuid2 = #owner2 perm_uuid2 if score #p3 perm_uuid3 = #owner3 perm_uuid3 run data merge entity @e[type=item,tag=permit_owned,sort=nearest,limit=1] {PickupDelay:0}
event_inherited()

input = playerInput.id

damageID = -1

punchCharge = 0
punchChargeMax = 18
punchChargeMin = 9
punchChargePunch = false
punchChargeRadius = 16
punchChargeRadiusMax = 36

goSmash = false
smash = false
smashRadius = 128
smashList = ds_list_create()

mask_index = sprite_collision_mask(s_gorilla_idle,false,2,42,90,86,95,bboxkind_ellipse,255)
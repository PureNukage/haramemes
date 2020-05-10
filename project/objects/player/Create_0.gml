event_inherited()

input = playerInput.id

punchCharge = 0
punchChargeMax = 8
punchChargePunch = false
punchChargeRadius = 16
punchChargeRadiusMax = 36

goSmash = false
smash = false
smashRadius = 128
smashList = ds_list_create()

mask_index = sprite_collision_mask(s_gorilla_idle,false,2,42,90,86,95,bboxkind_ellipse,255)
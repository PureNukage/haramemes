event_inherited()

input = playerInput.id

damageID = -1

punchQueue = false
punchCharge = 0
punchChargeQueue = false
punchChargeMax = 24
punchChargeMin = 18
punchChargePunch = false
punchChargeRadius = 16
punchChargeRadiusMax = 36
punch1CD = -1

grab = false
grabRightHand = false
grabLeftHand = false
grabRightHandHeld = -1
grabLeftHandHeld = -1
grabBothHands = false

goSmash = false
smash = false
smashRadius = 128
smashList = ds_list_create()

mask_index = sprite_collision_mask(s_gorilla_idle,false,2,42,90,86,95,bboxkind_ellipse,255)
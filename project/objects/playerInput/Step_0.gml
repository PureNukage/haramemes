////	Keyboard
keyLeft = keyboard_check(ord("A"))
keyRight = keyboard_check(ord("D"))
keyUp = keyboard_check(ord("W"))
keyDown = keyboard_check(ord("S"))

spacePressed = keyboard_check_pressed(vk_space)

qPressed = keyboard_check_pressed(ord("Q"))
qPress = keyboard_check(ord("Q"))
qRelease = keyboard_check_released(ord("Q"))

////	Controller
gamepadAxisLH = gamepad_axis_value(0, gp_axislh)
gamepadAxisLV = gamepad_axis_value(0, gp_axislv)

gamepadAxisRH = gamepad_axis_value(0, gp_axisrh)
gamepadAxisRV = gamepad_axis_value(0, gp_axisrv)

gamepadKey1Pressed = gamepad_button_check_pressed(0, gp_face1)
gamepadKey2Pressed = gamepad_button_check_pressed(0, gp_face3)
gamepadKey2Press = gamepad_button_check(0, gp_face3)
gamepadKey3Press = gamepad_button_check_pressed(0, gp_face2)

gamepadShoulderRRB = gamepad_button_check_pressed(0, gp_shoulderrb)
gamepadShoulderRRBPressed = gamepad_button_check(0, gp_shoulderrb)

gamepadShoulderLLB = gamepad_button_check_pressed(0, gp_shoulderlb)
gamepadShoulderLLBPressed = gamepad_button_check(0, gp_shoulderlb)

gamepadSelectPress = gamepad_button_check_pressed(0 ,gp_select)


////	Variables
hspd = (keyRight - keyLeft) + gamepadAxisLH
vspd = (keyDown - keyUp) + gamepadAxisLV

jump = max(spacePressed, gamepadKey1Pressed)

punch = max(qPressed, gamepadKey2Pressed)
punchHold = max(qPress, gamepadKey2Press)
punchRelease = max(qRelease, gamepadKey2Released)
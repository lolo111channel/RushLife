extends Node2D

func _ready():
	$CanvasLayer/Menu/Fullscreen.pressed = OS.window_fullscreen
	$CanvasLayer/Menu/Vsync.pressed = OS.is_vsync_enabled()
	
	pass

func _process(delta):
	if $CanvasLayer/Menu/Fullscreen.pressed == true:
		OS.window_fullscreen = true
	else:
		OS.window_fullscreen = false
	
	if $CanvasLayer/Menu/Vsync.pressed == true:
		OS.vsync_enabled = true
	else:
		OS.vsync_enabled = false
	



func _on_Play_pressed():
	get_tree().change_scene("res://Scenes/Levels/Intro.tscn")


func _on_Instruction_pressed():
	$CanvasLayer/Instruction.visible = true


func _on_Exit_pressed():
	get_tree().quit()


func _on_License_pressed():
	OS.shell_open("https://godotengine.org/license")


func _on_Button_pressed():
	$CanvasLayer/Instruction.visible = false

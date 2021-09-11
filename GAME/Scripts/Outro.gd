extends Node2D

func _ready():
	$AnimationPlayer.play("Outro")
	
func _process(delta):
	if($AnimationPlayer.is_playing() == false):
		get_tree().change_scene("res://Scenes/Levels/Main_Menu.tscn")

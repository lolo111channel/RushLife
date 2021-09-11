extends Node2D

func _ready():
	$AnimationPlayer.play("Intro")

func _process(delta):
	if($AnimationPlayer.is_playing() == false):
		get_tree().change_scene("res://Scenes/Levels/Level1.tscn")
	pass


func _on_Skip_pressed():
	get_tree().change_scene("res://Scenes/Levels/Level1.tscn")

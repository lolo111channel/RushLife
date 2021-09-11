extends Area2D




func _on_Rocket_body_entered(body):
	get_tree().change_scene("res://Scenes/Levels/Outro.tscn")

extends Area2D

var add_health = 10
var variant = 0


var rng:RandomNumberGenerator = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	
	variant = rng.randi_range(0,2)
	
	if(variant == 0):
		add_health = 10
	elif(variant == 1):
		add_health = 12
	elif(variant == 2):
		add_health = 15
	
	$AnimatedSprite.frame = variant
	$AnimationPlayer.play("New Anim")
	



func _on_Vaccine_body_entered(body):
	if(body.is_in_group("Player")):
		body.time += add_health
		queue_free()

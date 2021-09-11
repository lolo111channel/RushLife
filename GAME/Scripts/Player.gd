extends KinematicBody2D

var speed:float = 250.0
var gravity:float = 1200

var right:float = 0
var jump:float
var velocity:Vector2 = Vector2.ZERO

var time = 100
var max_time = 100


func _ready():
	get_tree().paused = false
	$CanvasLayer/death.visible = false
	
	$AnimationPlayer2.play("background")

func _process(delta):
	if(right < 0):
		$AnimatedSprite.flip_h = false
		$AnimatedSprite2.flip_h = false
		$AnimatedSprite2.position = Vector2(4.018,-4)
	elif(right > 0):
		$AnimatedSprite.flip_h = true
		$AnimatedSprite2.flip_h = true
		$AnimatedSprite2.position = Vector2(-4.018,-4)
	
	if(right == 0):
		velocity.x = 0
	
	if(is_on_floor() and (right > 0 or right < 0)):
		$AnimatedSprite.animation = "run"
	
	if(right == 0 and is_on_floor()):
		$AnimatedSprite.animation = "stay"
		pass
		
	
	if(time <= 0):
		$CanvasLayer/death.visible = true
		$AnimationPlayer.play("death")
		get_tree().paused = true
	
	if(time > 80):
		$AnimatedSprite2.frame = 0
	elif(time < 80 and time > 60):
		$AnimatedSprite2.frame = 1
	elif(time < 60 and time > 40):
		$AnimatedSprite2.frame = 2
	elif(time < 40 and time > 20):
		$AnimatedSprite2.frame = 3
	elif(time < 20 and time > 0):
		$AnimatedSprite2.frame = 4
	
	
	if(time >= max_time):
		time = max_time
	
		


func _physics_process(delta):
	movement(delta)
	
	if(Input.is_action_just_pressed("ui_cancel") and time != 0):
		get_tree().change_scene("res://Scenes/Levels/Main_Menu.tscn")
	
	
	
func movement(delta):
	
	right = Input.get_action_strength("Left") - Input.get_action_strength("Right")
	if(Input.is_action_pressed("Jump") and is_on_floor()):
		jump = -500
		$AnimatedSprite.animation = "jump"

	if(!is_on_floor()): jump += gravity * delta
	velocity = Vector2(-right * speed,jump)
	
	

	velocity = move_and_slide(velocity, Vector2.UP)
	



func _on_Timer_timeout():
	$Timer.start(0.25)
	time -= 1


func _on_Retry_pressed():
	get_tree().reload_current_scene()



func _on_Menu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/Levels/Main_Menu.tscn")

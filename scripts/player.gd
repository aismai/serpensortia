extends CharacterBody2D


const SPEED = 100.0
var current_direction = "none" 


func _ready():
	$AnimatedSprite2D.play("front_idle")

func _physics_process(delta):
	player_movement(delta)
	
func player_movement(delta):
	if Input.is_action_pressed("right"):
		current_direction = "right"
		play_animation(true)
		velocity.x = SPEED
		velocity.y = 0
	elif Input.is_action_pressed("left"):
		current_direction = "left"
		play_animation(true)
		velocity.x = -SPEED
		velocity.y = 0
	elif Input.is_action_pressed("down"):
		current_direction = "down"
		play_animation(true)
		velocity.x = 0
		velocity.y = SPEED
	elif Input.is_action_pressed("up"):
		current_direction = "up"
		play_animation(true)
		velocity.x = 0
		velocity.y = -SPEED
	else:
		play_animation(false)
		velocity.x = 0
		velocity.y = 0
	
	move_and_slide()

func play_animation(movement):
	var direction = current_direction
	var animation = $AnimatedSprite2D
	
	if direction == "right":
		animation.flip_h = false
		if(movement == true):
			animation.play("side_walk")
		else:
			animation.play("side_idle")
	
	if direction == "left":
		animation.flip_h = true
		if(movement == true):
			animation.play("side_walk")
		else:
			animation.play("side_idle")

	if direction == "up":
		animation.flip_h = false
		if(movement == true):
			animation.play("back_walk")
		else:
			animation.play("back_idle")
	
	if direction == "down":
		animation.flip_h = false
		if(movement == true):
			animation.play("front_walk")
		else:
			animation.play("front_idle")

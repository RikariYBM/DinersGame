extends KinematicBody2D

var speed = 45
var rotation_speed = 1.5

var velocity = Vector2.ZERO
var rotation_dir = 0

var rot = 1

func get_input():
	rotation_dir = 0
	velocity = Vector2.ZERO
	if Input.is_action_pressed('right'):
		rot = 1
		$AnimatedSprite.play("walk_right")
		velocity += transform.x * speed
	elif Input.is_action_pressed('left'):
		rot = 2
		$AnimatedSprite.play("walk_left")
		velocity -= transform.x * speed
	elif Input.is_action_pressed('down'):
		if rot == 1:
			$AnimatedSprite.play("walk_right")
		elif rot == 2:
			$AnimatedSprite.play("walk_left")
		velocity += transform.y * speed
	elif Input.is_action_pressed('up'):
		if rot == 1:
			$AnimatedSprite.play("walk_right")
		elif rot == 2:
			$AnimatedSprite.play("walk_left")
		velocity -= transform.y * speed
	else: 
		if rot == 1:
			$AnimatedSprite.play("idle_right")
		elif rot == 2:
			$AnimatedSprite.play("idle_left")

func _physics_process(delta):
	get_input()
	rotation += rotation_dir * rotation_speed * delta
	velocity = move_and_slide(velocity)

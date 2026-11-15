extends CharacterBody2D

var accel_x : int = 25
var movement_speed : int = 150

var jump_height : int = -400

var can_attack : bool = false

var damage : int = 5

func _process(delta):
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()

	move(delta)

func move(delta):
	velocity += get_gravity() * delta

	var direction = Input.get_axis("Left", "Right")

	if direction: 
		velocity.x = move_toward(velocity.x, movement_speed * direction, accel_x)
	else:
		velocity.x = move_toward(velocity.x, 0, accel_x)

	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = jump_height

	move_and_slide()

func attack(enemy: Enemy):
	if not is_on_floor() and can_attack and Input.is_action_pressed("Jump"):
		can_attack = false
		velocity.y = jump_height
		enemy.take_damage()

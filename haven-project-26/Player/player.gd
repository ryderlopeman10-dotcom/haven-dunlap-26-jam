extends CharacterBody2D

@onready var falling_timer: Timer = $"Falling Timer"
@onready var player_collision_shape: CollisionShape2D = $CollisionShape2D

var movement_speed : int = 150

var jump_height : int = -3000
var can_jump : bool = true
var is_jumping : bool = false
var first_jump : bool = false

func _process(delta):
	if Input.is_action_pressed("Quit"):
		get_tree().quit()

func _physics_process(delta):
	topdown_movement(delta)
	jump(delta)

func topdown_movement(delta):
	var dir := Input.get_vector("Left", "Right", "Up", "Down")
	velocity = dir * movement_speed
	
	var dir_x := Input.get_axis("Left", "Right")
	var dir_y := Input.get_axis("Up", "Down")
	
	if Input.is_action_just_pressed("Jump"):
		velocity.y = jump_height
		is_jumping = true
		first_jump = true
	
	if dir_x:
		velocity.x = dir_x * movement_speed
	
	if is_jumping:
		return
	
	if dir_y:
			velocity.y = dir_y * movement_speed

	move_and_slide()

func jump(delta):
	if not is_jumping:
		return
	else:
		player_collision_shape.disabled = true
		
		if first_jump:
			first_jump = false
			falling_timer.start()
		velocity += get_gravity() / 3.25
		
	move_and_slide()
	
func _on_timer_timeout():
	is_jumping = false
	velocity.y = 0
	player_collision_shape.disabled = false
	
	move_and_slide()

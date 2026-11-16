extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var label_2: Label = $"../Label2"

var accel_x : int = 25
var movement_speed : int = 150

var jump_height : int = -525
var gravity : int = 300

var can_attack : bool = false

var damage : int = 5

var start : bool = false

func _process(delta):
	if Input.is_action_pressed("Start"):
		Globals.score = 0
		start = true
		label_2.visible = false
	
	if start:
		move(delta)

func move(delta):
	velocity += get_gravity() * delta

	var direction = Input.get_axis("Left", "Right")

	if Input.is_action_pressed("Right"):
		animated_sprite_2d.flip_h = false
	elif Input.is_action_pressed("Left"):
		animated_sprite_2d.flip_h = true

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
		$Timer.start()
		$Burst.visible = true
		EnemySpawner.spawn_enemy()
		


func _on_timer_timeout() -> void:
	$Burst.visible = false


func _on_deathbound_body_entered(body: Node2D) -> void:
	pass # Replace with function body.

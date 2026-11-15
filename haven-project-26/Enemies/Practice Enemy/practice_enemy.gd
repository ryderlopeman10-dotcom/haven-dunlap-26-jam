extends Area2D

var health : float = 5.0

var damagable : bool = false
var in_player : bool = true

func _process(delta):
	die()
	
func die():
	if health <= 0:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		if body.attack():
			health -= body.damage
		damagable = true
		in_player = true

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		body.in_enemy = false
		damagable = false
		in_player = false

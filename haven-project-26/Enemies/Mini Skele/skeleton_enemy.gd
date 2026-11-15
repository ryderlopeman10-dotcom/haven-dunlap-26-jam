extends Area2D

var health : int = 10
var damage : int = 2
var move_speed : int = 0

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.can_attack = true

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.can_attack = false

func take_damage():
	pass

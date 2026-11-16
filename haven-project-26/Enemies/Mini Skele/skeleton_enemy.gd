class_name Enemy
extends Area2D

@onready var gogo: Sprite2D = $Image20261115170900492

var health : int = 10
var damage : int = 2
var move_speed : int = 0


func _process(delta: float) -> void:
	if health <= 0:
		queue_free()
		Globals.update_score()


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.can_attack = true
		body.attack(self)

func _on_body_exited(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.can_attack = false

func take_damage():
	health -= Globals.player_dmg

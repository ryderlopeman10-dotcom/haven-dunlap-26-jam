extends Node2D

var enemy_scene : PackedScene = preload("res://Enemies/Mini Skele/skeleton_enemy.tscn")

func spawn_enemy():
	var new_enemy = enemy_scene.instantiate()
	new_enemy.position = Vector2(randf_range(-134.0, 137.0), 69)
	get_parent().add_child(new_enemy)

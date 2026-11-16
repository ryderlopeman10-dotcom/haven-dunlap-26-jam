extends Control


func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Enemies/Mini Skele/game.tscn")
	print("Start pressed")


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/credits.tscn")
	print("Credits pressed")

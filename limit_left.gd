extends Node2D

var player_in_range := false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		get_tree().change_scene_to_file("res://city.tscn")

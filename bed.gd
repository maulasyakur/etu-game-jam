extends Node2D

@export var next_level_path: String = "res://level2.tscn"

var player_in_range := false

func _process(_delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file(next_level_path)

func _on_area_2d_body_entered(body: Node) -> void:
	if body.name == "Player":
		player_in_range = true
		$E.show()

func _on_area_2d_body_exited(body: Node) -> void:
	if body.name == "Player":
		player_in_range = false
		$E.hide()

func _on_e_pressed() -> void:
	get_tree().change_scene_to_file("res://level2.tscn")

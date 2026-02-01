extends Node2D

var player_in_range := false
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _process(_delta: float) -> void:
	if player_in_range and Input.is_action_just_pressed("wear"):
		var player = get_node_or_null("../Player")
		if player:
			player.wear_mask()

func _on_area_2d_body_entered(body: Node) -> void:
	if body.name == "Player":
		player_in_range = true
		$F.show()

func _on_area_2d_body_exited(body: Node) -> void:
	if body.name == "Player":
		player_in_range = false
		$F.hide()

func _on_e_pressed() -> void:
	get_tree().change_scene_to_file("res://level2.tscn")

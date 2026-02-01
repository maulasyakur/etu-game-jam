extends Control


func _start_pressed() -> void:
	get_tree().change_scene_to_file("res://level1.tscn")


func _on_quit() -> void:
	get_tree().quit()

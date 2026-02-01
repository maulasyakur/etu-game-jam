extends Control

func _start_pressed() -> void:
	get_node("Mixkit-mouse-click-close-1113").play()
	get_tree().change_scene_to_file("res://level1.tscn")

func _on_quit() -> void:
	get_node("Mixkit-mouse-click-close-1113").play()
	get_tree().quit()
	

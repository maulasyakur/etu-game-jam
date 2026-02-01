extends Control


func _on_inventorybtn_pressed() -> void:
	$"inventory-container".show()


func _on_closebtn_pressed() -> void:
	$"inventory-container".hide()

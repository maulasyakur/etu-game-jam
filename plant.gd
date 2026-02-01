extends Node2D

@onready var item_list: ItemList = $"../CanvasLayer/Inventory/inventory-container/ItemList"

func _on_detector_body_entered(body: Node2D) -> void:
	if $detector/bush.visible == false:
		$Button.show()

func _on_detector_body_exited(body: Node2D) -> void:
	$Button.hide()

func _on_button_pressed() -> void:
	$detector/bush.show()

func _on_take_pressed() -> void:
	$take_detect/bush.hide()
	item_list.add_item("Grape")
	
func _on_take_detect_body_entered(body: Node2D) -> void:
	$take.show()

func _on_take_detect_body_exited(body: Node2D) -> void:
	$take.hide()

extends Control

func _to_dialogue2() -> void:
	get_node("Dialogue-1-radio").visible = false
	get_node("Dialogue-2-radio").visible = true

func _to_dialogue3() -> void:
	get_node("Dialogue-2-radio").hide()
	get_node("Dialogue-3-radio").show()

func _to_dialogue4() -> void:
	get_node("Dialogue-3-radio").hide()
	get_node("Dialogue-4-radio").show()

func _to_dialogue5() -> void:
	get_node("Dialogue-4-radio").hide()
	get_node("Dialogue-5-radio").show()

func _close_dialogue5() -> void:
	get_node("Dialogue-5-radio").hide()

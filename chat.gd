extends Control

func _to_dialogue2() -> void:
	get_node("Dialogue-1-radio").visible = false
	get_node("Dialogue-2-radio").visible = true
	get_node("Mixkit-mouse-click-close-1113").play()

func _to_dialogue3() -> void:
	get_node("Dialogue-2-radio").hide()
	get_node("Mixkit-mouse-click-close-1113").play()
	if (get_node_or_null("Dialogue-3-radio")):
		get_node("Dialogue-3-radio").show()
	else:
		return
		
func _to_dialogue4() -> void:
	get_node("Dialogue-3-radio").hide()
	get_node("Mixkit-mouse-click-close-1113").play()
	if (get_node_or_null("Dialogue-4-radio")):
		get_node("Dialogue-4-radio").show()
	else:
		return
	
func _to_dialogue5() -> void:
	get_node("Dialogue-4-radio").hide()
	get_node("Mixkit-mouse-click-close-1113").play()
	if (get_node_or_null("Dialogue-5-radio")):
		get_node("Dialogue-5-radio").show()
	else:
		return
		
func _close_dialogue5() -> void:
	get_node("Dialogue-5-radio").hide()
	get_node("Mixkit-mouse-click-close-1113").play()

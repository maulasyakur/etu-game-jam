extends MenuButton

@onready var popup: PopupMenu = get_popup()

func _ready() -> void:
	popup.clear()

	popup.add_item("Back to Menu", 0)
	popup.add_check_item("Music On / Off", 1)

	var house_icon: Texture2D = preload("res://Complete_UI_Book_Styles_Pack_Free_v1.0/01_TravelBookLite/Sprites/UI_TravelBook_IconHome01a.png")
	popup.set_item_icon(0, house_icon)
	
	popup.id_pressed.connect(_on_item_pressed)

func _on_item_pressed(id: int) -> void:
	match id:
		0:
			get_tree().change_scene_to_file("res://main_menu.tscn")
		1:
			AudioServer.set_bus_mute(0, !AudioServer.is_bus_mute(0))

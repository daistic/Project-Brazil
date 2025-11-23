class_name HitZone

extends Panel

@onready var label: Label = $Label # Pastikan ada Label node sebagai child

@export var keyword: String
@export var font_resource: Font
@export var font_size: int = 24

func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	if data is ClueCard:
		if label.text != "": 
			return false 
			
		if keyword == data.clue:
			return true
		else:
			return false
	else:
		return false

func _drop_data(_at_position: Vector2, data: Variant) -> void:
	var card: ClueCard = data
	var clue: String = card.clue
	
	label.text = clue
	if font_resource:
		label.add_theme_font_override("font", font_resource)
	label.add_theme_font_size_override("font_size", font_size)

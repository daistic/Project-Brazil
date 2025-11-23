extends HFlowContainer

@export var drop_zone_scene: PackedScene
@export var placeholder_tag: String = "%DROP%"
@export_multiline var sentence: String = "Where were you last %DROP% ?"
@export var font_resource: Font
@export var font_size: int = 24

func _ready() -> void:
	build_sentence()

func build_sentence() -> void:
	var parts = sentence.split(placeholder_tag)
	
	for i in range(parts.size()):
		var text_part = parts[i]
		
		if text_part.length() > 0:
			var label = Label.new()
			label.text = text_part
			
			if font_resource:
				label.add_theme_font_override("font", font_resource)
			label.add_theme_font_size_override("font_size", font_size)
			
			add_child(label)
		
		if i < parts.size() - 1:
			var drop_zone: HitZone = drop_zone_scene.instantiate()
			drop_zone.font_resource = font_resource
			drop_zone.font_size = font_size
			add_child(drop_zone)
	
	print(parts)

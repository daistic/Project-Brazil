class_name ClueCard

extends MarginContainer

@onready var label: Label = $MarginContainer/Label

@export var clue: String

static var card_being_dragged: ClueCard = null

var preview_card: ClueCard

const NORMAL_SIZE: Vector2 = Vector2(1.0, 1.0)
const SCALE_SIZE: Vector2 = Vector2(1.25, 1.25)
const SCALE_TIME: float = 0.15

func _ready() -> void:
	label.text = clue
	_set_pivot()

func _input(event: InputEvent) -> void:
	if event.is_action_released("mouse click") and not visible:
		self.show()

func _get_drag_data(_at_position: Vector2) -> Variant:
	preview_card = self.duplicate()
	
	var preview = Control.new()
	preview.z_index = 1
	preview.add_child(preview_card)
	set_drag_preview(preview)
	
	card_being_dragged = self
	hide()
	
	return self

func _set_pivot() -> void:
	pivot_offset = size / 2

func _tween_scale_animation(is_mouse_entering: bool) -> void:
	var tween: Tween = create_tween()
	
	if is_mouse_entering:
		z_index += 1
		tween.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
		tween.tween_property(self, "scale", SCALE_SIZE, SCALE_TIME)
	else:
		z_index -= 1
		tween.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
		tween.tween_property(self, "scale", NORMAL_SIZE, SCALE_TIME)

func _on_mouse_entered() -> void:
	_tween_scale_animation(true)

func _on_mouse_exited() -> void:
	_tween_scale_animation(false)

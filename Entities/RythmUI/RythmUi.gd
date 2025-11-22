extends Control

@onready var text_box: NinePatchRect = $TextBox
@onready var line_label: RichTextLabel = $TextBox/MarginContainer/LineLabel
@onready var speaker_label: Label = $TextBox/SpeakerBox/MarginContainer/SpeakerLabel
@onready var typing_timer: Timer = $TextBox/TypingTimer

@export var dialogue: DialogueResource

var text: String = " "
var is_typing: bool
var line_index: int
var letter_index: int

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("advance dialogue"):
		_handle_line_events()

func _ready() -> void:
	_handle_line_events()

func _handle_line_events() -> void:
	if line_index >= dialogue.lines.size():
		return
	
	match dialogue.lines[line_index].line_event:
		DialogueStruct.EVENTS.NONE:
			_handle_text_area()
		DialogueStruct.EVENTS.RYTHM_ON:
			_play_rythm_mode()

func _handle_text_area() -> void:
	if is_typing == false:
		speaker_label.text = dialogue.lines[line_index].speaker_name
		_start_typing(dialogue.lines[line_index].text)
	else:
		_finish_typing()

func _start_typing(new_text: String) -> void:
	text_box.show()
	text = new_text
	line_label.text = ""
	letter_index = 0
	is_typing = true
	_type_text()

func _type_text() -> void:
	if text[letter_index] == "[":
		while (text[letter_index] != "]"):
			line_label.text += text[letter_index]
			letter_index += 1
	
	line_label.text += text[letter_index]
	letter_index += 1
	
	if letter_index >= text.length():
		_finish_typing()
	else:
		typing_timer.start()

func _finish_typing() -> void:
	text_box.show()
	line_label.text = text
	line_index += 1
	is_typing = false
	typing_timer.stop()

func _play_rythm_mode() -> void:
	text_box.hide()
	print("play rythm")

func _on_typing_timer_timeout() -> void:
	_type_text()

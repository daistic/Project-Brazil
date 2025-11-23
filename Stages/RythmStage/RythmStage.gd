class_name RythmStage

extends Node2D

@onready var dialogue_layer: CanvasLayer = $DialogueLayer
@onready var card_layer: CanvasLayer = $CardLayer

func _enter_tree() -> void:
	SignalHub.play_rythm.connect(_on_play_rythm)
	SignalHub.play_dialogue.connect(_on_play_dialogue)

func _on_play_rythm() -> void:
	dialogue_layer.hide()
	card_layer.show()

func _on_play_dialogue() -> void:
	dialogue_layer.show()
	card_layer.hide()

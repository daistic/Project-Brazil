extends Node

signal play_rythm
signal play_dialogue

func emit_play_rythm() -> void:
	play_rythm.emit()

func emit_play_dialogue() -> void:
	play_dialogue.emit()

class_name DialogueStruct

extends Resource

@export var speaker_name: String = ""
@export var text: String = ""
@export var line_event: EVENTS

enum EVENTS{
	NONE,
	RYTHM_ON,
	MOVE_TO_SHERLOCK,
	MOVE_TO_SUSPECT
}

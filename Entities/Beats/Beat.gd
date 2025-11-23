extends Area2D

@export var bpm: float = 100.0
@export var is_from_right: bool

var beat_speed: float
var is_moving: bool = false

const PIXELS_TO_MIDDLE: float = 200.0

func _ready() -> void:
	beat_speed = PIXELS_TO_MIDDLE / (60.0 / bpm)
	
	if is_from_right:
		beat_speed *= -1

func _physics_process(delta: float) -> void:
	if is_moving:
		position.x += beat_speed * delta

extends CharacterBody2D


const SPEED = 300.0
var posIni : Vector2
var dire = Vector2(-1,0)

func _ready() -> void:
	posIni = position

func _physics_process(delta: float) -> void:
	# Add the gravity.
	position += SPEED * delta * dire
	if(position <= posIni + Vector2(-400,0)):
		dire= Vector2(1,0)
	if(position >= posIni + Vector2(400,0)):
		dire= Vector2(-1,0)

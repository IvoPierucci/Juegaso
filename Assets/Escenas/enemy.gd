extends Area2D


const SPEED = 300.0
var posIni : Vector2
var dire = Vector2(-1,0)
@onready var sprite = $Sprite2D

func _ready() -> void:
	posIni = position

func _physics_process(delta: float) -> void:
	# Add the gravity.
	position += SPEED * delta * dire
	if(position <= posIni + Vector2(-200,0)):
		dire= Vector2(1,0)
	if(position >= posIni + Vector2(400,0)):
		dire= Vector2(-1,0)
		
	if (dire > Vector2(0,0)):
		sprite.flip_h = true # Mira a la izquierda
	elif (dire < Vector2(0,0)):
		sprite.flip_h = false # Mira a la derecha


func _on_body_entered(body: Node2D) -> void:
	var aux = body._return()
	if(!aux):
		dire*=(-1)

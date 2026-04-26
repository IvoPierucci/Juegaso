extends AnimatableBody2D

var speed = 100
var inicio : Vector2
var dir = Vector2(0,-1)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inicio = position
	print(position-inicio)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += speed*delta*dir
	print(dir)
	print(position)
	print(position-inicio)
	if(abs(position-inicio) >=  Vector2(0,50)):
		dir= Vector2(0,1)
	if(position-inicio >= Vector2(0,50)):
		dir= Vector2(0,-1)

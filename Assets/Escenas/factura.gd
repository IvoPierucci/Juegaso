extends Area2D

var speed = 20
var inicio : Vector2
var dir = Vector2(0,-1)
var fin : bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	inicio = position
	fin = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(!fin):
		position += speed * delta * dir
		if(position <= inicio + Vector2(0,-10)):
			dir= Vector2(0,1)
		if(position >= inicio + Vector2(0,10)):
			dir= Vector2(0,-1)


func _on_body_entered(body: Node2D) -> void:
	if(!fin):
		if(body._agarrar_medialuna()):
			self.visible=false
			fin=true

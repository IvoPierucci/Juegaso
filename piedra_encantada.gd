extends Area2D

@export var medialunas : int = 0
@onready var m1 = $Med1
@onready var m2 = $Med2
@onready var m3 = $Med3
@onready var plata = $plataformaCueva
var nom : String
# Called when the node enters the scene tree for the first time.

func _ready() -> void:
	nom=get_tree().current_scene.name
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	var aux = medialunas 
	medialunas += body._dejar_medialuna()
	if(medialunas > aux):
		body._set_checkpoint(position)
	if(medialunas>=1):
		m1.visible=true
	if(medialunas>=2):
		m2.visible=true
	if(medialunas>=3):
		m3.visible=true
		if(nom == "Level1"):
			get_tree().change_scene_to_file("res://Assets/Escenas/level_2.tscn")
		if(nom == "level2"):
			get_tree().change_scene_to_file("res://Assets/Escenas/level_3.tscn")
		if(nom == "level_3"):
			plata._Activate()
		

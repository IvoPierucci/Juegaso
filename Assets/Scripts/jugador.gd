extends CharacterBody2D


const SPEED = 1000.0
const JUMP_VELOCITY = -530.0
var inicio : Vector2
var medialunas : int
@onready var sprite = $Sprite2D

func _ready() -> void:
	inicio = position
	medialunas =0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


	move_and_slide()
	if velocity.x < 0:
		sprite.flip_h = true # Mira a la izquierda
	elif velocity.x > 0:
		sprite.flip_h = false # Mira a la derecha

func _return() -> bool:
	position = inicio
	return true
	
func _agarrar_medialuna() -> bool:
	medialunas +=1
	return true
	
func _dejar_medialuna() -> int:
	var aux = medialunas
	medialunas = 0
	return aux
	
func _set_checkpoint(a : Vector2) -> void:
	inicio=a

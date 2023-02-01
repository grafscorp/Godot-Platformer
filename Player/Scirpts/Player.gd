extends KinematicBody2D


export var speed :float = 10.0
export var jump :float = 20.0
export var gravity: float = 30.0

var vec : Vector2 = Vector2.ZERO

onready var sprite = $Sprite
onready var coll:CollisionShape2D = $Collision

func _process(delta)->void:
	vec.y += gravity*delta
	vec.x = Input.get_action_strength("d") - Input.get_action_strength("a")

	vec.x *=speed
	if vec.x < 0:
		sprite.flip_h = true
	elif vec.x > 0:
		sprite.flip_h = false
func _physics_process(delta)->void:
	#vec = move_and_slide_with_snap(vec*speed*delta, Vector2.UP,Vector2.ZERO,true)
	vec = move_and_slide(vec,Vector2.UP)
	if Input.is_action_just_pressed("space") and is_on_floor():
		vec.y -= jump
	#vec = vec.normalized()

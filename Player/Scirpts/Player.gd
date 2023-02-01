extends KinematicBody2D


export var speed :float = 10.0
export var jump :float = 20.0
export var gravity: float = 30.0

var vec : Vector2 = Vector2.ZERO

onready var sprite = $Sprite
onready var coll = $Collision

func _process(delta):
	vec.y += gravity
	vec.x = Input.get_action_strength("d") - Input.get_action_strength("a")
	if Input.is_action_just_pressed("space"):
		vec.y -= jump
	vec.x *=speed*delta
	sprite.flip_h = vec.x <0
func _physics_process(delta):
	#vec = move_and_slide_with_snap(vec*speed*delta, Vector2.UP,Vector2.ZERO,true)
	vec = move_and_slide(vec,Vector2.UP)
	vec = vec.normalized()

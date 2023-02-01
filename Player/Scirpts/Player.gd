extends KinematicBody2D

export var speed :float
export var jump :float
export var gravity: float 

var vec : Vector2 = Vector2.ZERO
var dir :Vector2 = Vector2.ZERO
onready var sprite = $Sprite
onready var coll:CollisionShape2D = $Collision

func _process(delta)->void:
	vec.x = Input.get_action_strength("d") - Input.get_action_strength("a")
	vec.x*= speed*delta
	test_vec()
	if Input.is_action_just_pressed("space") and (is_on_floor() or is_on_wall()) :
		vec.y -= jump
func _physics_process(delta)->void:
	vec.y += gravity*delta
	if is_on_wall() and !Input.is_action_pressed("space"):
		vec.y = 0
	vec = move_and_slide_with_snap(vec, Vector2.DOWN,Vector2.UP,true)#,1.57)
func test_vec():
	if vec.x < 0:
		sprite.flip_h = true
	elif vec.x > 0:
		sprite.flip_h = false


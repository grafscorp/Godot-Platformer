extends KinematicBody2D

class_name Enemy_basic

export var speed :float
export var maxSpeed :float
export var health :float
export var maxHealth :float

var vec : Vector2 = Vector2.ZERO
onready var vision = $EnemyRayCast
#var target: Player = null
var target: KinematicBody2D = null

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

func _physics_process(_delta: float) -> void:
	raycast_player()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func raycast_player():
	#print(target)
	if vision.is_colliding():
		#print(vision.get_collider())
		if vision.get_collider() is KinematicBody2D:
			target = vision.get_collider()
			follow_player()
			pass

func follow_player():
	print("hello")
	pass

func make_hit(damage:float):
	pass

func taken_damage(damage:float):
	health = damage - health
	if health <= 0:
		queue_free()


extends KinematicBody2D

class_name Enemy_basic

export var speed :float
export var maxSpeed :float
export var health :float
export var maxHealth :float

var vec : Vector2 = Vector2.ZERO
var target: Player = null
onready var forward_vision = $EnemyRayCastMid

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#TODO: behavior tree (ai)

func _physics_process(_delta: float) -> void:
	raycast()
	pass

func raycast():
	#print(target)
	#print(forward_vision.get_collider())
	if forward_vision.is_colliding():
		#print(forward_vision.get_collider())
		#print(target)
		if forward_vision.get_collider() is Player:
			target = forward_vision.get_collider()
			follow_player()
			#target = null
		elif forward_vision.get_collider() is TileMap:
			print('is wall or flor')
	#print(target)
	target = null

func follow_player():
	print("hello")
	pass

func make_hit(damage:float):
	pass

func taken_damage(damage:float):
	health = damage - health
	if health <= 0:
		queue_free()


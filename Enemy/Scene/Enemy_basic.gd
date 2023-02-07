extends KinematicBody2D

class_name Enemy_basic

export var speed :float
export var maxSpeed :float
export var health :float
export var maxHealth :float

onready var vision = $EnemyRayCast
<<<<<<< Updated upstream
=======
var target
>>>>>>> Stashed changes

var vec : Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.

<<<<<<< Updated upstream

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	#$Collision
	#$Aread2D
=======
func _process(delta):
>>>>>>> Stashed changes
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	raycast_player()
	
	

func raycast_player():
	#print(target)
	if vision.is_colliding():
		#print(vision.get_class())
		#print(vision.get_collider())
		target = vision.get_collider()
		#print(target)
		if global_position.x != target.global_position.x:
			print('test')
		if target != null:
			follow_player()
		#if vision.get_collider() is Player:
		#	target = vision.get_collider()
		#	print('test')		
	else:
		target = null

func follow_player():
	#print('hello')
	pass

func make_hit(damage:float):
	pass

func taken_damage(damage:float):
	health = damage - health
	if health <= 0:
		queue_free()

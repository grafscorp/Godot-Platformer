extends KinematicBody2D

class_name Enemy_basic

export var speed :float
export var maxSpeed :float
export var health :float
export var maxHealth :float

var vec : Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#$Collision
	#$Aread2D
	pass

func follow_player():
	pass

func make_hit(damage:float):
	pass

func taken_damage(damage:float):
	health = damage - health
	if health <= 0:
		queue_free()


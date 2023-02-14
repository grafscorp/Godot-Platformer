extends KinematicBody2D

class_name Enemy_basic

export var speed :float
export var maxSpeed :float
export var health :float
export var maxHealth :float

var vec : Vector2 = Vector2.ZERO
var ray_target: Player = null
onready var forward_vision = $EnemyRayCastMid

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(_delta: float) -> void:
	raycast()
	move_and_slide(Vector2(1,0), Vector2(0, -1))
	#vec: (0, 5). Vector2.DOWN: (0, 1). Vector2.UP: (0, -1)
	pass


func raycast():
	#print(ray_target)
	#print(forward_vision.get_collider())
	if forward_vision.is_colliding():
		#print(forward_vision.get_collider())
		#print(ray_target)
		if forward_vision.get_collider() is Player:
			ray_target = forward_vision.get_collider()
			follow_player()
			#ray_target = null
		elif forward_vision.get_collider() is TileMap:
			#print('is wall or floor')
			pass
	#print(ray_target)
	ray_target = null

#TODO: behavior tree (ai)

func movement():
	#sprite.flip_h = true
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


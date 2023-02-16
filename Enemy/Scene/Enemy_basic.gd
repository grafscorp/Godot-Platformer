extends KinematicBody2D

class_name Enemy_basic

export var speed: float
export var maxSpeed: float
export var jump: float
export var health: float
export var maxHealth: float

const gravity: float = 200.0

var vec: Vector2 = Vector2.ZERO
var ray_target: Player = null

onready var angular_vision_up = $EnemyRayCastUp
onready var forward_vision = $EnemyRayCastMid
onready var angular_vision_down = $EnemyRayCastDown
onready var floor_vision = $EnemyRayCastFloor

#func _init():

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	#print(.get_floor_angle(Vector2.UP))
	#print(.get_floor_normal())
	vec.x = 0
	#vec.x = speed
	vec.y += gravity*delta
	raycast()
	vec = move_and_slide_with_snap(vec, Vector2.DOWN, Vector2.UP, true)
	#vec = move_and_slide(vec, Vector2.UP)
	pass


func raycast():
	#print(ray_target)
	if forward_vision.is_colliding():
		#print(forward_vision.get_collider())
		if forward_vision.get_collider() is Player:
			ray_target = forward_vision.get_collider()
			follow_player()
		elif forward_vision.get_collider() is TileMap:
			#print('is wall or floor')
			pass
	#print(ray_target)
	ray_target = null

#TODO: behavior tree (ai)

func movement():
	#sprite.flip_h = true
	pass

func jump():
	if is_on_floor():
		vec.y-=jump
		print("jumping")
	pass

func follow_player():
	print("hello")
	jump()
	pass

func do_damage(damage: float):
	pass

func take_damage(damage: float):
	health = damage - health
	if health <= 0:
		queue_free()


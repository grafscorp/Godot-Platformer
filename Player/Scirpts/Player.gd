extends KinematicBody2D
class_name Player
#export
export var speed :float = 5000.0
export var jump :float = 200.0
export var MAXHEALTH = 100.0
export var MAXSTAMINA=100.0
export var health = 100.0
export var stamina:float = 100.0 
var attack_speed :float = 1.5
#const
const gravity: float = 300.0
const MAXSPEED : float = 5000.0
const stamina_jump :float= -10.0
const stamina_attack:float = -10.0
const stamina_block :float = -0.5
#varibles
var stamina:float = 100.0 
var vec :Vector2 = Vector2.ZERO
var isclimbing:bool = false
var attacking:bool = false
var danger_falling:bool=false
var updating_stamina:bool = false
var isblocking : bool = false
#nodes
onready var sprite:AnimatedSprite = $Sprite
onready var coll:CollisionShape2D = $Collision
onready var hud_health:TextureProgress = $HUD.health
onready var hud_stamina : TextureProgress= $HUD.stamina
onready var hud:Control = $HUD
onready var iswall :RayCast2D= $iswall
var timer :Timer 

enum STATE{
	IDLE,
	RUN,
	JUMP,
	DOWN,
	ROLL,
}

var player_state = STATE.IDLE

func _init():
	timer = Timer.new()
	add_child(timer)
	timer.connect("timeout",self,"timeout")
	
func _ready():
	Input.mouse_mode=Input.MOUSE_MODE_CAPTURED
func _process(delta)->void:
	vec.x =0
	if isclimbing:
		vec.y =0
	climb()
	move()
	jump()
		update_stamina(-0.3)
	if !attacking:
		climb()
		move()
		_jump()
		block()
	test_state()
	attack()
	vec.x*= speed*delta
	vec.y += gravity*delta
	anim()

func _physics_process(delta)->void:
	vec = move_and_slide_with_snap(vec, Vector2.DOWN,Vector2.UP,true)#,1.57)

func climb()->void:
	if !iswall.is_colliding():
		isclimbing = false
	if iswall.is_colliding() and Input.is_action_just_pressed("e"):
		isclimbing= true
func anim()->void:

	match player_state:
		STATE.IDLE:
			sprite.play("idle")
		STATE.RUN:
			sprite.play("run")
		STATE.JUMP:
			pass
		STATE.ROLL:
			pass


func move()->void:
	if Input.is_action_pressed("a"):
		vec.x -=1
		sprite.flip_h = true
		iswall.rotation_degrees = -90
	if Input.is_action_pressed("d"):
		sprite.flip_h = false
		iswall.rotation_degrees =  90
		vec.x+=1

func jump()->void:
	if !Input.is_action_just_pressed("space"):
		return 
	if is_on_floor():
		vec.y -= jump
	elif isclimbing:
		isclimbing=false
		vec.y-=jump
func test_state()->void:
	if vec.y < -1:
		player_state = STATE.JUMP
	elif vec.y>1:
		player_state = STATE.DOWN
	elif vec.x !=0:
		player_state = STATE.RUN
	else:
		player_state = STATE.IDLE


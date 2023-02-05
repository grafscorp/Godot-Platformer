extends KinematicBody2D

#export
export var speed :float
export var jump :float
export var MAXHEALTH = 100.0
export var health = 100.0
#const
const gravity: float = 300.0
const MAXSPEED : float = 5000.0
#varibles
var stamina:float = 100.0 
var vec :Vector2 = Vector2.ZERO
#nodes
onready var sprite:AnimatedSprite = $Sprite
onready var coll:CollisionShape2D = $Collision
onready var hud_health:TextureProgress = $HUD.health
onready var hud_stamina : TextureProgress= $HUD.stamina
onready var spritehummer = $Hammer

enum STATE{
	IDLE,
	RUN,
	JUMP,
	DOWN,
	ROLL,
	CLIMB
}

var player_state = STATE.IDLE

func _ready()->void:
	pass

func _process(delta)->void:
	move()
	#climb()
	test_state()
	
	anim()
	###TESTWALL
func _physics_process(delta)->void:
	vec.y += gravity*delta
	vec.x*= speed*delta
	vec = move_and_slide_with_snap(vec, Vector2.DOWN,Vector2.UP,true)#,1.57)

func anim()->void:
	if vec.x < 0:
		sprite.flip_h = true
		spritehummer.flip_h = true
	elif vec.x > 0:
		sprite.flip_h = false
		spritehummer.flip_h = false
	match player_state:
		STATE.IDLE:
			pass
		STATE.RUN:
			sprite.play("run")
		STATE.JUMP:
			pass
		STATE.ROLL:
			pass

func move()->void:
	vec.x = Input.get_action_strength("d") - Input.get_action_strength("a")
	if Input.is_action_just_pressed("space") and is_on_floor() :
		vec.y -= jump

func test_state()->void:
	if vec.y < -1:
		player_state = STATE.JUMP
	elif vec.y>1:
		player_state = STATE.DOWN
	elif vec.x !=0:
		player_state = STATE.RUN
	else:
		if player_state != STATE.CLIMB:
			player_state = STATE.IDLE

func climb()->void:
	if !is_on_floor() and Input.is_action_pressed("e") and is_on_wall():
		vec.y = 0
		player_state = STATE.CLIMB
		if Input.is_action_just_pressed("space"):
			vec.y -= jump

extends Node2D
onready var player= preload("res://Player/Scene/Player.tscn")
func _ready():
	pass
func _process(delta):
	if Input.is_action_just_pressed("r"):
		if get_tree().reload_current_scene() != OK:return
	elif Input.is_action_just_pressed("esc"):
		get_tree().quit()
	print(str(Engine.get_frames_per_second()))

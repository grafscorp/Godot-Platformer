extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("r"):
		if get_tree().reload_current_scene() != OK:return
	elif Input.is_action_just_pressed("esc"):
		get_tree().quit()

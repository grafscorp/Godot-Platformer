extends RayCast2D

var target: Enemy_basic = null

func _physics_process(_delta: float) -> void:
	if is_colliding():
		if get_collider() is Enemy_basic:
			target = get_collider()

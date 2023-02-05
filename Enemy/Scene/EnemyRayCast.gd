extends RayCast2D

var target: Enemy_basic = null

func _physics_process(_delta: float) -> void:
	if is_colliding():
		if get_collider() is Enemy_basic:
			target = get_collider()

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

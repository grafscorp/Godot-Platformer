extends RayCast2D

var target: Player = null

func _physics_process(_delta: float) -> void:
	if is_colliding():
		if get_collider() is Player:
			target = get_collider()

# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

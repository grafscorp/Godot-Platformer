extends Control

onready var stamina = $mainHUD/Stamina
onready var health = $mainHUD/Healt
onready var timer:Timer = $HideHUD
onready var mainHUD :CanvasLayer = $mainHUD

func _update(_health:float = health.value,_stamina:float = stamina.value):
	health.value = _health
	stamina.value = _stamina

func _update_max(_max_health:float = health.max_value,_max_stamina:float = stamina.max_value):
	health.max_value = _max_health
	stamina.max_value = _max_stamina
func _process(delta):
	health.value = get_parent().health
	stamina.value = get_parent().stamina

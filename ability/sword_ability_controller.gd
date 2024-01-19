extends Node

@export var sword_ability: PackedScene


func _ready() -> void:
	$Timer.timeout.connect(on_timer_timeout)


func _process(delta: float) -> void:
	pass


func on_timer_timeout() -> void:
	var player = get_tree().get_first_node_in_group("player") as Node2D
	if player == null:
		return
	
	var sword_instance = sword_ability.instantiate() as Node2D
	player.get_parent().add_child(sword_instance)
	sword_instance.global_position = player.global_position
extends CharacterBody2D

@export_range(0,200) var move_speed : float = 75


func _ready() -> void:
	$Area2D.area_entered.connect(on_area_entered)


func _process(delta: float) -> void:
	var direction = get_direction_to_player()
	velocity = direction * move_speed
	move_and_slide()


func get_direction_to_player():
	var player_node = get_tree().get_first_node_in_group("player") as Node2D
	if player_node != null:
		return (player_node.global_position - global_position).normalized()
	return Vector2.ZERO


func on_area_entered(other_area: Area2D):
	queue_free()
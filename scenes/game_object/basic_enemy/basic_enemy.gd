extends CharacterBody2D

@export_range(0,200) var move_speed : float = 75

@onready var visuals: Node2D = $Visuals
@onready var velocity_component: VelocityComponent = $VelocityComponent


func _process(_delta: float) -> void:
    velocity_component.accelerate_to_player()
    velocity_component.move(self)

    var move_sign = sign(velocity.x)
    if move_sign != 0:
        visuals.scale = Vector2(-move_sign, 1)

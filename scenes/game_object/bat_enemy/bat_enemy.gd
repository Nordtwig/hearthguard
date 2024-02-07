extends CharacterBody2D

@onready var velocity_component: VelocityComponent = $VelocityComponent
@onready var visuals: Node2D = $Visuals


func _ready() -> void:
    $HurtboxComponent.hit.connect(on_hit)


func _process(delta) -> void:
    velocity_component.accelerate_to_player()
    velocity_component.move(self)

    var move_sign = sign(velocity.x)
    if move_sign != 0:
        visuals.scale = Vector2(move_sign, 1)


func on_hit() -> void:
   $HitRandomAudioPlayerComponent.play_random()
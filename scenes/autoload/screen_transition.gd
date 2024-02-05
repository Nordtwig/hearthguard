extends CanvasLayer

signal transitioned_halfway


func _ready() -> void:
    $AnimationPlayer.play("out")


func transition() -> void:
    $AnimationPlayer.play("in")
    await transitioned_halfway
    $AnimationPlayer.play("out")


func emit_transitioned_halfway() -> void:
    transitioned_halfway.emit()
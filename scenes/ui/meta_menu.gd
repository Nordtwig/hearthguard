extends CanvasLayer

signal back_pressed

@export var upgrades: Array[MetaUpgrade] = []

var meta_upgrade_card_scene: PackedScene = preload("res://scenes/ui/meta_upgrade_card.tscn")

@onready var grid_container = $MarginContainer/HBoxContainer
@onready var back_button: Button = %BackButton


func _ready() -> void:
    for child in grid_container.get_children():
        child.queue_free()

    back_button.pressed.connect(on_back_pressed)
    
    for upgrade in upgrades:
        var meta_upgrade_card_instance = meta_upgrade_card_scene.instantiate()
        grid_container.add_child(meta_upgrade_card_instance)
        meta_upgrade_card_instance.set_meta_upgrade(upgrade)


func on_back_pressed() -> void:
    ScreenTransition.transition()
    await ScreenTransition.transitioned_halfway
    back_pressed.emit()

extends CanvasLayer

var options_scene = preload("res://scenes/ui/options_menu.tscn")


func _ready() -> void:
    %PlayButton.pressed.connect(on_play_pressed)
    %OptionsButton.pressed.connect(on_options_pressed)
    %QuitButton.pressed.connect(on_quit_pressed)


func on_play_pressed() -> void:
    ScreenTransition.transition()
    await ScreenTransition.transitioned_halfway
    get_tree().change_scene_to_file("res://scenes/main/main.tscn")


func on_options_pressed() -> void:
    ScreenTransition.transition()
    await ScreenTransition.transitioned_halfway
    var options_instance = options_scene.instantiate()
    add_child(options_instance)
    options_instance.back_pressed.connect(on_options_closed.bind(options_instance))


func on_options_closed(options_instance: Node) -> void:
    options_instance.queue_free()


func on_quit_pressed() -> void:
    get_tree().quit()

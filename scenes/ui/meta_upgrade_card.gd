extends PanelContainer

var upgrade: MetaUpgrade

@onready var name_label: Label = %NameLabel
@onready var description_label: Label = %DescriptionLabel
@onready var progress_bar: ProgressBar = %ProgressBar
@onready var upgrade_button: Button = %UpgradeButton
@onready var progress_label: Label = %ProgressLabel


func _ready() -> void:
    upgrade_button.pressed.connect(on_upgrade_pressed)


func set_meta_upgrade(upgrade: MetaUpgrade) -> void:
    self.upgrade = upgrade
    name_label.text = upgrade.title
    description_label.text = upgrade.description
    update_progress()


func update_progress() -> void:
    var currency = MetaProgression.save_data["meta_upgrade_currency"]
    var percent = currency / upgrade.experience_cost
    percent = min(percent, 1)
    progress_bar.value = percent
    upgrade_button.disabled = percent < 1
    progress_label.text = str(currency) + "/" + str(upgrade.experience_cost)


func on_upgrade_pressed() -> void:
    if upgrade == null:
        return
    MetaProgression.add_meta_upgrade(upgrade)
    MetaProgression.save_data["meta_upgrade_currency"] -= upgrade.experience_cost
    MetaProgression.save()
    get_tree().call_group("meta_upgrade_card", "update_progress")
    $AnimationPlayer.play("selected")


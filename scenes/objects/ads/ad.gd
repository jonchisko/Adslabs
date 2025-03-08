extends MarginContainer
class_name AdUi


signal ad_closed


@onready var title_label: Label = %TitleLabel
@onready var description_label: Label = %DescriptionLabel
@onready var close_button: Button = %CloseButton
@onready var animation_player: AnimationPlayer = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.modulate = Color.TRANSPARENT
	self.animation_player.play("in")
	

func _on_close_button_pressed() -> void:
	self.ad_closed.emit()
	self.animation_player.play("out")

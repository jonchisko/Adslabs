extends MarginContainer
class_name AdUi


signal ad_closed


@onready var title_label: Label = %TitleLabel
@onready var description_label: Label = %DescriptionLabel
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var _disabled: bool = false


func set_data(title: String, description: String) -> void:
	self.title_label.text = title
	self.description_label.text = description


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.modulate = Color.TRANSPARENT
	self.animation_player.play("in")
	

func _on_close_button_pressed() -> void:
	if self._disabled:
		return
	
	self._disabled = true
	self.ad_closed.emit()
	self.animation_player.play("out")

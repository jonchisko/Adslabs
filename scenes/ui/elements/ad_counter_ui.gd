extends CanvasLayer
class_name AdCounterUi


@onready var label: Label = $PanelContainer/Label


func set_ad_count(amount: int) -> void:
	self.label.text = str(amount)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.label.text = "0"

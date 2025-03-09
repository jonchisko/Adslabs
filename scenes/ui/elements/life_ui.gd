extends CanvasLayer
class_name LifeUi

var initial_life: int = 0

@onready var label: Label = %Label


func _ready() -> void:
	self.set_life(self.initial_life)
	

func set_life(value: int) -> void:
	self.label.text = str(value)

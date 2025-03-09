extends Node


var end_screen: PackedScene = preload("res://scenes/ui/end_screen.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameEvents.dead.connect(self._on_death)


func _on_death() -> void:
	print("EndScreenManager on death.")
	self.add_child(self.end_screen.instantiate())

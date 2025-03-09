extends Node


var pause_ui_scene: PackedScene = preload("res://scenes/ui/pause_menu.tscn")
var instantiated: Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if self.instantiated == null and Input.is_action_pressed("pause"):
		self.instantiated = self.pause_ui_scene.instantiate()
		self.add_child(self.instantiated)
		

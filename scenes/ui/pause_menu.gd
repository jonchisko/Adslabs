extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.get_tree().paused = true


func _on_audio_button_pressed() -> void:
	# continue
	self.get_tree().paused = false
	self.call_deferred("queue_free")


func _on_audio_button_2_pressed() -> void:
	# menu
	self.get_tree().paused = false
	SceneTransition.transition_to("res://scenes/levels/main_menu/main_menu.tscn")

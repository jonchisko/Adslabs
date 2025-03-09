extends MarginContainer


func _ready() -> void:
	self.get_tree().paused = true


func _on_audio_button_pressed() -> void:
	self.get_tree().paused = false
	SceneTransition.transition_to("res://scenes/levels/main_menu/main_menu.tscn")
	

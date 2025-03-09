extends MarginContainer

@export var optionsMenu: OptionsMenu


func _on_quit_button_pressed() -> void:
	self.get_tree().quit()


func _on_options_button_pressed() -> void:
	self.optionsMenu.open()


func _on_play_button_pressed() -> void:
	SceneTransition.transition_to("res://scenes/levels/game_levels/dummy_level.tscn")

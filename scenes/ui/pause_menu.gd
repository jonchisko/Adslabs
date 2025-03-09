extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.get_tree().paused = true


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		print("Pause screen freeing.")
		self.get_tree().paused = false
		self.visible = false
		await self.get_tree().create_timer(0.1).timeout
		self.queue_free()


func _on_audio_button_pressed() -> void:
	# continue
	print("Pause screen freeing.")
	self.get_tree().paused = false
	self.queue_free()


func _on_audio_button_2_pressed() -> void:
	# menu
	self.get_tree().paused = false
	SceneTransition.transition_to("res://scenes/levels/main_menu/main_menu.tscn")

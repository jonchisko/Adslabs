extends Node


func _on_timer_timeout() -> void:
	print("LEVEL UP!")
	GameEvents.leveled_up.emit()

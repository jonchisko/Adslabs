extends Area2D


func _on_area_entered(area: Area2D) -> void:
	if area == null:
		return
		
	print("LifeBody hit by ", area.get_parent().name)
	
	GameEvents.damaged.emit()

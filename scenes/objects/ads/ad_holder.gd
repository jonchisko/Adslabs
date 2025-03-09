extends Control
class_name AdHolder


signal ad_closed


var is_occupied: bool = false

	
func occupy_holder(ad: AdUi, bounds: Vector4, dynamic: bool, dynamic_duration: float):
	if self.is_occupied:
		return
	
	self.is_occupied = true
	
	self.add_child(ad)
	ad.ad_closed.connect(self._on_ad_closed)
	
	self._set_position_within_bounds(bounds)
	if dynamic:
		self._make_dynamic(bounds, dynamic_duration)

	
func _set_position_within_bounds(bounds: Vector4) -> void:
	self.global_position = self._get_random_point(bounds)
	

func _make_dynamic(bounds: Vector4, dynamic_duration: float):
	var number_of_points = randi_range(2, 5)
	
	var tween = self.get_tree().create_tween()
	
	for i in range(number_of_points):
		var random_location = self._get_random_point(bounds)
		tween.tween_property(self, "global_position", random_location, dynamic_duration).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
		
	tween.set_loops()


func _get_random_point(bounds: Vector4) -> Vector2:
	var random_x = randi_range(int(bounds.x), int(bounds.z))
	var random_y = randi_range(int(bounds.y), int(bounds.w))
	
	return Vector2(random_x, random_y)


func _on_ad_closed() -> void:
	self.is_occupied = false
	self.ad_closed.emit()

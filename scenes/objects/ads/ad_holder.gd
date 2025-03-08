extends Control
class_name AdHolder


signal ad_closed


var is_occupied: bool = false

	
func occupy_holder(ad: AdUi, dynamic: bool, dynamic_duration: int):
	if self.is_occupied:
		return
	
	self.is_occupied = true
	
	self.add_child(ad)
	ad.global_position = self.global_position
	ad.ad_closed.connect(self._on_ad_closed)
	
	self._set_position_within_bounds(ad)
	if dynamic:
		self._make_dynamic(ad, dynamic_duration)
	
	
func _set_position_within_bounds(ad: AdUi) -> void:
	self.global_position = self._get_random_point(ad)
	

func _make_dynamic(ad: AdUi, dynamic_duration: int):
	var number_of_points = randi_range(2, 5)
	
	var tween = self.get_tree().create_tween()
	
	for i in range(number_of_points):
		var random_location = self._get_random_point(ad)
		tween.tween_property(self, "global_position", random_location, dynamic_duration).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
		
	tween.set_loops()


func _get_random_point(ad: AdUi) -> Vector2:
	var area = self.get_viewport_rect().size
	var ad_dimensions = ad.get_rect().size
	
	var random_x = randi_range(0, int(area.x - ad_dimensions.x))
	var random_y = randi_range(15, int(area.y - ad_dimensions.y)) # 15 because AD is over the rect due to negative margins
	
	return Vector2(random_x, random_y)


func _on_ad_closed() -> void:
	self.is_occupied = false
	self.ad_closed.emit()

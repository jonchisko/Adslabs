extends CanvasLayer

@onready var timer: Timer = $Timer
@onready var ad_holder: AdHolder = $AdHolder

var ad: PackedScene = preload("res://scenes/objects/ads/ad.tscn")


func _on_timer_timeout() -> void:
	var instantiated_ad = self.ad.instantiate()
	self.ad_holder.occupy_holder(instantiated_ad, true, 0.5)
	

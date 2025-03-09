extends Node

@export var ad_counter_ui: AdCounterUi

var closed_ads: int = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameEvents.ad_closed.connect(self._on_ad_closed)


func _on_ad_closed() -> void:
	self.closed_ads += 1
	ad_counter_ui.set_ad_count(self.closed_ads)

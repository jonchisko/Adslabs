extends Node

@export var player: Turret

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameEvents.ad_opened.connect(self._on_ad_opened)
	GameEvents.ad_closed.connect(self._on_ad_closed)


func _on_ad_opened() -> void:
	self.player.movement_disabled = true
	
	
func _on_ad_closed() -> void:
	self.player.movement_disabled = false

extends Node

@export var life: int = 100
@export var life_ui: LifeUi


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.life_ui.initial_life = self.life
	GameEvents.damaged.connect(self._on_damaged)


func _on_damaged() -> void:
	self.life -= 1
	self.life_ui.set_life(self.life)
	
	if self.life <= 0:
		print("You died, emitting dead game event.")
		GameEvents.dead.emit()

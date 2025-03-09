extends Node2D

@onready var cooldown_timer: Timer = $CooldownTimer

var _bullet_scene: PackedScene = preload("res://scenes/objects/bullet/bullet.tscn")
var _on_cooldown: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not self._on_cooldown and Input.is_action_pressed("fire"):
		self._on_cooldown = true
		var instantiated_bullet = self._bullet_scene.instantiate()
		self.add_child(instantiated_bullet)
		
		self.cooldown_timer.start()


func _on_cooldown_timer_timeout() -> void:
	self._on_cooldown = false
	print("Weapon ready to fire.")

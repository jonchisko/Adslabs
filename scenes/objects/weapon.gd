extends Node2D

@export var fire_sounds: Array[AudioStream]

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var cooldown_timer: Timer = $CooldownTimer

var _bullet_scene: PackedScene = preload("res://scenes/objects/bullet/bullet.tscn")
var _on_cooldown: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not self._on_cooldown and Input.is_action_pressed("fire"):
		self._on_cooldown = true
		var instantiated_bullet = self._bullet_scene.instantiate()
		self.get_tree().root.add_child(instantiated_bullet)
		instantiated_bullet.global_position = self.global_position
		
		self.audio_stream_player_2d.stream = self.fire_sounds.pick_random()
		self.audio_stream_player_2d.pitch_scale = randf_range(0.5, 1.5)
		self.audio_stream_player_2d.play()
		
		self.cooldown_timer.start()


func _on_cooldown_timer_timeout() -> void:
	self._on_cooldown = false
	print("Weapon ready to fire.")

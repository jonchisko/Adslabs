extends CharacterBody2D
class_name Turret

var movement_disabled: bool = false

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

@export var SPEED = 15000.0
@onready var sprite_2d: Sprite2D = $Sprite2D
	
func _physics_process(delta):
	if self.movement_disabled:
		return
	
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		if not self.audio_stream_player_2d.playing:
			self.audio_stream_player_2d.pitch_scale = randf_range(0.5, 2)
			self.audio_stream_player_2d.play()
		
		velocity.x = direction * SPEED * delta
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * delta)
	
	if abs(velocity.x) <= 0.1 and self.audio_stream_player_2d.playing:
		self.audio_stream_player_2d.stop()
	
	var half_size = sprite_2d.get_rect().size.x/2
	var screen_width = self.get_viewport_rect().size.x
	global_position.x = clamp(global_position.x, 0 + half_size, screen_width - half_size)
	
	
	move_and_slide()

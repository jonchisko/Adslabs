extends Node2D
class_name Bullet

@export var speed: float = 40.0
@export var spell_sounds: Array[AudioStream]

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var hit_area: Area2D = $HitArea
@onready var sprite_2d: Sprite2D = $Sprite2D


func _move(delta: float) -> void:
	self.global_position += Vector2.UP * self.speed * delta


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.audio_stream_player_2d.stream = self.spell_sounds.pick_random()
	self.audio_stream_player_2d.pitch_scale = randf_range(1.0 - 0.2, 1.0 + 0.2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self._move(delta)
	

func _on_hit_area_area_entered(area: Area2D) -> void:
	if area == null:
		return
	
	$HitArea/CollisionShape2D.set_deferred("disabled", true)
	self.sprite_2d.visible = false
	
	self.audio_stream_player_2d.play()
	await self.audio_stream_player_2d.finished
	self.queue_free()


func _on_timer_timeout() -> void:
	self.queue_free()

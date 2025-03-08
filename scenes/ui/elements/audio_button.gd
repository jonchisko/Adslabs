extends Button


@export var audio_stream: AudioStream

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.audio_stream_player.stream = self.audio_stream
	
	
func _on_pressed() -> void:
	self.audio_stream_player.play()

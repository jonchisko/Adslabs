extends Node

@export var threshold_delta: float
@export var threshold_counter: int

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

var _time_start: float
var _counter: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GameEvents.ad_opened.connect(self._on_ad_opened)
	GameEvents.ad_closed.connect(self._on_ad_closed)


func _on_ad_opened() -> void:
	self._time_start = Time.get_ticks_msec()


func _on_ad_closed() -> void:
	var time_delta = (Time.get_ticks_msec() - self._time_start) / 1000
	print("Time delta: ", time_delta, " Counter: ", self._counter)
	
	if time_delta < self.threshold_delta:
		self._counter += 1
	else:
		self._counter = 0
	
	if self._counter >= self.threshold_counter and not self.audio_stream_player.playing:
		self.audio_stream_player.play()

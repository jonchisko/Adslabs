extends MarginContainer
class_name OptionsMenu


@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var master_volume: HSlider = %MasterVolume
@onready var sfx_volume: HSlider = %SfxVolume
@onready var music_volume: HSlider = %MusicVolume


func open() -> void:
	self._update_display()
	self.animation_player.play("in")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.visible = false
	self.modulate = Color.TRANSPARENT
	self._update_display()
	
	
func _close_menu() -> void:
	self.animation_player.play("out")


func _update_display() -> void:		
	self.master_volume.value = self._get_bus_volume_percent("Master")
	self.music_volume.value = self._get_bus_volume_percent("Music")
	self.sfx_volume.value = self._get_bus_volume_percent("SFX")


func _get_bus_volume_percent(bus: String):
	var bus_index = AudioServer.get_bus_index(bus)
	return db_to_linear(AudioServer.get_bus_volume_db(bus_index))
	
	
func _on_master_volume_value_changed(value: float) -> void:
	var bus_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))


func _on_sfx_volume_value_changed(value: float) -> void:
	var bus_index = AudioServer.get_bus_index("SFX")
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))


func _on_music_volume_value_changed(value: float) -> void:
	var bus_index = AudioServer.get_bus_index("Music")
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))


func _on_back_button_pressed() -> void:
	self._close_menu()

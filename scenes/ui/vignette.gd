extends CanvasLayer
class_name VignetteEffect

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func flash_vignette() -> void:
	if self.animation_player.is_playing():
		return
	self.animation_player.play("flash")

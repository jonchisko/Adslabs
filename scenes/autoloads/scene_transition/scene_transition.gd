extends Node


@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	$ColorRect.visible = false


func transition_to(scene_path: String) -> void:
	self.animation_player.play("transition")
	await self.animation_player.animation_finished
	self.get_tree().change_scene_to_file(scene_path)
	self.animation_player.play_backwards("transition")

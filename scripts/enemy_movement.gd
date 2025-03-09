extends CharacterBody2D


@export var SPEED = 100.0


func _ready() -> void:
	self.velocity.y = randf_range(100.0, 200.0)


func _physics_process(_delta):
	move_and_slide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area == null:
		return
		
	self.queue_free()

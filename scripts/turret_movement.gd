extends CharacterBody2D


@export var SPEED = 300.0
@onready var sprite_2d: Sprite2D = $Sprite2D
	
func _physics_process(delta):
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED * delta
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED * delta)
	
	var half_size = sprite_2d.get_rect().size.x/2
	var screen_width = self.get_viewport_rect().size.x
	global_position.x = clamp(global_position.x, 0 + half_size, screen_width - half_size)
	
	
	move_and_slide()

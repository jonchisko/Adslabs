extends CharacterBody2D


@export var SPEED = 100.0


func _physics_process(delta):
	velocity.y = SPEED
	move_and_slide()

func _on_body_entered(body):
	if body.is_in_group("walls"):
		queue_free()

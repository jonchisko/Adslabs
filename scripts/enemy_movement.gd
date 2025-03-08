extends CharacterBody2D


@export var SPEED = 300.0


func _physics_process(delta):
	velocity.y = SPEED
	move_and_slide()

func _on_body_entered(body):
	if body.is_in_group("the_walls"):
		queue_free()

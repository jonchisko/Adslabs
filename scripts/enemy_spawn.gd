extends Node2D

@export var enemy_scene: PackedScene
@export var spawn_interval: float = 2.0

var screen_width

func _ready():
	await get_tree().process_frame
	screen_width = get_window().size.x

	$SpawnTimer.wait_time = spawn_interval
	$SpawnTimer.start()

func _on_SpawnTimer_timeout():
	spawn_enemy()

func spawn_enemy():
	if enemy_scene:
		var enemy = enemy_scene.instantiate()
		var enemy_width = enemy.get_node("Sprite2D").texture.get_width() / 2
		var spawn_x = clamp(randi_range(0, screen_width), enemy_width, screen_width - enemy_width)

		enemy.position = Vector2(spawn_x, 0)
		get_tree().current_scene.add_child(enemy)
	else:
		print("Error: enemy_scene is not assigned!")

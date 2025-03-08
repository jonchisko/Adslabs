extends Area2D

@export var enemy_scene: PackedScene
@export var spawn_interval: float = 2.0

var screen_width

func _ready():
	screen_width = get_viewport_rect().size.x
	$SpawnTimer.wait_time = spawn_interval
	$SpawnTimer.start()

func _on_SpawnTimer_timeout():
	spawn_enemy()

func spawn_enemy():
	var enemy = enemy_scene.instantiate()
	enemy.position = Vector2(randi_range(0, screen_width), 0)
	get_parent().add_child(enemy)

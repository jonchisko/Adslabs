extends Node


@export var enemy_container: Node2D

@export var min_x_position = 0.0
@export var max_x_position = 1000.0

@export var spawn_time: float = 10.0
@export var spawn_number_min: int = 3
@export var spawn_number_max: int = 6

@onready var spawn_timer: Timer = $SpawnTimer

var enemy_scene: PackedScene = preload("res://scenes/objects/Enemy.tscn")

var _difficulty_increase = 0.1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.spawn_timer.wait_time = self.spawn_time
	GameEvents.leveled_up.connect(self._on_level_up)	


func _on_level_up() -> void:
	await self.spawn_timer.timeout
	
	self.spawn_time = max(0.5, self.spawn_time - self.spawn_time * self._difficulty_increase)
	self.spawn_number_min = min(10, ceil(self.spawn_number_min + self.spawn_number_min * self._difficulty_increase))
	self.spawn_number_max = min(20, ceil(self.spawn_number_max + self.spawn_number_max * self._difficulty_increase))
	
	self.spawn_timer.wait_time = self.spawn_time
	
	print("New difficulties: ", "Spawn: ", self.spawn_time, " SPNMn: ", self.spawn_number_min, " SPNMx: ", self.spawn_number_max)


func _on_spawn_timer_timeout() -> void:
	var number_to_spawn = randi_range(spawn_number_min, spawn_number_max)
	
	print("Spawning enemies: ", number_to_spawn)
	
	for i in range(number_to_spawn):
		var instantiated_enemy = enemy_scene.instantiate()
		self.enemy_container.add_child(instantiated_enemy)
		instantiated_enemy.global_position = Vector2(randi_range(self.min_x_position, self.max_x_position), 0.0)

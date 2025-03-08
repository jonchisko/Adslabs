extends Node

@export var ads_container: Control
@export var max_concurrent_ads: int = 10
@export var ads: Array[AdResource]

@onready var timer: Timer = $Timer

var _spawn_time: float = 1.5
var _weight_static: int = 10
var _weight_dynamic: int = 1

var _ad_holder: PackedScene = preload("res://scenes/objects/ads/ad_holder.tscn")
var _ad_holders: Array[AdHolder]

var _ad_scene: PackedScene = preload("res://scenes/objects/ads/ad.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.timer.wait_time = self._spawn_time
	self._create_ad_holders()
	
	GameEvents.leveled_up.connect(self._on_leveled_up)


func _on_ad_closed() -> void:
	GameEvents.ad_closed.emit()


func _on_timer_timeout() -> void:
	var ad_resource = self.ads[randi_range(0, self.ads.size() - 1)]
	var ad_instantiated = self._ad_scene.instantiate() as AdUi
	await get_tree().process_frame
	if self._find_free_ad_holder(ad_instantiated):
		ad_instantiated.set_data(ad_resource.Title, ad_resource.Description)
	

func _on_leveled_up() -> void:
	pass


func _create_ad_holders() -> void:
	self._ad_holders = []
	for i in range(self.max_concurrent_ads):
		var instantiated_ad_holder = self._ad_holder.instantiate() as AdHolder
		self.ads_container.add_child(instantiated_ad_holder)
		
		instantiated_ad_holder.ad_closed.connect(self._on_ad_closed)
		
		self._ad_holders.push_back(instantiated_ad_holder)
		
		
func _find_free_ad_holder(ad: AdUi) -> bool:
	for ad_holder in self._ad_holders:
		if not ad_holder.is_occupied:
			ad_holder.occupy_holder(ad, self._is_ad_dynamic(), randf_range(0.7, 3.0))
			return true
	return false


func _is_ad_dynamic() -> bool:
	var total_sum = self._weight_static + self._weight_dynamic
	var random_value = randi_range(0, total_sum)
	
	return self._weight_static < random_value

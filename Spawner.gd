extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var positions = PoolVector2Array()
var position_chooser = RandomNumberGenerator.new()
var speed_chooser = RandomNumberGenerator.new()

export var min_speed = 64
export var max_speed = 96
export var interval = 1.0
var elapsed = 0.0
onready var enemy : PackedScene = load("res://Scenes/Enemy.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	for child in self.get_children():
		positions.push_back(child.position)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	elapsed += delta
	if elapsed > interval:
		elapsed -= interval
		var new_enemy = enemy.instance()
		new_enemy.speed = speed_chooser.randf_range(min_speed, max_speed)
		new_enemy.position = positions[position_chooser.randi_range(0, positions.size() - 1)]
		$Enemies.add_child(new_enemy)
	pass

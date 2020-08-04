extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var lane_width = 32;
export var lane_extends = 1;
export var max_speed = 128;
export var accel_time = 0.1;

onready var current_lane = lane_extends + 1;
onready var center_lane = current_lane;
onready var lane_count = 2*lane_extends + 1;
onready var center_position = self.position;
onready var accel_distance = max_speed*accel_time/2.0;
onready var target_lane = current_lane;


var speed = 0;

func get_lane_position(lane : int) -> Vector2:
	var lane_position = center_position
	lane_position.x += (lane-center_lane)*lane_width;
	return lane_position;

func calculate_speed() -> float:
	var target_position = get_lane_position(target_lane);
	speed = max_speed;
	speed = min(speed, max_speed*position.distance_to(target_position)/accel_distance)
	if target_position.x < self.position.x:
		speed *= -1
	return speed;
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("player_left"):
		target_lane -= 1
	if Input.is_action_just_pressed("player_right"):
		target_lane += 1
	target_lane = clamp(target_lane, 1,lane_count);
	self.position.x += calculate_speed()*delta;
	
	
	

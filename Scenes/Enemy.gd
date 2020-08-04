extends Area2D

var speed : float = 64;
var is_moving = false;
const wait_time = 0.5;
var elapsed = 0;

func _draw():
	if not is_moving:
		draw_arc(Vector2.ZERO, 12, -PI/2, -PI/2 + 2*PI*(1 - elapsed/wait_time), 32, $Polygon2D.color, 2, true)

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if not is_moving:
		elapsed += delta;
		if elapsed > wait_time:
			is_moving = true
			elapsed = wait_time
		update();
	else:
		self.position.y += speed*delta


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.

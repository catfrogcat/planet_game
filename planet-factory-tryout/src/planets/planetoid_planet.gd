extends StaticBody2D


var speed = 0
var angular_speed = 0.3 * PI

var focus_planet = true
func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event == InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			focus_planet = true

func _process(delta):
	
	rotation += angular_speed * delta

	var velocity = Vector2.UP.rotated(rotation) * speed
	position += velocity * delta

extends StaticBody2D


signal focus_planet
func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			focus_planet.emit(self)



var rotation_speed = 0.6 * PI
func _process(delta):
	rotation += rotation_speed * delta
	constant_angular_velocity = rotation_speed

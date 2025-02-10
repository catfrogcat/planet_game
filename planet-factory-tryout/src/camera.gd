extends Camera2D

var focus_planet
var focus_orbit
var planet_rotation_speed = 0
var planet_position = Vector2(0,0)
var orbit_rotation_speed = 0

@onready var moon = get_node("/root/game/system-1/home-orbit/moon-planet")

func _ready() -> void:
	var home_planet = get_node("/root/game/system-1/home-planet")
	var moon_planet = get_node("/root/game/system-1/home-orbit/moon-planet")
	var home_orbit = get_node("/root/game/system-1/home-orbit")
	
	var planets = [home_planet, moon_planet]
	for x in planets:
		x.focus_planet.connect(_on_focus_planet)
	
	var orbits = [home_orbit]
	for x in orbits:
		x.focus_orbit.connect(_on_focus_orbit)



func _input(event):
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP and event.pressed:
			zoom += Vector2(0.1,0.1)
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN and event.pressed:
			zoom -= Vector2(0.1,0.1)

func _physics_process(delta: float) -> void:

	if focus_orbit is Node:
		if focus_orbit.get_child(0) == focus_planet:
			rotation += focus_orbit.rotation_speed * delta

	if focus_planet is Node:
		position = focus_planet.global_position
		rotation += focus_planet.rotation_speed * delta
		print(focus_planet)
		


	if Input.is_action_pressed("pan_camera_left"):
		rotation += 0.01 * PI
	if Input.is_action_pressed("pan_camera_right"):
		rotation += -0.01 * PI


func _on_focus_planet(planet) -> void:
	focus_planet = planet
	
func _on_focus_orbit(orbit) -> void:
	focus_orbit = orbit

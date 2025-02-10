extends Node2D

var rotation_speed = 0.1 * PI

func _ready() -> void:
	var moon_planet = get_node("/root/game/system-1/home-orbit/moon-planet")
	var planets = [moon_planet]
	for x in planets:
		x.focus_planet.connect(_on_focus_planet)

signal focus_orbit
func _on_focus_planet(planet) -> void:
		focus_orbit.emit(self)

func _process(delta):
	rotation += rotation_speed * delta

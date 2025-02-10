extends RigidBody2D

@onready var home_planet = get_node("/root/game/system-1/home-planet")
@onready var moon_planet = get_node("/root/game/system-1/home-orbit/moon-planet")
@onready var camera = get_node("/root/game/camera")


func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	gravity_scale = 0
	mass = 1
	self.add_constant_central_force(constant_force)
	
	var home_planet_pos = home_planet.global_position
	var home_planet_g = 20000 / global_position.distance_to(home_planet_pos)
	if home_planet_g <= 30:
		home_planet_g = 0
	var home_gravity_force = global_position.direction_to(home_planet_pos) * home_planet_g
	
	
	
	var moon_planet_pos = moon_planet.global_position
	var moon_planet_g = 8000 / global_position.distance_to(moon_planet_pos)
	if moon_planet_g <= 40:
		moon_planet_g = 0
	var moon_gravity_force = global_position.direction_to(moon_planet_pos) * moon_planet_g
	
	
	
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").rotated(camera.rotation)
	var velocity = 200
	constant_force = direction * velocity + home_gravity_force + moon_gravity_force
	
	

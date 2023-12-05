extends Marker2D

const RADIUS = 80

func _process(delta):
	var mouse_position = get_viewport().get_mouse_position()

	var player_position = get_parent().get_parent().global_transform.origin
	var distance = player_position.distance_to(mouse_position) 
	var mouse_direction = (mouse_position - player_position).normalized()
	
	self.global_transform.origin = player_position + (mouse_direction * RADIUS)
	
	if distance < 80:
		rotate(get_angle_to(mouse_position) + PI)
	else: 
		rotate(get_angle_to(mouse_position))



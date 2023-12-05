extends Marker2D

const RADIUS = 120

func _process(delta):
	var player = get_tree().get_first_node_in_group("Player")
	
	if player:
		var player_position = player.global_transform.origin
		var distance = get_parent().global_transform.origin .distance_to(player_position) 
		var player_direction = (get_parent().global_transform.origin - player_position).normalized() * -1
		
		self.global_transform.origin = get_parent().global_transform.origin  + (player_direction * RADIUS)

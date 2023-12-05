class_name Enemy extends Entity
var dying: bool = false

@export var Speed: int
@export var touch_damage: int

func _ready():
	$AnimatedSprite2D.play("idle")

func get_player_node():
	return get_tree().get_first_node_in_group("Player")

func move_towards_player(delta):
	var player = get_player_node()
	
	if player:
		var direction_vector = (position - player.position).normalized()
		$AnimatedSprite2D.play("run")
		$AnimatedSprite2D.flip_h = direction_vector.x < 0
		position += direction_vector * Speed * delta * -1

class_name Cleave extends Ability

@export var DAMAGE = 10
@export var direction: String
@export var direction_vector: Vector2
var SPEED = 550

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	rotate(get_angle_to(get_viewport().get_mouse_position()) + PI)

func _process(delta):
	$CollisionShape2D/Sprite2D.flip_h = direction == "right"
	var vector_direction = Vector2.LEFT if direction == "left" else Vector2.RIGHT
	
	position += direction_vector * SPEED * delta * -1

func _on_body_entered(body):
	queue_free()

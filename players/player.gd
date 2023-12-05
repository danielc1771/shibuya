class_name Player extends Entity

@export var speed = 100
@export var attack_cursor: PackedScene
@export var ability_1: PackedScene
@export var health_component: HealthComponent
signal player_health_updated(new_health)

var last_direction: Vector2

func _ready():
	_spawn_attack_cursor()
	$AnimatedSprite2D.play("front_idle")
	
func _input(event):
	if event.is_action_pressed("click_1"):
		_use_ability_one()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):

	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	if input_direction != Vector2.ZERO:
		last_direction = input_direction
		

	update_animation(input_direction)
	
	velocity = input_direction.normalized() * speed
	
	move_and_slide()
	
func update_animation(current_direction: Vector2):
	if current_direction == Vector2.ZERO:
		_set_animation("idle", last_direction)
	else:
		_set_animation("run", current_direction)
		
func _set_animation(type: String, direction: Vector2):
	if $AnimatedSprite2D.animation != "hurt" or !$AnimatedSprite2D.is_playing():
		if direction.x != 0: 
			$AnimatedSprite2D.play("side_" + type)
			$AnimatedSprite2D.set_flip_h(direction.x > 0)
		elif direction.y > 0:
			$AnimatedSprite2D.play("front_" + type)
		elif direction.y < 0:
			$AnimatedSprite2D.play("back_" + type)
		
func _spawn_attack_cursor():
	var cursor = attack_cursor.instantiate()
	add_child(cursor)

func _use_ability_one():
	var ability = ability_1.instantiate()
	ability.position = $AttackCursor.get_marker_position()
	ability.direction_vector = (self.position - $AttackCursor.get_marker_position()).normalized()
	get_tree().current_scene.add_child(ability)

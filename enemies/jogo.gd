extends Enemy

@export var ability: PackedScene
var attack_ready: bool = true
var ability_instance
var attacking: bool = false


func _physics_process(delta):
	var player = get_player_node()
	
	if player and not dying:
		var distance_player_to_player = position.distance_to(player.position)
		
		if attack_ready and distance_player_to_player < 300:
			_attack()
		elif !attacking and $AnimatedSprite2D.animation != "cleave_death":
			move_towards_player(delta)
			
	if dying and ability_instance != null:
		remove_child(ability_instance)
	

func _on_hitbox_area_entered(area):
	if area is Ability:
		dying = true
		$AnimatedSprite2D.play("cleave_death")

func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation == "cleave_death":
		queue_free()
	attacking = false
	$AnimatedSprite2D.play("idle")
	$AttackCooldown.start()

func _attack():
	attacking = true
	attack_ready = false

	$AnimatedSprite2D.play("attack")
	ability_instance = ability.instantiate()
	ability_instance.spawn_marker = $Marker
	
	add_child(ability_instance)


func _on_attack_cooldown_timeout():
	attack_ready = true

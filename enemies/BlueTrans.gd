extends Enemy

func _physics_process(delta):
	if !dying:
		move_towards_player(delta)


func _on_hitbox_area_entered(area):
	if area is Ability and not area is EnemyAbility:
		dying = true
		$AnimatedSprite2D.play("sliced")
		

func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation == "sliced":
		queue_free()

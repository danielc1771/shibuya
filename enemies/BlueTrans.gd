extends Enemy

func _physics_process(delta):
	if !dying:
		move_towards_player(delta)

func take_damage(amount: int):
	dying = true
	$AnimatedSprite2D.play("sliced")

func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation == "sliced":
		queue_free()

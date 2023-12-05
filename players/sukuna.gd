extends Player

var can_take_damage: bool = true

func take_damage(amount: int):
	if not can_take_damage:
		return

	health_component.receive_damage(amount)
	can_take_damage = false

	if $AnimatedSprite2D.is_playing():
		$AnimatedSprite2D.stop()
	$AnimatedSprite2D.play("hurt")
	
func _on_health_component_died():
	queue_free()

func _on_animated_sprite_2d_animation_finished():
	if $AnimatedSprite2D.animation == "hurt":
		can_take_damage = true

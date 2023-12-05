extends Player

var can_take_damage: bool = true

	
func _on_hitbox_body_entered(body):
	if body is Enemy and !body.dying and can_take_damage:
		health_component.receive_damage(body.touch_damage)
		can_take_damage = false


func _on_health_component_received_damage():
	if $AnimatedSprite2D.is_playing():
		$AnimatedSprite2D.stop()

	$AnimatedSprite2D.play("hurt")

func _on_health_component_died():
	queue_free()
	

func _on_animated_sprite_2d_animation_finished():
	can_take_damage = true


func _on_hitbox_area_entered(area):
	if area is EnemyAbility and can_take_damage:
		health_component.receive_damage(area.damage)
		can_take_damage = false

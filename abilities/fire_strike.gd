extends EnemyAbility

var spawn_marker: Marker2D
var damage = 10

func _ready():
	$Marker2D/AnimatedSprite2D.play("default")
	$ChargeTimer.start()
	update_position()


func _on_charge_timer_timeout():
	$CollisionShape2D.disabled = false
	$Marker2D/AnimatedSprite2D.play("active")


func _on_track_timer_timeout():
	if $Marker2D/AnimatedSprite2D.animation == "default":
		update_position()

func update_position():
	if $Marker2D/AnimatedSprite2D.animation == "default":
		var player = get_tree().get_first_node_in_group("Player")
		if player:
			rotate(get_angle_to(player.global_position))
			global_position = spawn_marker.global_transform.origin


func _on_animated_sprite_2d_animation_finished():
	if $Marker2D/AnimatedSprite2D.animation == "active":
		queue_free()

class_name EnemyHurtbox extends HurtBox

func _on_area_entered(hitbox: Hitbox):
	if hitbox == null or hitbox.owner == owner or hitbox is EnemyHitbox:
		return
	
	if owner.has_method("take_damage"):
		owner.take_damage(hitbox.damage)

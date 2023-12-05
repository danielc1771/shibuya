extends Node

@export var player: Player


func _on_health_component_received_damage(damage, new_health):
	var health = 0 if new_health < 0 else new_health
	var health_image = "res://art/ui/health_bar/health_bar_" + str(health) + ".png";
	$TextureRect.texture = load(health_image)

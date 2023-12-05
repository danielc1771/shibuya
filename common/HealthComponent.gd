class_name HealthComponent extends Node

@export var health: int
signal received_damage(damage, new_health)
signal died

func _process(delta):
	if health <= 0:
		died.emit()

func receive_damage(damage):
	self.health -= damage 
	received_damage.emit(damage, self.health)

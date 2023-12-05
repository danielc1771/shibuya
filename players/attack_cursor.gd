class_name AttackCursor extends Node2D

var distance_from_player = 10

var time = 0.0

func get_marker_position():
	return $Marker2D.global_position

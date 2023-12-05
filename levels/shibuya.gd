extends Node

@export var mob_scene: PackedScene
@export var green_trans_sceme: PackedScene

const MAX_MOBS = 6
var mobs_alive = 0

func _process(delta):
	if mobs_alive < MAX_MOBS and $MobSpawnTimer.is_stopped():
		$MobSpawnTimer.start()


func _on_mob_spawn_timer_timeout():
	var mob = mob_scene.instantiate() if randf() > 0.5 else green_trans_sceme.instantiate()
	$MobSpawnPath/MobSpawnLocation.progress_ratio = randf()
	
	var direction = $MobSpawnPath/MobSpawnLocation.rotation + PI / 2
	
	mob.position = $MobSpawnPath/MobSpawnLocation.position
	
	add_child(mob)
	mobs_alive += 1


func _on_child_exiting_tree(node):
	if node is Enemy:
		mobs_alive -= 1

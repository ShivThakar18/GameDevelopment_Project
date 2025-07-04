extends Node2D

@onready var player = $Player
@onready var spawn_points = $SpawnPoints

func _ready():
	var spawn = spawn_points.get_node_or_null(SceneManager.next_spawn_id)
	
	if spawn:
		player.global_position = spawn.global_position
	else:
		print("No Spawn Point Found For:",SceneManager.next_spawn_id)

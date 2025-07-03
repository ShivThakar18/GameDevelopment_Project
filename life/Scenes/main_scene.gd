extends Node2D

func _ready():
	var player = $Player  # adjust path if needed
	var spawn_point = $Classroom_SpawnPoint
	player.global_position = spawn_point.global_position

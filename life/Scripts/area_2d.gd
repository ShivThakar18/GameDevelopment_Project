extends Area2D

@export var target_room: String  # assign in the editor
@export var spawn_id: String
var player_in_area = false 

func _on_body_entered(body):
	if body.name == "Player":
		player_in_area = true
	
	if player_in_area:
		GameState.next_spawn_id = spawn_id
		get_tree().change_scene_to_file("res://Scenes/"+target_room+".tscn")
	
func _on_body_exited(body):
	if body.name == "Player":
		player_in_area = false
		
#func _process(delta):
#	if player_in_area:
#		GameState.next_spawn_id = spawn_id
#		get_tree().change_scene_to_file("res://Scenes/"+target_room+".tscn")

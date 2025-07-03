extends Area2D

@export var target_room: String  # assign in the editor
var player_in_area = false 

func _on_body_entered(body):
	if body.name == "Player":
		player_in_area = true
		
func _on_body_exited(body):
	if body.name == "Player":
		player_in_area = false
		
func _process(delta):
	if player_in_area and Input.is_action_just_pressed("interact"):
		get_tree().change_scene_to_file("res://Scenes/"+target_room+".tscn")

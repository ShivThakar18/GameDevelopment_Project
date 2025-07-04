extends Area2D

@export var target_scene: String
@export var target_spawn_id: String

func _on_body_entered(body):
	if body.name == "Player":
		SceneManager.load_scene(target_scene,target_spawn_id)

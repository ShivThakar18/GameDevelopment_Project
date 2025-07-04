extends Node

var next_spawn_id: String = "default"

func load_scene(scene_path:String, spawn_id: String = "default"):
	next_spawn_id = spawn_id
	
	var new_scene = load(scene_path).instantiate()
	get_tree().root.call_deferred("add_child",new_scene)
	
	# remove old scene (excluding SceneManager)
	for child in get_tree().root.get_children():
		if child != new_scene and child != self:
			child.queue_free()

extends CharacterBody2D

@export var walk_speed: float = 200.0
@export var run_speed: float = 350.0

var player_animatedSprite: AnimatedSprite2D
var last_dir: String = "front"
var last_speed: String = "walk"

var player_in_area = false

@export var target_scene: String
@export var target_spawn_id: String

func _input(event):
	if event is InputEventKey and event.pressed:
		print("Key Pressed: ", event.as_text())

func _ready() -> void:
	player_animatedSprite = $Player_AnimatedSprite2D
	if player_animatedSprite == null:
		push_error("Cannot find AnimatedSprite2D! Check the node name.")
		
func _physics_process(delta: float) -> void:
	var dir = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		dir.x += 1
	if Input.is_action_pressed("ui_left"):
		
		dir.x -= 1
	if Input.is_action_pressed("ui_up"):
		dir.y -= 1
	if Input.is_action_pressed("ui_down"):
		dir.y += 1
	
	var current_speed = walk_speed
	if Input.is_action_pressed("run"):
		current_speed = run_speed
		last_speed = "run"
	else:
		last_speed = "walk"
	
	if dir != Vector2.ZERO:
		dir = dir.normalized()
		velocity = dir * current_speed
		move_and_slide()
		
		if abs(dir.x) > abs(dir.y):
			if dir.x > 0:
				player_animatedSprite.play("player_right_"+last_speed)
				last_dir = "right"
			else:
				player_animatedSprite.play("player_left_"+last_speed)
				last_dir = "left"
		else:
			if dir.y > 0:
				player_animatedSprite.play("player_down_"+last_speed)
				last_dir = "front"
			else:
				player_animatedSprite.play("player_up_"+last_speed)
				last_dir = "back"
	else:
		velocity = Vector2.ZERO
		move_and_slide()
		player_animatedSprite.play("player_idle_"+last_dir)


func _on_door_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = true


func _on_door_classroom_1_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_in_area = true

func _process(delta: float) -> void:
	if player_in_area and Input.is_action_just_pressed("interact"):
		SceneManager.load_scene(target_scene,target_spawn_id)

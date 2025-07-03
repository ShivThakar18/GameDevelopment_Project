extends CharacterBody2D

@export var speed: float = 200.0
var player_animatedSprite: AnimatedSprite2D
var last_dir: String = "front"

func _ready() -> void:
	player_animatedSprite = $Player_AnimatedSprite2D
	if player_animatedSprite == null:
		push_error("❌ Cannot find AnimatedSprite2D! Check the node name.")
	

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
	
	if dir != Vector2.ZERO:
		dir = dir.normalized()
		velocity = dir * speed
		move_and_slide()
		
		if abs(dir.x) > abs(dir.y):
			if dir.x > 0:
				player_animatedSprite.play("player_right_walk")
				last_dir = "right"
			else:
				player_animatedSprite.play("player_left_walk")
				last_dir = "left"
		else:
			if dir.y > 0:
				player_animatedSprite.play("player_down_walk")
				last_dir = "front"
			else:
				player_animatedSprite.play("player_up_walk")
				last_dir = "back"
	else:
		velocity = Vector2.ZERO
		move_and_slide()
		player_animatedSprite.play("player_idle_"+last_dir)

	

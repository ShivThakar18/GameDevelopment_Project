extends CharacterBody2D

@export var walk_speed: float = 30
@onready var npc: AnimatedSprite2D = $AnimatedSprite2D

var directions = ["left","right"]
var current = 0
	
func _process(delta):
	var dir = Vector2.ZERO
	var time = Time.get_ticks_msec()
	var index = int(time / 2000) % 2 # change direction every 2 seconds

	if index != current:
		current = index
		$AnimatedSprite2D.play("walk_" + directions[current])
		
	if directions[current] == "right":
		dir.x += 1
	else:
		dir.x -= 1
	velocity = dir.normalized() * walk_speed
	move_and_slide()

extends CharacterBody2D

@onready var npc: AnimatedSprite2D = $AnimatedSprite2D
var directions = ["front","back","left","right"]
var current = 0
	
func _process(delta):
	var time = Time.get_ticks_msec()
	var index = int(time / 2000) % 4  # change direction every 2 seconds

	if index != current:
		current = index
		$AnimatedSprite2D.play("idle_" + directions[current])

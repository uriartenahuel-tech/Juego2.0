extends Node

@export var animation: AnimatedSprite2D
@export var walk_state: Node

func enter():
	animation.play("idle")

func physics_update(_delta):
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		state_machine.change_state(walk_state)

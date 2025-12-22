extends Node

@export var animation: AnimatedSprite2D
@export var idle_state: Node

func enter():
	animation.play("walk")

func physics_update(_delta):
	if not (Input.is_action_pressed("left") or Input.is_action_pressed("right")):
		state_machine.change_state(idle_state)

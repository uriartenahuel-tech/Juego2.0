extends Node

@export var initial_state: Node
var current_state: Node
var state_machine

func _ready():
	current_state = initial_state
	current_state.state_machine = self
	current_state.enter()

func _physics_process(delta):
	current_state.physics_update(delta)

func change_state(new_state: Node):
	current_state.exit()
	current_state = new_state
	current_state.state_machine = self
	current_state.enter()

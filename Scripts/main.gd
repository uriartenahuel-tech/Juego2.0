extends Node2D
@onready var anim: AnimatedSprite2D = $ParallaxBackground/ParallaxLayer/Bg1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	anim.play("default")
	pass # Replace with function body.

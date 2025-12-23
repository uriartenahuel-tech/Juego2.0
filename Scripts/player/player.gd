extends CharacterBody2D

class_name Player

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@export var speed := 200.0
@export var jump_velocity := -400.0
@export var air_control := 0.3

		
func _physics_process(_delta):
	var input := Input.get_axis("left", "right")
	update_facing(input)
	# Gravedad
	if not is_on_floor():
		velocity += get_gravity() * _delta

	# Salto con ESPACIO
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	# Movimiento horizontal
	if is_on_floor():
		velocity.x = input * speed
	else:
		velocity.x = move_toward(
			velocity.x,
			input * speed,
			speed * air_control
		)

	move_and_slide()


func update_facing(direction: float) -> void:
	if direction > 0:
		anim.flip_h = false
	elif direction < 0:
		anim.flip_h = true

func play_animation(anim_name: String) -> void:
	if anim.animation != anim_name or !anim.is_playing():
		anim.play(anim_name)
		
func current_animation() -> String:
	return anim.animation

func is_animation_finished() -> bool:
	return anim.frame == anim.sprite_frames.get_frame_count(anim.animation) - 1 

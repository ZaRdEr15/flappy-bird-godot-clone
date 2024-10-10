extends CharacterBody2D

const JUMP_VELOCITY: int = -400.0
const ROTATION_UPPER_LIMIT: int = -30
const ROTATION_LOWER_LIMIT: int = 45
const ROTATION_PER_JUMP: int = 30
const ROTATION_DECREASE_VELOCITY: int = 30


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	#apply_gravity(delta)
	tilt_nose_down()
	handle_input()
	move_and_slide()


func apply_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta


func handle_input() -> void:
	if Input.is_action_just_pressed("jump"):
		#velocity.y = JUMP_VELOCITY
		if rotation_degrees >= ROTATION_UPPER_LIMIT:
			rotation_degrees -= ROTATION_PER_JUMP


func tilt_nose_down() -> void:
	if rad_to_deg(rotation) <= ROTATION_LOWER_LIMIT:
		rotation = lerp_angle(rotation, \
				deg_to_rad(rotation_degrees + ROTATION_DECREASE_VELOCITY), 0.1)

extends CharacterBody2D

const JUMP_VELOCITY: int = -400.0
const ROTATION_UPPER_LIMIT: int = -30
const ROTATION_LOWER_LIMIT: int = 45
const ROTATION_PER_JUMP: int = 30

var hit: bool = false

@onready var START_POS: Vector2i = position


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	apply_gravity(delta)
	if not hit:
		tilt_nose()
		handle_input()
	move_and_slide()


func apply_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta


func handle_input() -> void:
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY


func tilt_nose() -> void:
	set_rotation(deg_to_rad(velocity.y * 0.06))


func reset() -> void:
	set_rotation(0)
	set_position(START_POS)


func _on_collision_detection_area_entered(_area):
	hit = true

extends CharacterBody2D


signal bird_hit


const JUMP_VELOCITY: int = -300.0
const TILT: float = 0.1


var hit: bool = false
var game_started: bool = false


@onready var START_POS: Vector2i = position


# Get the gravity from the project settings to be synced with CharacterBody2D nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		game_started = true
	if game_started:
		apply_gravity(delta)
		if not hit:
			handle_input()
		tilt_nose()
		move_and_slide()


func apply_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta


func handle_input() -> void:
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
		$JumpSound.play()
	if Input.is_action_just_pressed("reset"): # For debug purpose only
		reset()


func tilt_nose() -> void:
	if not hit:
		set_rotation_degrees(clampf(velocity.y * TILT, -35, 90))
	else:
		rotation = lerp_angle(rotation, deg_to_rad(90.0), TILT)


func reset() -> void:
	hit = false
	$AnimatedTexture.play()
	set_rotation(0)
	set_position(START_POS)


func _on_collision_detection_area_entered(_area):
	if not hit:
		hit = true
		$HitSound.play()
		$DeathTimer.start()
		emit_signal("bird_hit")
		$AnimatedTexture.pause()
		$AnimatedTexture.set_frame(1)


func _on_death_timer_timeout() -> void:
	$DeathSound.play()

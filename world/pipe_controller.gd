extends Node


const RESET_POS = Vector2i(430, 0)
const V_DISTANCE_BETWEEN_PIPES: int = 435
const POINT_POS: int = 100


@onready var bottom_pipe = preload("res://pipes/pipe_bottom.tscn").instantiate()
@onready var upper_pipe = preload("res://pipes/pipe_upper.tscn").instantiate()


var game_started: bool = false
var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rng.randomize()
		
	
func spawn_pipes() -> void:
	bottom_pipe.set_global_position(RESET_POS)
	upper_pipe.set_global_position(RESET_POS)
	var bottom_pipe_y = rng.randi_range(300, 550)
	bottom_pipe.global_position.y = bottom_pipe_y
	upper_pipe.global_position.y = bottom_pipe_y - V_DISTANCE_BETWEEN_PIPES
	add_child(bottom_pipe)
	add_child(upper_pipe)

func _on_bird_hit():
	for pipe in get_children():
		pipe.bird_hit = true
		pipe.get_node("CollisionShape").set_deferred("disabled", true)
	
	
func _on_start_game():
	game_started = true
	spawn_pipes()

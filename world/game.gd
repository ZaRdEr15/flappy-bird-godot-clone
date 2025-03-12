extends Node2D


signal start_game


@onready var bird = $Bird
@onready var floor_tile = $Floor
@onready var pipes = $PipeController
@onready var ui = $CanvasLayer/UI


var game_started: bool = false


func _ready() -> void:
	bird.bird_hit.connect(floor_tile._on_bird_hit)
	bird.bird_hit.connect(pipes._on_bird_hit)
	connect("start_game", bird._on_start_game)
	connect("start_game", pipes._on_start_game)
	connect("start_game", ui._on_start_game)


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("jump") and not game_started:	
		game_started = true
		emit_signal("start_game")

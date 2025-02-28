extends Node2D


@onready var bird = $Bird
@onready var floor = $Floor
@onready var bottom_pipe = preload("res://pipes/pipe_bottom.tscn").instantiate()


var place_once: bool = true


func _ready() -> void:
	bird.bird_hit.connect(floor._on_bird_hit)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if not bird.hit:
		if bird.game_started:
			move_pipes()
		
	
func move_pipes() -> void:
	if place_once:
		add_child(bottom_pipe)
		place_once = false

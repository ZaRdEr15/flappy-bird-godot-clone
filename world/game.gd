extends Node2D

const SCROLL_SPEED: int = 100 # Unusued currently
const RESET_VAL: int = -145
const RESET_POS = Vector2i(431, 256)

@onready var bird = $Bird
@onready var bottom_pipe = preload("res://pipes/pipe_bottom.tscn").instantiate()
@onready var background_list: Array[Node] = [$BackgroundTexture, $BackgroundTexture2]

var place_once: bool = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if not bird.hit:
		move_background()
		if bird.game_started:
			move_pipes()
		
		
func move_background() -> void:
	for background in background_list:
		if background.position.x == RESET_VAL:
			background.set_position(RESET_POS)
		background.position.x -= 1
	
func move_pipes() -> void:
	if place_once:
		add_child(bottom_pipe)
		place_once = false

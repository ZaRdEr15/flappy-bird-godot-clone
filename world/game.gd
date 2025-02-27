extends Node2D

const SCROLL_SPEED: int = 100
const RESET_VAL: int = -145

@onready var bird = $Bird
@onready var reset_pos: Vector2i = $BackgroundTexture2.position
@onready var background_list: Array[Node] = [$BackgroundTexture, $BackgroundTexture2]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if not bird.hit:
		move_background()
		
		
func move_background() -> void:
	for background in background_list:
		background.position.x -= 1
		if background.position.x == RESET_VAL:
			background.set_position(reset_pos)
			background.position.x -= 1
	

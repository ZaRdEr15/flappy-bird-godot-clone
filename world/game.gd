extends Node2D

const SCROLL_SPEED: int = 100
const RESET_VAL: int = -288

@onready var reset_pos: Vector2i = $BackgroundTexture2.position
@onready var background_list: Array[Node] = [$BackgroundTexture, $BackgroundTexture2]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not $Bird.hit:
		move_background(background_list, delta)
		reset_scroll(background_list)


func move_background(backgrounds: Array[Node], delta: float) -> void:
	for background in backgrounds:
		background.position.x -= SCROLL_SPEED * delta
	
	
func reset_scroll(backgrounds: Array[Node]) -> void:
	for background in backgrounds:
		if background.position.x <= RESET_VAL:
			background.position = reset_pos

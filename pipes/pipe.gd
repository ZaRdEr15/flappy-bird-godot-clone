extends StaticBody2D


var bird_hit: bool = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if not bird_hit:
		position.x -= 1

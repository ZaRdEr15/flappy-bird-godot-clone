extends StaticBody2D


const RESET_VAL: int = -336
const RESET_POS: int = 336


@onready var texture_list: Array[Node] = [$Texture, $Texture2]


var bird_hit: bool = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if not bird_hit:
		move_texture()


func move_texture() -> void:
	for texture in texture_list:
		if texture.position.x == RESET_VAL:
			texture.position.x = RESET_POS
		texture.position.x -= 1
		
		
func _on_bird_hit() -> void:
	bird_hit = true

extends StaticBody2D

const RESET_POS = Vector2i(430, 0)


var rng = RandomNumberGenerator.new()


var bird_hit: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_global_position(RESET_POS)
	rng.randomize()
	global_position.y = rng.randi_range(300, 500)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if not bird_hit:
		position.x -= 1


func _on_collision_detection_area_entered(area: Area2D) -> void:
	$CollisionShape.set_deferred("disabled", true)
	bird_hit = true

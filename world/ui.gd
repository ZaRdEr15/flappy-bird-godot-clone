extends Control


@onready var start_screen = $StartScreen


var game_started: bool = false
var opacity: float = 1.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if game_started:
		opacity = lerp(opacity, 0.0, 0.15)
		start_screen.self_modulate = Color(1, 1, 1, opacity)
	
	
func _on_start_game() -> void:
	game_started = true

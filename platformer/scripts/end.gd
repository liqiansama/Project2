extends Node2D

func _ready() -> void:
	Game.stop_timer()
	$txtCoins.text = str(Game.coins_collected)

func _process(delta: float) -> void:
	var elapsed = Game.elapsed_time
	var minutes = int(elapsed) / 60
	var seconds = int(elapsed) % 60
	$txtTime.text = "%02d:%02d" % [minutes, seconds]

func _on_retry_pressed() -> void:
	get_tree().change_scene_to_file("res://platformer/tcsn/p_level_1.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()

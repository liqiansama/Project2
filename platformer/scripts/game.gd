extends Node

var keys = 0
var coins_collected = 0
signal coin_collected

var elapsed_time: float = 0.0
var timing_active: bool = true  

func _process(delta: float) -> void:
	if timing_active:
		elapsed_time += delta

func collect_coin():
	coins_collected += 1
	coin_collected.emit()
	
func collect_key():
	keys += 1
	
func use_key():
	if keys > 0:
		keys -= 1

func stop_timer():
	timing_active = false

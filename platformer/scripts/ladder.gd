extends Area2D

signal player_entered
signal player_exited

func _ready() -> void:
	connect("body_entered", Callable(self, "_on_body_entered"))
	connect("body_exited", Callable(self, "_on_body_exited"))


func _process(delta: float) -> void:
	pass

func _on_body_entered(body):
	print("entered: ", body.name)
	emit_signal("player_entered", body)

func _on_body_exited(body):
	emit_signal("player_exited", body)

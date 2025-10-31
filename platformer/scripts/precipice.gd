extends Area2D
@onready var teleport_target: Marker2D = get_tree().current_scene.get_node("precipices")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.global_position = teleport_target.global_position

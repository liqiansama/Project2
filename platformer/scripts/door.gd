extends Area2D

@export var scene_to_load : String
@export var keys_needed = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if Game.keys >= keys_needed:
		Game.use_key()
		$AudioStreamPlayer.play()
		get_tree().change_scene_to_file(scene_to_load)
	pass # Replace with function body.

extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const CLIMB_SPEED = 150.0
var on_ladder = false

func _physics_process(delta: float) -> void:
	var input_velocity = Vector2.ZERO
	if on_ladder:
		input_velocity.y = 0
		if Input.is_action_pressed("up"):
			input_velocity.y = -CLIMB_SPEED
		elif Input.is_action_pressed("down"):
			input_velocity.y = CLIMB_SPEED
		
		if Input.is_action_pressed("left"):
			input_velocity.x = -SPEED / 2
		elif Input.is_action_pressed("right"):
			input_velocity.x = SPEED / 2

		velocity = input_velocity 
	else:
		if not is_on_floor():
			velocity += get_gravity() * delta

		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			$jump.play()
			velocity.y = JUMP_VELOCITY

		var direction := Input.get_axis("left", "right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true

	$Animator.speed = velocity.length()
	$Animator.on_ground = is_on_floor()

	move_and_slide()


func _on_ladder_body_entered(body: Node2D) -> void:
	on_ladder = true
	velocity = Vector2.ZERO 


func _on_ladder_body_exited(body: Node2D) -> void:
	on_ladder = false 

func _on_ladder_2_body_entered(body: Node2D) -> void:
	on_ladder = true
	velocity = Vector2.ZERO


func _on_ladder_2_body_exited(body: Node2D) -> void:
	on_ladder = false

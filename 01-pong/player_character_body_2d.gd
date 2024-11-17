extends CharacterBody2D

const speed = 400

func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO
	
	# Esto basicamente quiere decir si estamos presionando una accion
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
		
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
		
	velocity = direction * speed
	move_and_slide()

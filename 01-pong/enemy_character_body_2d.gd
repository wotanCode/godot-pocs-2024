extends CharacterBody2D

const SPEED = 300.0
var ball

func _ready() -> void:
	# Verifica que el nodo "Ball" existe
	ball = get_parent().get_node_or_null("Ball")

func _physics_process(delta: float) -> void:
	if ball == null:
		return  # Evita continuar si 'Ball' no fue encontrado
		
	var direction = Vector2(0, _get_direction())
	
	# Aplica la velocidad basada en la dirección
	velocity = direction * SPEED
	move_and_slide()

func _get_direction() -> int:
	# Verifica nuevamente que ball no sea null antes de usarlo
	if ball and abs(ball.global_position.y - global_position.y) > 25:
		if ball.global_position.y > global_position.y:
			return 1
		else:
			return -1
	else:
		return 0

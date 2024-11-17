extends CharacterBody2D

class_name Ball

var SPEED = 0
var direction = Vector2.ZERO
var is_moving = false
var timer


func _ready() -> void:
	randomize()
	reset_ball()

	
func reset_ball():
	# Volvemos a iniciar el timer
	timer = get_parent().get_node_or_null("RestartTimer")
	
	timer.stop()
	
		# Establecemos una velocidad inicial aleatoria
	SPEED = 600
	direction.x = [-1, 1][randi() % 2]
	direction.y = [-0.8, 0.8][randi() % 2]
	is_moving = true

func _physics_process(delta: float) -> void:
	if is_moving:
		# move_and_collide regresa un CollisionInfo o null si no hubo colisión
		var collision = move_and_collide(direction * SPEED * delta)
		
		if collision:
			#Aquí definimos que choca
			$AudioCollision.play()
			
			# Rebotamos cambiando la dirección según la normal de colisión
			direction = direction.bounce(collision.get_normal())


func _on_restart_timer_timeout() -> void:
	reset_ball()

extends Node2D

var PlayerScore = 0
var EnemyScore = 0

func _ready() -> void:
	_restart_game()

# Called when the node enters the scene tree for the first time.
func _restart_game() -> void:
	$Ball.is_moving = false
	$Ball.direction = Vector2.ZERO
	$Ball.position = Vector2(960, 540)
	#$Ball.reset_ball()
	$RestartTimer.start()

# Esta funcion esta pensada para procesar interfaz
func _process(delta: float) -> void:
	$MarcadorPlayer.text = str(PlayerScore)
	$MarcadoEnemigo.text = str(EnemyScore)


func _on_area_2_darco_izquierdo_body_entered(body: Node2D) -> void:
	if body is Ball:
		_restart_game()
		EnemyScore +=1


func _on_area_2_darco_izquierdo_2_body_entered(body: Node2D) -> void:
	if body is Ball:
		PlayerScore +=1
		_restart_game()

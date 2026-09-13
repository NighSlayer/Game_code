extends CharacterBody2D

@export var speed = 100.0
@onready var nav_agent = $NavigationAgent2D
var player: Node2D # Сюда нужно передать ссылку на игрока

func _ready():
	# Для примера ищем игрока по группе, не забудь добавить игрока в группу "player"
	player = get_node("../CharacterBody2D")

func _physics_process(delta):
	if player == null: 
		return

	# Говорим агенту текущую цель
	nav_agent.target_position = player.global_position

	# Если путь еще не построен или мы уже дошли до конца, ждем
	if nav_agent.is_navigation_finished():
		return

	# Получаем следующую точку на маршруте
	var next_position = nav_agent.get_next_path_position()
	
	# Считаем направление и двигаемся
	velocity = (next_position - global_position).normalized() * speed
	move_and_slide()

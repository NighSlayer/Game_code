extends Node2D

var velocity_enemy
var velocity

func update_pictures():
	#$Womb.set_texture(load(Globaldata.all_slaves[0].img.img_pussy_in))
	#$Boobs.set_texture(load(Globaldata.all_slaves[0].img.img_boobs))
	#$Vagina2.set_texture(load(Globaldata.all_slaves[0].int_anatomy_pussy_to_picture()))
	#$Character.set_texture(load(Globaldata.all_slaves[0].img.img_full))
	pass

func _ready():
	Globaldata.all_slaves.append(class_slave.new())
	$AnimationPlayer.play("Variations of vagina")
	$CharacterBody2D2/AnimationPlayer.play("Enemy_move")
	update_pictures()
	
	#$CharacterBody2D2.process_mode = Node.PROCESS_MODE_DISABLED

var speed = 300

func get_input():
	var input_dir = Input.get_vector("Клавиша A", "Клавиша D", "Клавиша W", "Клавиша S")
	velocity = input_dir * speed
	if Input.is_action_pressed("Ускорение"):
		velocity = input_dir * speed * 2

func get_enemy():
	var input_dir_enemy = $CharacterBody2D.get_global_position()-$CharacterBody2D2.get_global_position()
	velocity_enemy = input_dir_enemy.normalized() * speed / 2
	if Input.is_action_pressed("Ускорение"):
		velocity_enemy = input_dir_enemy * speed * 2


func _process(delta: float) -> void:
	get_input()
	get_enemy()
	$CharacterBody2D.move_and_collide(velocity * delta)
	$CharacterBody2D2.move_and_collide(velocity_enemy * delta)
	

func _on_button_pressed():
	#print(Globaldata.all_slaves[0].anatomy.vagina)
	#print(Globaldata.all_slaves[0].clothes.toy)
	#Globaldata.all_slaves[0].generate_parametrs()
	if Globaldata.all_slaves[0].clothes.toy < 5:
		Globaldata.all_slaves[0].clothes.toy += 1
	else:
		Globaldata.all_slaves[0].clothes.toy = 0
		if (
				Globaldata.all_slaves[0].anatomy.vagina != 22 and 
				Globaldata.all_slaves[0].anatomy.vagina != 23 and 
				Globaldata.all_slaves[0].anatomy.vagina != 24
		):
			Globaldata.all_slaves[0].anatomy.vagina += 3
		else:
			Globaldata.all_slaves[0].anatomy.vagina = 1
	update_pictures()




func _on_area_2d_body_entered(body: Node2D) -> void:
	$StaticBody2D/Quest.set_visible(true)
	pass # Replace with function body.


func _on_area_2d_body_exited(body: Node2D) -> void:
	$StaticBody2D/Quest.set_visible(false)
	pass # Replace with function body.

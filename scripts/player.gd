extends CharacterBody2D

@export var speed = 250
@export var rotation_speed = 5
@export var gravity = 630
var enemy_inattack_range = false
var enemy = null
var enemy_attack_cooldown = true
var health_bar = 100
var attack_ip = false


#импорт настроек персонажа
@onready var pl = $player


var rotation_direction = 0

#ввод градусов поворота
func get_input():
	rotation_direction = Input.get_axis("p_left", "p_right")


func _physics_process(delta):
	get_input()
	enemy_attack()
	
	#если не на земле может летать
	if not is_on_floor():
		rotation += rotation_direction * rotation_speed * delta

		#гравитация
		velocity.y += gravity * delta

	#если на земле включается обычное перемещение с прыжком
	if is_on_floor():
		#становится прямо
		rotation = 0
		#перемещение
		if Input.is_action_pressed("p_right"):
			velocity.x = speed
		elif Input.is_action_pressed("p_left"):
			velocity.x = -speed
		else:
			velocity.x = 0

	#полет
	if Input.is_action_pressed("p_up"):
			velocity = transform.y * -speed

	#поворот взависимости от направления движения
	if velocity.x < 0:
		pl.flip_h = true
	elif velocity.x > 0:
		pl.flip_h = false
	
	#если здоровье истрачено, вызывается функция отвечающая за смерть персонажа
	if health_bar <= 0:
		position.x = 161
		position.y = 433
		death()
	
	move_and_slide()


#смерть
func death():
	health_bar = 0
	set_physics_process(false) #остановка физического процесса
	get_tree().reload_current_scene() #перезапуск текущей сцены
	get_tree().change_scene_to_file("res://scenes/death_wish.tscn") #переход на сцену смерти


func attack():
	pass


func _on_player_hitbox_body_entered(body):
	if body.has_method("bullet"): #если у обьекта вошедшего в область есть функция bullet
		enemy_inattack_range = true #то он может атаковать


func _on_player_hitbox_body_exited(body):
	if body.has_method("bullet"): #если у обьекта вышедшего из области есть функция bullet
		enemy_inattack_range = false #то он не может атаковать


func enemy_attack():
	#если бот может аттаковать и прошёл кулдаун
	if enemy_inattack_range and enemy_attack_cooldown:
		health_bar -= 20 #здоровье уменьшается на 20
		enemy_attack_cooldown = false #время кулдауна включается
		$attack_cooldown.start()
		print(health_bar)


#таймер кулдауна
func _on_attack_cooldown_timeout():
	enemy_attack_cooldown = true

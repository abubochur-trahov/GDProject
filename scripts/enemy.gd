extends CharacterBody2D


@export var speed = 50
@export var gravity = 630
@onready var pid = $poprigunchik
#игрок в области(bool)
var player_chase = false
var player = null
var health = 100
var player_inattack_range = false


func _physics_process(delta):
	deal_with_damage()
	#гравитация
	if not is_on_floor():
		velocity.y += gravity * delta
	
	#если игрок в области
	if player_chase:
		position += (player.position - position) / speed #преследование игрока
		pid.play('walk') #анимация ходьбы
		
		#поворот бота в зависимости от направления
		if (player.position.x - position.x) < 0:
			pid.flip_h = true
		else:
			pid.flip_h = false
	else:
		pid.play('idle') #если игрок не в области, то проигравается анимация статичного положения

	move_and_slide()

#вход в область отслеживания
func _on_detection_area_body_entered(body):
	player = body
	player_chase = true

#выход из области отслеживания
func _on_detection_area_body_exited(_body):
	player = null
	player_chase = false


func bullet():
	pass


func _on_pid_hitbox_body_entered(body):
	if body.has_method("attack"):
		player_inattack_range = true


func _on_pid_hitbox_body_exited(body):
	if body.has_method("attack"):
		player_inattack_range = false


func deal_with_damage():
	if player_inattack_range:
		health -= 20
		print("enemys health =", health)
		if health <= 0:
			self.queue_free()

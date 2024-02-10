extends Node2D

var room = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.hall_exit:
		$Player.position.x = 939
		$Player.position.y = 304
<<<<<<< HEAD


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
=======
		Global.hall_exit = false
	if Global.up_exit:
		$Player.position.x = 554
		$Player.position.y = -335
		Global.up_exit = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
>>>>>>> f6bd53b (lot of changes)
	pass


func _on_main_room_body_entered(_body):
	if _body.has_method('player'):
		Global.exit_pos = true
		room = 0
		$transition.transition()


func _on_right_hall_body_entered(_body):
	if _body.has_method('player'):
<<<<<<< HEAD
		Global.exit_pos = true
=======
		Global.hall_exit = true
>>>>>>> f6bd53b (lot of changes)
		room = 1
		$transition.transition()


<<<<<<< HEAD
#func _on_upside_body_entered(_body):
#	pass
#	if _body.has_method('player'):
#		get_tree().change_scene_to_file("res://scenes/hall.tscn")
=======
func _on_upside_body_entered(_body):
	if _body.has_method('player'):
		Global.up_exit = true
		room = 2
		$transition.transition()
>>>>>>> f6bd53b (lot of changes)


func _on_transition_transitioned():
	if room == 0:
		get_tree().change_scene_to_file("res://scenes/main.tscn")
	elif room == 1:
		get_tree().change_scene_to_file("res://scenes/right_zone.tscn")
<<<<<<< HEAD
=======
	elif room == 2:
		get_tree().change_scene_to_file("res://scenes/up_turcia.tscn")
>>>>>>> f6bd53b (lot of changes)

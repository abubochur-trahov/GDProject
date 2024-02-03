extends Node2D

var room = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_main_room_body_entered(_body):
	if _body.has_method('player'):
		Global.exit_pos = true
		room = 0
		$transition.transition()


func _on_right_hall_body_entered(_body):
	if _body.has_method('player'):
		Global.exit_pos = true
		room = 1
		$transition.transition()


#func _on_upside_body_entered(_body):
#	pass
#	if _body.has_method('player'):
#		get_tree().change_scene_to_file("res://scenes/hall.tscn")


func _on_transition_transitioned():
	if room == 0:
		get_tree().change_scene_to_file("res://scenes/main.tscn")
	elif room == 1:
		get_tree().change_scene_to_file("res://scenes/right_zone.tscn")

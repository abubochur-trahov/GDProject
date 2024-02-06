extends Node2D

var c = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass




func _on_hall_body_entered(body):
	if body.has_method('player'):
		Global.hall_exit = true
		$transition.transition()


func _on_transition_transitioned():
	get_tree().change_scene_to_file("res://scenes/hall.tscn")


func _on_upal_v_pvpshku_body_entered(body):
	if body.has_method('player') and c == 0:
		$pvpshnica.queue_free()
		c = 1

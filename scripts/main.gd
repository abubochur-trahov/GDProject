extends Node2D

const scene2 = preload("res://scenes/hall.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.exit_pos:
		$player.position.x = 762
		$player.position.y = -12


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.has_method('player'):
		Global.exit_pos = true
		$transition.transition()


func _on_transition_transitioned():
	get_tree().change_scene_to_file("res://scenes/hall.tscn")

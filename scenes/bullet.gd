extends CharacterBody2D

var speed = 20
var player = null
var enemy = null

func _ready():
	position = enemy.position



func _on_area_2d_body_entered(body):
	if body.has_method('player'):
		body.health -= 20


func _on_area_2d_2_body_entered(body):
	position += (player.position - position) / speed 
	if body.has_method('player'):
		player = body
	if body.has_method('enemy'):
		enemy = body

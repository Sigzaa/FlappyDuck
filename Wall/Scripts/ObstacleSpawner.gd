extends Node2D

onready var timer = $Timer
var Obstacle = preload("res://Scenes/Obstacle.tscn")

func _ready():
	randomize()

func _on_Timer_timeout():
	spawn_obstacle()

func spawn_obstacle():
	var obstacle = Obstacle.instance()
	add_child(obstacle)
	obstacle.position.x = 1100
	obstacle.position.y = randi()%200 - randi()%200
	
func start():
	timer.start()
	
func stop():
	timer.stop()

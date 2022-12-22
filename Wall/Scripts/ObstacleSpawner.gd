extends Node2D

onready var timer = $Timer
var Obstacle = preload("res://Scenes/Obstacle.tscn")

# Another node in the scene can be exported as a NodePath.
export(NodePath) var duck_path
# Do take note that the node itself isn't being exported -
# there is one more step to call the true node:
onready var duck = get_node(duck_path)

export var speed = 200

var is_moving = false

func _ready():
	randomize()

func _on_Timer_timeout():
	if is_moving:
		spawn_obstacle()

func spawn_obstacle():
	var obstacle = Obstacle.instance()
	add_child(obstacle)
	obstacle.position.x = 1100
	obstacle.position.y = randi()%200 - randi()%200


func despawn_all():
	for child in get_tree().get_nodes_in_group("tube"):
		child.queue_free()

func _physics_process(delta):
	
	for child in get_tree().get_nodes_in_group("coll"):
		
		if is_moving:
			
			child.position.x -= speed * delta
		
		if child.global_position.x <= -200:
			
			child.queue_free()
	

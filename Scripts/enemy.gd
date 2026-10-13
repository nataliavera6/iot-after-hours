class_name Enemy
extends CharacterBody2D

@export var speed : float = 100.0
@export var detect_range : int = 200
@export var stop_distance: float = 10.0

var player

func _ready() -> void:
	player = get_tree().current_scene.get_node_or_null("Player")
	
func _physics_process(delta: float) -> void:
	if not player:
		print("Player not found")
		return
	# distance between the player and the enemy
	var distance = global_position.distance_to(player.global_position)
	
	# if the enemy can follow the player
	if (distance < detect_range) and (distance > stop_distance):
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * speed
	# if not
	else:
		velocity = Vector2.ZERO
	move_and_slide()

func die():
	queue_free()

#Area is the player
func _on_area_2d_area_entered(area: Area2D) -> void:
	#make sure its the player
	if area.collision_layer == 1:
		#for now just a print
		print("Player got hit")

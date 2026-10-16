class_name Enemy
extends CharacterBody2D

var speed : float = 50.0
var detect_range : int = 2000
var stop_distance: float = 10.0

var player

func _ready() -> void:
	player = get_tree().current_scene.get_node_or_null("Player")
	if not player:
		print("Player not found")
	
func _physics_process(delta: float) -> void:
	if not player:

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
	if area.is_in_group("player") and area.get_parent().name == "Player":
		print("Player got hit")
		get_tree().change_scene_to_file.call_deferred("res://Scenes/LoseScreen.tscn")

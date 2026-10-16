extends CharacterBody2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var lookingUp=false

# Called every physics frame.
func _physics_process(_delta: float) -> void:
	var direction = Vector2.ZERO # Where the player wants to move.
	if Input.is_action_pressed("right"):
		$AnimatedSprite2D.play("walkR")
		direction.x += 1
		lookingUp=false
	if Input.is_action_pressed("left"):
		$AnimatedSprite2D.play("walkL")
		direction.x -= 1
		lookingUp=false
	if Input.is_action_pressed("down"):
		$AnimatedSprite2D.play("walkdown")
		direction.y += 1
		lookingUp=false
	if Input.is_action_pressed("up"):
		$AnimatedSprite2D.play("walkup")
		direction.y -= 1
		lookingUp=true

	if direction.length() > 0:
		velocity = direction.normalized() * speed
	else:
		velocity = Vector2.ZERO
		$AnimatedSprite2D.play("idleUp" if lookingUp else "idle")

	#move and stop at walls
	move_and_slide()


		
	



		
		


#func _on_area_2d_body_entered(body: Node2D) -> void:
	#if body.get_parent().is_in_group("enemy_group"):
			#print("monster in")
			#get_tree().change_scene_to_file("res://Scenes/LoseScreen.tscn")

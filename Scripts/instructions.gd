extends Area2D

var can_interact = false
@onready var sprite: = $TextureRect


func _on_body_entered(body: Node2D) -> void:
	#make sure its the player
	if body.name == "Player":
		can_interact = true
		$E_sprite.show()

func _on_body_exited(body: Node2D) -> void:
	#make sure its the player
	if body.name == "Player":
		if sprite.visible:
			sprite.visible = false
		can_interact = false
		$E_sprite.hide()
		
func _input(event: InputEvent) -> void:
	if can_interact:
		if can_interact and event.is_action_pressed("interact"):
			if not sprite.visible:
				sprite.visible = true
			else:
				sprite.visible = false

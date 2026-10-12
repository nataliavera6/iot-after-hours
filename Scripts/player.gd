extends Area2D

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.
var lookingUp=false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("right"):
		$AnimatedSprite2D.play("walkR")
		velocity.x += 1
		lookingUp=false
	if Input.is_action_pressed("left"):
		$AnimatedSprite2D.play("walkL")
		velocity.x -= 1
		lookingUp=false
	if Input.is_action_pressed("down"):
		$AnimatedSprite2D.play("walkdown")
		velocity.y += 1
		lookingUp=false
	if Input.is_action_pressed("up"):
		$AnimatedSprite2D.play("walkup")
		$AnimatedSprite2D.play()
		lookingUp=true
		velocity.y -= 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	else:
		$AnimatedSprite2D.play("idleUp" if lookingUp else "idle")

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)

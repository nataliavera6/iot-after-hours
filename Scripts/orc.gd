extends Enemy

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	#first run the function of superclass
	super(delta)
	update_animation()

func update_animation():
	# enemy is still
	if velocity == Vector2.ZERO:
		anim.stop()
		return
	
	if abs(velocity.x)> abs(velocity.y):
		anim.play("walk-slide")
		#this will flip the sprite if its moving to the left
		anim.flip_h = velocity.x > 0
	elif velocity.y < 0:
		anim.play("walk-up")
	else:
		anim.play("walk-down")
		

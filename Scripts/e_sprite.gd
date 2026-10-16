extends Sprite2D

func _ready() -> void:
	var start_y = position.y
	var tween = create_tween().set_loops()
	tween.set_trans(Tween.TRANS_SINE)
	tween.tween_property(self, "position:y", start_y - 10, 0.5)
	tween.tween_property(self, "position:y", start_y, 0.5)

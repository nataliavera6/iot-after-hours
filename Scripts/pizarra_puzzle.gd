extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func _on_line_edit_text_submitted(new_text: String) -> void:
	if (new_text=="2"):
		$CanvasLayer.visible=true
	else:
		$CanvasLayer2.visible=true
		$HBoxContainer/LineEdit.text=''


func _on_button_pressed() -> void:
	$CanvasLayer2.visible=false


func _on_button_2_pressed() -> void:
	#return to game logic
	pass # Replace with function body.

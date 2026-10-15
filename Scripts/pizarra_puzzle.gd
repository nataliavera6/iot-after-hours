extends CanvasLayer


var a=randi_range(1,9)
var b=randi_range(1,9)
var x=randi_range(1,9)
var c=(a*x)-b

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = str(a) + "x - " + str(b) + " = " + str(c)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	


func _on_line_edit_text_submitted(new_text: String) -> void:
	if (new_text==str(x)):
		$WinScreen.visible=true
	else:
		$LoseScreen.visible=true
		$HBoxContainer/inputBox.text=''


func _on_button_pressed() -> void:
	$LoseScreen.visible=false


func _on_button_2_pressed() -> void:
	#return to game 
	pass # Replace with function body.

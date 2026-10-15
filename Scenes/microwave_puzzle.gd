extends CanvasLayer

var correct_sequence = ["2","3","0"]
var current_step = 0
var timer=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $Display.text=="2":
		$Display.text+=":"
	if (current_step==1) && ($Display.text!="2:"):
		$LoseScreen.show()
		
	if (current_step==2) && ($Display.text!="2:3"):
		$LoseScreen.show()
		
	if (current_step==3) && ($Display.text!="2:30"):
		$LoseScreen.show()
	
	if$Display.text=="2:30":
		$WinScreen.show()


func _on_timer_timeout() -> void:
	pass # Replace with function body.


func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_timer_2_timeout() -> void:
	$eyes.show()
	$Timer2.stop()


func _on_timer_3_timeout() -> void:
	$eyes.hide()
	$Timer3.stop()


func _on_timer_4_timeout() -> void:
	$Label.hide()

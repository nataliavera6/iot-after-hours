extends CanvasLayer

var correct_sequence = ["2","3","0"]
var current_step = 0
var timer=0
signal microwave_win
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $Display.text=="2":
		$Display.text+=":"
	if (current_step==1) && ($Display.text!="2:"):
		$Label.hide()
		$LoseScreen.show()
		
	if (current_step==2) && ($Display.text!="2:3"):
		$Label.hide()
		$LoseScreen.show()
		
	if (current_step==3) && ($Display.text!="2:30"):
		$Label.hide()
		$LoseScreen.show()
	
	if$Display.text=="2:30":
		microwave_win.emit()


func _on_timer_timeout() -> void:
	pass # Replace with function body.


func _on_retry_button_pressed() -> void:
	$LoseScreen.hide()
	$Label.show()
	current_step=0
	$Display.text=""


func _on_timer_2_timeout() -> void:
	$eyes.show()
	$Timer2.stop()


func _on_timer_3_timeout() -> void:
	$eyes.hide()
	$Timer3.stop()


func _on_timer_4_timeout() -> void:
	pass
	#$Label.hide()

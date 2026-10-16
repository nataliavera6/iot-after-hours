extends CanvasLayer

signal login_won
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("start timer")
	#$Timer2.start()
	#$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print($Timer2.is_stopped())
	pass


func _on_log_in_pressed() -> void:
	$Background1.hide()
	$Background2.show()


func _on_continue_pressed() -> void:
	$Background1.hide()
	$Background2.hide()
	$Background3.show()


func _on_account_pressed() -> void:
	$Background3.hide()
	$Background4.show()


func _on_signin_pressed() -> void:
	if $Background4/PasswordFinal.text=="Alfred da Butt-ler":
		login_won.emit()
		$Timer.stop()
		
		
	else:
		print("showing lose")
		$Background4/PasswordFinal.text=" "
		$LoseScreen.show()
		$"Background4/sign-in".disabled=true


func _on_retry_pressed() -> void:
	$Background1.show()
	$LoseScreen.hide()
	

func _on_timer_timeout() -> void:
	$Background1/Label.hide()


func _on_timer_2_timeout() -> void:
	$LoseScreen.show()


func _on_continue_1_pressed() -> void:
	$Background1.hide()
	$Background2.hide()
	$Background3.show()

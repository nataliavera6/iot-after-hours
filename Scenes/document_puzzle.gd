extends CanvasLayer
signal document_win
var correct_files = 0
var total_files = 9


func file_sorted_correctly():
	correct_files += 1

	if correct_files == total_files:
		document_win.emit()


func file_sorted_wrong():
	$LoseScreen.visible = true


func _on_try_again_button_pressed() -> void:
	$LoseScreen.visible = false
	correct_files = 0

	$MathFile1.reset_file()
	$MathFile2.reset_file()
	$MathFile3.reset_file()

	$LiteratureFile1.reset_file()
	$LiteratureFile2.reset_file()
	$LiteratureFile3.reset_file()

	$TrashFile1.reset_file()
	$TrashFile2.reset_file()
	$TrashFile3.reset_file()

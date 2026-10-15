extends Control

@export var correct_folder: String

var drag_offset = Vector2.ZERO
var dragging = false
var start_position


func _ready() -> void:
	start_position = global_position


func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
				drag_offset = get_global_mouse_position() - global_position


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if not event.pressed and dragging:
				dragging = false
				check_drop_zone()


func _process(delta: float) -> void:
	if dragging:
		global_position = get_global_mouse_position() - drag_offset


func check_drop_zone():
	var parent = get_parent()
	var mouse_position = get_global_mouse_position()

	var math_zone = parent.get_node("MathDropZone")
	var literature_zone = parent.get_node("LiteratureDropZone")
	var trash_zone = parent.get_node("TrashDropZone")

	if math_zone.get_global_rect().has_point(mouse_position):
		check_answer("Math")

	elif literature_zone.get_global_rect().has_point(mouse_position):
		check_answer("Literature")

	elif trash_zone.get_global_rect().has_point(mouse_position):
		check_answer("Trash")


func check_answer(folder):
	var parent = get_parent()

	if folder == correct_folder:
		hide()
		parent.file_sorted_correctly()
	else:
		parent.file_sorted_wrong()


func reset_file():
	global_position = start_position
	show()

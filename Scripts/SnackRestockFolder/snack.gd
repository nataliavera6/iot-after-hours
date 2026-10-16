class_name Snack
extends Area2D

signal sorted

enum Category { DRINK, CHIPS, CANDY, OTHER }

@export var category: Category

var start_position: Vector2
var is_dragging : bool = false
var is_placed : bool = false
var drag_offset : Vector2 = Vector2.ZERO

func _ready() -> void:
	start_position = global_position
	input_event.connect(_on_input_event)

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if is_placed:
		return
	#if mouse is pressed
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		_start_drag()

func _start_drag():
	is_dragging = true
	drag_offset = global_position - get_global_mouse_position()
	#make sure the snack its draw above all
	z_index = 5

func _process(_delta: float) -> void:
	if is_dragging:
		global_position = get_global_mouse_position() + drag_offset

func _input(event):
	if not is_dragging:
		return
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
		_drop()

func _drop():
	is_dragging = false
	z_index = 0

	for area in get_overlapping_areas():
		if "category" in area:
			if area.category == category:
				_place()
				return
			
	_return_to_start()

func _place():
	is_placed = true
	sorted.emit()

# this happends if the snack its not sorted correctly
func _return_to_start():
	var tween := create_tween()
	tween.tween_property(self, "global_position", start_position, 0.2)

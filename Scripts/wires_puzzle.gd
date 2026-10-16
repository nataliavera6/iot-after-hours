class_name WiresPuzzle
extends CanvasLayer
signal circuit_win
signal finished(won : bool)

const COLORS : Array[Color] = [Color.RED, Color.DODGER_BLUE, Color.YELLOW, Color.MAGENTA]
#how close the mouse must be to a plug
const SNAP_DISTANCE : float = 40.0
const WIRE_WIDTH : float = 12.0

@onready var wires : Node2D = $Wires
@onready var left_plugs : Array[Node] = $LeftPlugs.get_children()
@onready var right_plugs : Array[Node] = $RightPlugs.get_children()
@onready var plugs = left_plugs + right_plugs
#save the color of each plug
var plug_colors = {}
#plugs that already have a wire
var used_plugs = {}
#the left plug the player is dragging from
var current_plug : Node2D = null
#the wire the player is dragging
var current_line : Line2D = null
var connections = 0

func _ready() -> void:
	assign_colors()

func _process(_delta: float) -> void:
	#the end of the wire follows the mouse
	if current_line:
		current_line.set_point_position(1, current_line.to_local(current_line.get_global_mouse_position()))

#make the colors of the plugs random
func assign_colors():
	var left_colors = COLORS.duplicate()
	var right_colors = COLORS.duplicate()
	#set the colors to a random order
	left_colors.shuffle()
	right_colors.shuffle()

	for i in left_plugs.size():
		if i>=COLORS.size():
			break
		set_plug_color(left_plugs[i], left_colors[i])
	for i in right_plugs.size():
		if i>=COLORS.size():
			break
		set_plug_color(right_plugs[i], right_colors[i])

func set_plug_color(plug: Node2D, color: Color):
	plug_colors[plug] = color
	#paint the plug
	plug.modulate = color

func _input(event):
	#esc closes the puzzle
	if event.is_action_pressed("ui_cancel"):
		_lose()
		return
	#only care about the left click
	if not (event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT):
		return

	var mouse = wires.get_global_mouse_position()
	#if mouse is pressed
	if event.pressed:
		var plug = get_plug_at(plugs, mouse)
		if plug and not used_plugs.has(plug):
			start_wire(plug)
	#if mouse is released while dragging a wire
	elif current_line:
		var target = get_plug_at(plugs, mouse)
		if target and not used_plugs.has(target) and plug_colors[target] == plug_colors[current_plug]:
			connect_wire(target)
		else:
			#wrong plug or dropped in the air
			current_line.queue_free()
		current_plug = null
		current_line = null

#return the plug under the mouse, or null
func get_plug_at(plugs: Array[Node], pos: Vector2):
	for plug in plugs:
		if plug.global_position.distance_to(pos)<=SNAP_DISTANCE:
			return plug
	return null

#create a new wire from the plug
func start_wire(plug: Node2D):
	current_plug = plug
	current_line = Line2D.new()
	current_line.width = WIRE_WIDTH
	current_line.default_color = plug_colors[plug]
	wires.add_child(current_line)
	#both points start on the plug
	var start = current_line.to_local(plug.global_position)
	current_line.points = PackedVector2Array([start, start])

#stick the wire to the right plug
func connect_wire(target: Node2D):
	current_line.set_point_position(1, current_line.to_local(target.global_position))
	used_plugs[current_plug] = true
	used_plugs[target] = true
	connections+=1
	#win condition
	if connections>=left_plugs.size():
		_win()

func _win():
	print("Win state")
	circuit_win.emit()
	finished.emit(true)

#lose condition
func _lose():
	print("U lose")
	finished.emit(false)

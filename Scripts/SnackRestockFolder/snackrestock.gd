class_name SnackRestock
extends CanvasLayer

signal finished(won : bool)
@export var time_limit : float = 30

@onready var shelves : Node2D = $Shelfs
@onready var snacks : Node2D = $Snacks
@onready var control : Control = $Control
@onready var timer_label : Label = control.get_node("TimerText")
@onready var counter_label: Label = control.get_node("Counter")
var total = 0
var sorted_count = 0

func _process(delta: float) -> void:
	var seconds = int(ceil($Timer.time_left))
	timer_label.text = str(seconds)

func _ready() -> void:
	total = snacks.get_child_count()
	$Timer.start()
	randomize_shelves()
	connect_sorted()
	#just make sure the counter its correct
	update_counter()
	

#make the category of the shelf random
func randomize_shelves():
	var categories = Snack.Category.values()
	#set the categories to a random order.
	categories.shuffle()
	
	var i = 0
	for shelf in shelves.get_children():
		if i>=categories.size():
			break
		#set the category of the shelf
		shelf.category = categories[i]
		i+=1
#connect the sorted signal for all the snacks
func connect_sorted():
	for snack in snacks.get_children():
		if snack is Snack:
			snack.sorted.connect(_on_snack_sorted)

func _on_snack_sorted():
	sorted_count+=1
	update_counter()
	#win condition
	if sorted_count>=total:
		print("Win state")

func update_counter():
	counter_label.text = "Sorted: %d / %d" % [sorted_count, total]

#lose condition
func _on_timer_timeout() -> void:
	_lose()
	
func _lose():
	print("U lose")	

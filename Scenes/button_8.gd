extends Button
var current_num=0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	current_num=randi_range(0,9)
	self.text=str(current_num)

func _on_pressed() -> void:
	$"../Display".text+=str(current_num)
	$"../".current_step+=1

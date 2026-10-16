extends Node2D

var active: String ="pizarra"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$SnackRestock.process_mode = Node.PROCESS_MODE_DISABLED
	$LoginPuzzle.process_mode=Node.PROCESS_MODE_DISABLED
	$DocumentPuzzle.process_mode = Node.PROCESS_MODE_DISABLED
	$MicrowavePuzzle.process_mode = Node.PROCESS_MODE_DISABLED
	$PizarraPuzzle.process_mode=Node.PROCESS_MODE_DISABLED
	
	
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass





#/////////////////////////
func _on_fridge_body_entered(body: Node2D) -> void:
	print("enter")
	if body.is_in_group("player") && active=="snack_restock":
		$SnackRestock.process_mode = Node.PROCESS_MODE_ALWAYS
		$SnackRestock.show()
		get_tree().paused=true
		PhysicsServer2D.set_active(true)
		print("player enter")

func _on_snack_restock_won_fridge() -> void:
	$SnackRestock.process_mode = Node.PROCESS_MODE_DISABLED
	$SnackRestock.visible=false
	get_tree().paused=false
	$fridge.hide()
	$login.show()
	active="login"
	
	
#/////////////////////////
func _on_login_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") && active=="login":
		$LoginPuzzle.process_mode = Node.PROCESS_MODE_ALWAYS
		$LoginPuzzle.show()
		get_tree().paused=true


func _on_login_puzzle_login_won() -> void:
	$LoginPuzzle.process_mode = Node.PROCESS_MODE_DISABLED
	$LoginPuzzle.hide()
	get_tree().paused=false
	$login.hide()
	active =="microwave"


#/////////////////////////////////////
func _on_microwave_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") && active=="microwave":
		$MicrowavePuzzle.process_mode = Node.PROCESS_MODE_ALWAYS
		$MicrowavePuzzle.show()
		get_tree().paused=true


func _on_microwave_puzzle_microwave_win() -> void:
	$MicrowavePuzzle.process_mode = Node.PROCESS_MODE_DISABLED
	$MicrowavePuzzle.hide()
	get_tree().paused=false
	$microwave.hide()
	active =="document"
	
#///////////////////////////////

func _on_document_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") && active=="document":
		$DocumentPuzzle.process_mode = Node.PROCESS_MODE_ALWAYS
		$DocumentPuzzle.show()
		get_tree().paused=true


func _on_document_puzzle_document_win() -> void:
	$DocumentPuzzle.process_mode = Node.PROCESS_MODE_DISABLED
	$DocumentPuzzle.hide()
	get_tree().paused=false
	$document.hide()
	active =="pizarra"
#/////////////////////////
func _on_pizarra_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") && active=="pizarra":
		$PizarraPuzzle.process_mode = Node.PROCESS_MODE_ALWAYS
		$PizarraPuzzle.show()
		get_tree().paused=true


func _on_pizarra_puzzle_pizarra_win() -> void:
	$PizarraPuzzle.process_mode = Node.PROCESS_MODE_DISABLED
	$PizarraPuzzle.hide()
	get_tree().paused=false
	$pizarra.hide()
	active =="circuit"
#///////////


func _on_circuit_body_entered(body: Node2D) -> void:
	pass # Replace with function body.

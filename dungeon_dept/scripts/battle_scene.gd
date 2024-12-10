extends Node

@onready var money_count = $Money


# Called when the node enters the scene tree for the first time.
func _input(event):
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	money_count.text = "$" + str(Autoscript.money)


func _on_ready_button_pressed() -> void:
	pass
	

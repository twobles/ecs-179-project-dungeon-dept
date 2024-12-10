extends Node

@onready var battle_scene = $BattleScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	battle_scene.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_ready_button_pressed() -> void:
	battle_scene.show()

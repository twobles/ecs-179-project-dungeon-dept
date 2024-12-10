extends Node

@onready var battle_scene = $BattleScene
@onready var skeleton_icon = $BuildMenu/SkeletonIcon
@onready var skeleton_info = $BuildMenu/SkeletonInfo
@onready var skeleton_name = $BuildMenu/SkeletonName

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	battle_scene.hide()
	skeleton_icon.hide()
	skeleton_info.hide()
	skeleton_name.hide()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_ready_button_pressed() -> void:
	battle_scene.show()

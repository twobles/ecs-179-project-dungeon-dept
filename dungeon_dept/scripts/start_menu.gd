extends Node2D

@onready var start_button = $StartButton

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/dungeon.tscn")

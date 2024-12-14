class_name AdventurerManager
extends Node

@export var adventurers: Array[Adventurer] = []

@onready var room_manager: RoomManager = %RoomManager

var spawn_points = [
	Vector2(360.0, 250.0),
	Vector2(360.0, 320.0),
	Vector2(360.0, 390.0),
]


func _on_room_manager_active_room_ready() -> void:
	var active_room: Room = room_manager.active_room
	adventurers[0].z_index = active_room.z_index
	adventurers[1].z_index = active_room.z_index
	adventurers[2].z_index = active_room.z_index
	adventurers[0].position = spawn_points[0]
	adventurers[1].position = spawn_points[1]
	adventurers[2].position = spawn_points[2]
	

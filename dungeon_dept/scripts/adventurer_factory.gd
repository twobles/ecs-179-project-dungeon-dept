class_name AdventurerFactory
extends Node

enum AdventurerType {
	KNIGHT,
}

var adventurer_paths = {
	AdventurerType.KNIGHT: "res://scenes/knight.tscn"
}

var adventurer_cache = {}


func spawn(adventurer_type: AdventurerType) -> Adventurer:
	if adventurer_type in adventurer_paths:
		if not adventurer_cache.has(adventurer_type):
			adventurer_cache[adventurer_type] = load(str(adventurer_paths[adventurer_type]))
		var adventurer_instance = (adventurer_cache[adventurer_type] as PackedScene).instantiate()
		return adventurer_instance
	else:
		return null

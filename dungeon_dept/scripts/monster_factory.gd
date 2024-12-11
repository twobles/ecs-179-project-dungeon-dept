class_name MonsterFactory
extends Node

enum MonsterType {
	SKELETON,
}

var monster_paths = {
	MonsterType.SKELETON: "res://scenes/skeleton.tscn"
}

var monster_cache = {}


func spawn(monster_type: MonsterType) -> Monster:
	if monster_type in monster_paths:
		if not monster_cache.has(monster_type):
			monster_cache[monster_type] = load(str(monster_paths[monster_type]))
		var monster_instance = (monster_cache[monster_type] as PackedScene).instantiate()
		return monster_instance
	else:
		return null

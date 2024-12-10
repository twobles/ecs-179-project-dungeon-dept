class_name EntityManager
extends Node

var adventurers: Array = []
var monsters: Array = []


func assign_targets() -> void:
	for adventurer in adventurers:
		if adventurer.target == null:
			adventurer.target = get_tree().get_nodes_in_group("monsters").pick_random()
	
	for monster in monsters:
		if monster.target == null:
			monster.target = get_tree().get_nodes_in_group("adventurers").pick_random()

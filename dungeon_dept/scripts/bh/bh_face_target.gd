class_name FaceTarget extends ActionLeaf

func tick(actor:Node, _blackboard:Blackboard) -> int:
	print("facing target")
	actor.set_target_position(actor.enemy.global_position)
	return SUCCESS

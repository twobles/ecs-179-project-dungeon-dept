class_name FaceTarget extends ActionLeaf

func tick(actor:Node, _blackboard:Blackboard) -> int:
	#print("facing target")
	actor.face_target()
	if actor.global_position.distance_to(actor.enemy.global_position) <= actor.melee_range:
		return SUCCESS
	else:
		return RUNNING

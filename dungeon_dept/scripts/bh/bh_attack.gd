class_name Attack extends ActionLeaf

func tick(actor:Node, _blackboard:Blackboard) -> int:
	actor.attacking = true
	return SUCCESS

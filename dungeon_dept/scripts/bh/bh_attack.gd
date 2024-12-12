class_name Attack extends ActionLeaf

func tick(actor:Node, _blackboard:Blackboard) -> int:
	actor.toggle_navigation(false)
	actor.attacking = true
	return SUCCESS

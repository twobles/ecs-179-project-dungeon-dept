class_name Attack extends ActionLeaf

func tick(actor:Node, _blackboard:Blackboard) -> int:
	actor.walking = false
	actor.toggle_navigation(false)
	actor.attacking = true
	print("attacking: ", actor.attacking )
	return SUCCESS

class_name StartNavigation extends ActionLeaf

func tick(actor:Node, _blackboard:Blackboard) -> int:
	print("navigating")
	actor.toggle_navigation(true)
	return SUCCESS

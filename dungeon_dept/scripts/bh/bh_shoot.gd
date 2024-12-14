class_name Shoot 
extends ActionLeaf

func tick(actor:Node, _blackboard:Blackboard) -> int:
	actor.toggle_navigation(false)
	actor.walking = false
	actor.attacking = true
	actor.shoot()
	#print("attacking: ", actor.attacking )
	return SUCCESS

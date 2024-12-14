class_name EnemyAlive 
extends ConditionLeaf

func tick(actor:Node, _blackboard:Blackboard) -> int:
	#print("check dead: ", actor.enemy._death)
	if actor.enemy._death:
		actor.enemy = null
		return FAILURE
	else:
		return SUCCESS

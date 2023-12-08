extends Area3D

var root
@onready var target
@onready var target_name = "unit"

func process_targeting():
	var bodies = get_overlapping_bodies()
#       print(name+" is processing targeting " + str(bodies.size()) + "options")
	if(bodies.size() == 0):
		target=null
		return
	bodies.sort_custom(target_sort)
	var body = bodies.pop_front()
	if(body.name == get_parent().name):
		target=null
		return
	target=body

func body_entered_or_exited(_body):
	process_targeting()

#return a < b
func target_sort(a,b):
#	if(a isnt attacking a hero and b is attacking a hero):
#		return true
#	if(a isnt attacking me and b is attacking me):
#		return true
#	if(a isnt attacking friendly and b is attacking friendly):
#		return true
#	if(a isnt creep and b is creep):
#		return true
#	if(a isnt hero and b is hero):
#		return true
#	if(a isnt catapult and b is catapult):
#		return true
	return position.distance_to(a.position) < position.distance_to(b.position)

#The tower will switch targets if:
#
#    The targeted enemy unit or hero dies
#    An enemy unit or hero targets a friendly hero
#    An enemy hero being attacked by the tower manually attacks a friendly unit or hero (in which case, the tower will select a new target based on the above priority order).

func _ready():
	root = get_tree().get_root()
	target = root.get_node("main/"+target_name)

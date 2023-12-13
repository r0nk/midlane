extends ColorRect

#TODO at some point this should have a better link,
#for now its hardcoded to the player player
@export var target_skill_path = "explosion"

var target_skill
var cooldown

func _ready():
	var skills = get_tree().get_root().get_node("main/unit/skills")
	target_skill = skills.get_node(target_skill_path)
	cooldown = target_skill.get_node("cooldown")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$cd.max_value = cooldown.wait_time
	$cd.value = cooldown.time_left


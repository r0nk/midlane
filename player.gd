extends CharacterBody2D

var destination = Vector2(0,0)
var root
var target

@export var team = "rad"

var attack_range=300
var health = 500

var speed = 300

func _ready():
	root = get_tree().get_root()
	$ranged.damage=200

func actual_speed():
	return speed/100.0

#https://ask.godotengine.org/3719/how-to-get-a-node-by-mouse-click
func check_right_click():
	if Input.is_action_just_pressed('move'):
		var mousePos = get_global_mouse_position()
		var space = get_world_2d().direct_space_state
		var query = PhysicsPointQueryParameters2D.new()
		query.position=mousePos
		query.collide_with_areas=false
		query.collide_with_bodies=true
		var result = space.intersect_point(query)
		if result and result[0].collider != self:
			$acquisition.target=result[0].collider
		else:
			destination = get_global_mouse_position()
			get_node("../Marker").set_pos(destination)

func _process(delta):
	check_right_click()
#	destination=position+Vector2($AIController2D.x_movement,$AIController2D.y_movement)
	if position.distance_to(destination) > 1*actual_speed():
		#TODO change to move_and_slide
		position-=(position-destination).normalized() * actual_speed()
		$ranged.disable()
	else:
		position=destination
		$ranged.enable()



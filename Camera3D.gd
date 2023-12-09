extends Camera3D

var fixed_toggle_point = Vector3(0,0,0)

func get_bedrock_intersection_position():
	var mouse_coords = get_viewport().get_mouse_position()
	var from = project_ray_origin(mouse_coords)
	var to = from + project_ray_normal(mouse_coords) * 100
	var space = get_world_3d().direct_space_state
	#bedrock is on layer 16
	var query = PhysicsRayQueryParameters3D.create(from,to,pow(2,16-1))
	var result = space.intersect_ray(query)
	return result.position

func get_under_mouse():
	var mouse_coords = get_viewport().get_mouse_position()

	var from = project_ray_origin(mouse_coords)
	var to = from + project_ray_normal(mouse_coords) * 100
	var space = get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(from,to)
	var result = space.intersect_ray(query)
	return result

func _process(delta):
	get_under_mouse()

func _input(event):
	if Input.is_action_just_pressed('move_map'):
		fixed_toggle_point = get_bedrock_intersection_position()
	if event is InputEventMouseMotion and Input.is_action_pressed('move_map'):
		slide_map_around()

# slides the map around
func slide_map_around():
	#var ref = get_viewport().get_mouse_position()
	var ref = get_bedrock_intersection_position()
	self.global_position -= ref - fixed_toggle_point
	fixed_toggle_point = get_bedrock_intersection_position()

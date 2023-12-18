extends Button

@export var resource: ItemResource

var cost = 5

func _ready():
	if resource == null:
		resource = $resource_picker.pick("")
	reload_resource()

func randomize_item():
	resource = $resource_picker.pick("")
	reload_resource()

func reload_resource():
	$name.text = resource.name
	$texture.texture = resource.texture
	$description.text=""
	for effect in resource.effects:
		$description.text+= effect.key + " +" + str(effect.addition)

func pressed():
	if %unit/collector.cash >= cost:
		%unit/collector.cash-=cost
		for effect in resource.effects:
			%unit/stats.add_effect(effect)
		cost=floor((cost+1)*1.1)
		$cost.text="$ "+str(cost)
		randomize_item()

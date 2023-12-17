extends Button

@export var item: ItemResource

var cost = 5

func _ready():
	reload_resource()

func reload_resource():
	$name.text = item.name
#	$texture.texture = item.texture
	$description.text=""
	for effect in item.effects:
		$description.text+= effect.key + " +" + str(effect.addition)

func pressed():
	if %unit/collector.cash >= cost:
		%unit/collector.cash-=cost
		for effect in item.effects:
			%unit/stats.add_effect(effect)
		cost=floor(cost*1.1)
		$cost.text="$ "+str(cost)

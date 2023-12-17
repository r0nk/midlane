extends RichTextLabel

func _process(_delta):
	text=''
	for effect in %unit/stats.effects:
		if(effect.permanent):
			continue
		text+=effect.key



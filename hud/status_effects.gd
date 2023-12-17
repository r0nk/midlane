extends RichTextLabel

func _process(_delta):
	text=''
	for effect in %unit/stats.effects:
		text+=effect.key



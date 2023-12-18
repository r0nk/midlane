extends RichTextLabel

func _process(_delta):
	text = "$ "+str(floor(%unit/collector.cash))

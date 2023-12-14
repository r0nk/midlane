extends RichTextLabel

func _process(delta):
	text = "$ "+str(%unit/collector.cash)

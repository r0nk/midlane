extends RichTextLabel

func _process(_delta):
	text = "$ "+str(%unit/collector.cash)

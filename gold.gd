extends RichTextLabel

func _process(delta):
	text = str(int(get_node("/root/main/player/wallet").cash))+ " G"

extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var time = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time+=delta
	text=str(int(time/60))+":"+str(int(time)%60)
	if((int(time)%60)<10):
		text=str(int(time/60))+":0"+str(int(time)%60)

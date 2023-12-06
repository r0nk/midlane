extends CharacterBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var max_health = 2000
var health = max_health
@export var team = "rad"

func _on_acquisition_body_entered(_body):
	$acquisition.process_targeting()

# Called when the node enters the scene tree for the first time.
func _ready():
	$acquisition.team = team
	if(team=="rad"):
		$acquisition.target_name = "bad_tower"
		$acquisition.process_targeting()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$bar.value=100*health/max_health

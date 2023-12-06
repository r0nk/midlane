extends Node2D

# 012
# 345
var inventory_location=0

func pickup(unit):
	unit.move_speed+=50

func drop(unit):
	unit.move_speed-=50


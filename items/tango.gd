extends Node2D

# 012
# 345
var inventory_location=0

func pickup(unit):
	unit.strength+=1
	unit.agility+=1
	unit.intelligence+=1

func drop(unit):
	unit.strength-=1
	unit.agility-=1
	unit.intelligence-=1


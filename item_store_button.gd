extends Button

var cost = 20

func pressed():
	if %unit/collector.cash >= cost:
		%unit/collector.cash-=cost
		%unit/pathfinding.speed+=1

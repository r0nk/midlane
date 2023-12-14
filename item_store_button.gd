extends Button

var cost = 20

func pressed():
	if %unit/collector.cash > 20:
		%unit/collector.cash-=20
		%unit/pathfinding.speed+=1

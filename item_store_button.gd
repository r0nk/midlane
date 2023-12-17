extends Button

var cost = 20

func pressed():
	if %unit/collector.cash >= cost:
		%unit/collector.cash-=cost
		%unit/stats.move_speed+=1
		cost=floor(cost*1.1)
		$cost.text="$ "+str(cost)

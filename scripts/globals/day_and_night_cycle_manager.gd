extends Node
const MIN_PER_DAY: int = 24*60
const MIN_PER_HOUR: int = 60
const GAME_DURATION: float = TAU / MIN_PER_DAY

var game_speed: float = 5.0

var start_day: int = 1
var start_hour: int = 12
var start_minute: int = 00

var time: float = 0.0

var curr_minute: int = -1 
var curr_data: int = 0

signal game_time(time:float)
signal time_tick(day:int, hour: int, minute: int)
signal time_tick_day(day:int)

func set_initial_time() -> void:
	var initial_total_minutes = start_day * MIN_PER_DAY * (start_hour * MIN_PER_HOUR) + start_minute
	
	

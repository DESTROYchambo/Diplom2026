extends Node
const MIN_PER_DAY: int = 24*60
const MIN_PER_HOUR: int = 60
const GAME_DURATION: float = TAU / MIN_PER_DAY

var game_speed: float = 5.0

var start_day: int = 1
var start_hour: int = 12
var start_minute: int = 30

var time: float = 0.0
var curr_minute: int = -1 
var curr_day: int = 0

signal game_time(time:float)
signal time_tick(day:int, hour: int, minute: int)
signal time_tick_day(day:int)

func _ready() -> void:
	set_initial_time()

func _process(delta: float) -> void:
	time += delta * game_speed * GAME_DURATION
	game_time.emit(time)
	
	recalculate_time()

func set_initial_time() -> void:
	var initial_total_minutes = start_day * MIN_PER_DAY + (start_hour * MIN_PER_HOUR) + start_minute
	
	time = initial_total_minutes * GAME_DURATION
	
func recalculate_time() -> void:
	var total_minutes: int = int(time / GAME_DURATION)
	var day: int = int(total_minutes / MIN_PER_DAY)
	var current_day_minutes: int = total_minutes % MIN_PER_DAY
	var hour: int = int(current_day_minutes / MIN_PER_HOUR)
	var minute: int = int(current_day_minutes % MIN_PER_HOUR)
	
	if curr_minute != minute:
		curr_minute = minute
		time_tick.emit(day, hour, minute)
	
	if curr_day != day:
		curr_day = day
		time_tick_day.emit(day)
		

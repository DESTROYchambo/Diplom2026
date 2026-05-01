class_name GrowthCycleComponent
extends Node2D
@export var current_growth: DataTypes.GrowthStates = DataTypes.GrowthStates.Seedling

@export_range(5,365) var days_until_harvest: int = 7

signal crop_mature
signal crop_harvesting

var is_watered: bool
var starting_day: int
var current_day: int

func _ready() -> void:
	DayAndNightCycleManager.time_tick_day.connect(on_time_tick_day)

func on_time_tick_day(day:int) -> void:
	if is_watered:
		if starting_day == 0:
			starting_day = day
			
		growth_states(starting_day,day)
		harvest_state(starting_day,day)

func growth_states(starting_day: int, current_day: int) -> void:
	if current_growth == DataTypes.GrowthStates.Mature:
		return
	var num_states = 5
	var growth_days_passed =  (current_day - starting_day) % num_states
	var state_index = growth_days_passed % num_states + 1
	current_growth = state_index
	
	var name = DataTypes.GrowthStates.keys()[current_growth]
	print("Current growth state: ", name, " Index: ", state_index)

	if current_growth == DataTypes.GrowthStates.Mature:
		crop_mature.emit()

func harvest_state(starting_day: int, current_day: int) -> void:
	if current_growth == DataTypes.GrowthStates.Harvest:
		return
	
	var days_passed = (current_day - starting_day) % days_until_harvest
	if days_passed == days_until_harvest - 1:
		current_growth = DataTypes.GrowthStates.Harvest
		crop_harvesting.emit()

func get_current_state() -> DataTypes.GrowthStates:
	return current_growth

class_name DayNightCycleComponent
extends CanvasModulate

@export var start_day: int = 1:
	set(id):
		start_day=id
		DayAndNightCycleManager.start_day = id
		DayAndNightCycleManager.set_initial_time()

@export var start_hour: int = 12:
	set(ih):
		start_hour = ih
		DayAndNightCycleManager.start_hour = ih
		DayAndNightCycleManager.set_initial_time()

@export var start_minute: int = 30:
	set(im):
		start_minute = im
		DayAndNightCycleManager.start_minute = im
		DayAndNightCycleManager.set_initial_time()

@export var day_night_gradient_texture: GradientTexture1D

func _ready() -> void:
	DayAndNightCycleManager.start_day = start_day
	DayAndNightCycleManager.start_hour = start_hour
	DayAndNightCycleManager.start_minute = start_minute
	DayAndNightCycleManager.set_initial_time()
	
	DayAndNightCycleManager.game_time.connect(on_game_time)
	
func on_game_time(time: float) -> void:
	var value = 0.5 * (sin(time - PI * 0.5)+1.0)
	color = day_night_gradient_texture.gradient.sample(value)
	

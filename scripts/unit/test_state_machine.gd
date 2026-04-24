extends "res://addons/gut/test.gd"

var StateMachine = load("res://scripts/state_machine/node_state_machine.gd")
var NodeState = load("res://scripts/state_machine/node_state.gd")

func test_transition_to_state():
	var sm = StateMachine.new()
	add_child_autofree(sm)
	
	#тестовий стан
	var idle= NodeState.new()
	idle.name = "Idle"
	sm.add_child(idle)
	
	var run= NodeState.new()
	run.name = "Run"
	sm.add_child(run)
	
	sm._ready()
	sm.current_node_state = idle #початкове значення
	sm.transition_to("Run")
	assert_eq(sm.current_node_state_name, "run", "Машина повинна змінити стан на Run")
	sm.transition_to("Idle")
	assert_eq(sm.current_node_state_name, "idle", "Машина повинна змінити стан на Idle")

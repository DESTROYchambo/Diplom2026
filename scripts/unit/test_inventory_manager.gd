extends "res://addons/gut/test.gd"

# Тестування внутрішньої логіки класу InventoryManager
# Перевіряються окремі методи додавання та пошуку предметів у інвентарі

func before_each():
	# Очистити інвентар перед кожним тестом
	InventoryManager.inventory.clear()


func test_add_single_item():
	# Додаємо один предмет
	InventoryManager.add_collectible("log")
	
	# Перевіряємо, що він знаходиться в інвентарі з кількістю 1
	assert_eq(InventoryManager.find_collectible("log"), 1)


func test_add_multiple_items_of_same_type():
	# Додаємо один предмет 3 рази
	InventoryManager.add_collectible("stone")
	InventoryManager.add_collectible("stone")
	InventoryManager.add_collectible("stone")
	
	# Перевіряємо, що кількість дорівнює 3
	assert_eq(InventoryManager.find_collectible("stone"), 3)


func test_find_nonexistent_item_returns_zero():
	# Пошук предмета, якого немає в інвентарі
	var count = InventoryManager.find_collectible("corn")
	
	# Повинен повернути 0
	assert_eq(count, 0)


func test_add_multiple_different_items():
	# Додаємо різні предмети
	InventoryManager.add_collectible("log")
	InventoryManager.add_collectible("stone")
	InventoryManager.add_collectible("log")
	InventoryManager.add_collectible("egg")
	InventoryManager.add_collectible("stone")
	
	# Перевіряємо кількість кожного типу
	assert_eq(InventoryManager.find_collectible("log"), 2)
	assert_eq(InventoryManager.find_collectible("stone"), 2)
	assert_eq(InventoryManager.find_collectible("egg"), 1)


func test_inventory_signal_emitted_on_add():
	# Спостерігаємо за сигналом inventory_changed у InventoryManager
	watch_signals(InventoryManager)
	
	# Додаємо предмет
	InventoryManager.add_collectible("milk")
	
	# Перевіряємо, що сигнал був випущений рівно один раз
	assert_signal_emitted(InventoryManager, "inventory_changed", 1)


func test_inventory_dictionary_structure():
	# Додаємо декілька предметів
	InventoryManager.add_collectible("tomato")
	InventoryManager.add_collectible("tomato")
	
	# Перевіряємо внутрішню структуру словника
	assert_true(InventoryManager.inventory.has("tomato"))
	assert_eq(InventoryManager.inventory["tomato"], 2)
	assert_false(InventoryManager.inventory.has("nonexistent"))

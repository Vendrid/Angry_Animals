extends Node2D

const ANIMAL = preload("res://scenes/Animal/animal.tscn")

@onready var animal_start: Marker2D = $"Animal Start"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_animal()
	SignalManager.on_animal_died.connect(add_animal)


# Called every frame. 'delta' is the elapsed time since the pr


func add_animal() -> void:
	var animal = ANIMAL.instantiate()
	animal.position = animal_start.position
	add_child(animal)

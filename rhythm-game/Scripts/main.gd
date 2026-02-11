extends Node2D
@onready var character_body_2d: CharacterBody2D = $Controll/CharacterBody2D
@onready var note: Area2D = $Note/Note

var in_menu : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	note.ready_()
	character_body_2d.ready_()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	character_body_2d.process_(delta)
	note.process_(delta)
	
func _input(event: InputEvent) -> void:
	character_body_2d.input_(event)

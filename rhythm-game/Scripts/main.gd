extends Node2D
@onready var character_body_2d: CharacterBody2D = $Controll/CharacterBody2D
#@onready var note: Area2D = $Note/Note
@onready var two_character_body_2d: CharacterBody2D = $Controll2/CharacterBody2D
@onready var three_character_body_2d: CharacterBody2D = $Controll3/CharacterBody2D
@onready var for_character_body_2d: CharacterBody2D = $Controll4/CharacterBody2D
@onready var fiv_character_body_2d: CharacterBody2D = $Controll5/CharacterBody2D
@onready var six_character_body_2d: CharacterBody2D = $Controll6/CharacterBody2D
@onready var svn_character_body_2d: CharacterBody2D = $Controll7/CharacterBody2D
@onready var eght_character_body_2d: CharacterBody2D = $Controll8/CharacterBody2D
@onready var note_set: Node = $NoteSet

var in_menu : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	note_set.ready_()
	character_body_2d._ready()
	two_character_body_2d._ready()
	three_character_body_2d._ready()
	for_character_body_2d._ready()
	fiv_character_body_2d._ready()
	six_character_body_2d._ready()
	svn_character_body_2d._ready()
	eght_character_body_2d._ready()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	note_set.process_(delta)
	character_body_2d._process(delta)
	two_character_body_2d._process(delta)
	three_character_body_2d._process(delta)
	for_character_body_2d._process(delta)
	fiv_character_body_2d._process(delta)
	six_character_body_2d._process(delta)
	svn_character_body_2d._process(delta)
	eght_character_body_2d._process(delta)
	
func _input(event: InputEvent) -> void:
	character_body_2d.input_(event)
	two_character_body_2d.input_(event)
	three_character_body_2d.input_(event)
	for_character_body_2d.input_(event)
	fiv_character_body_2d.input_(event)
	six_character_body_2d.input_(event)
	svn_character_body_2d.input_(event)
	eght_character_body_2d.input_(event)

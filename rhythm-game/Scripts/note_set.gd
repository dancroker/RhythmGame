extends Node

var internal_timer : float = 0
@onready var note: Area2D = $Note
@onready var note_2: Area2D = $Note2
@onready var note_3: Area2D = $Note3
@onready var note_4: Area2D = $Note4
@onready var note_5: Area2D = $Note5
@onready var note_6: Area2D = $Note6
@onready var note_7: Area2D = $Note7
@onready var note_8: Area2D = $Note8

@onready var label: Label = $Label
@onready var label_2: Label = $Label2
@onready var label_3: Label = $Label3
@onready var label_4: Label = $Label4

var perfect = 0
var close = 0
var bad = 0
# Called when the node enters the scene tree for the first time.
func ready_() -> void:
	note.ready_()
	note_2.ready_()
	note_4.ready_()
	note_3.ready_()
	note_5.ready_()
	note_6.ready_()
	note_7.ready_()
	note_8.ready_()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func process_(delta: float) -> void:
	note.process_(delta)
	note_2.process_(delta)
	note_3.process_(delta)
	note_4.process_(delta)
	note_5.process_(delta)
	note_6.process_(delta)
	note_7.process_(delta)
	note_8.process_(delta)
	
	score_track()
	
	label.text = "Perfect: " + str(perfect)
	label_2.text = "Close: " + str(close)
	label_3.text = "Bad: " + str(bad)
	
	if perfect > close+2 and perfect > bad+2:
		label_4.text = "S"
	elif close > bad:
		label_4.text = "B"
	else:
		label_4.text = "C"
	
	internal_timer += delta
	#print(internal_timer)
	match int(internal_timer):
		3:
			note.launch(2)
		6: 
			note_2.launch(1)
		7:
			note_8.launch(1)
		9:
			note.launch(1)
		12:
			note_4.launch(2)
		15:
			note_6.launch(1)
		16:
			note_7.launch(2)
		18:
			note_3.launch(1)
		19:
			note_5.launch(2)
			
		22:
			note.launch(1)
			note_2.launch(2)
			note_3.launch(1)
			note_4.launch(2)
			note_5.launch(1)
			note_6.launch(2)
			note_7.launch(1)
			note_8.launch(2)
			
func score_track():
	var score = note.getscore()
	score_update(score)
	score = note_2.getscore()
	score_update(score)
	score = note_3.getscore()
	score_update(score)
	score = note_4.getscore()
	score_update(score)
	score = note_5.getscore()
	score_update(score)
	score = note_6.getscore()
	score_update(score)
	score = note_7.getscore()
	score_update(score)
	score = note_8.getscore()
	score_update(score)
	


func score_update(score):
	if score == 3:
		perfect+=1
	elif score == 2:
		close+=1
	elif score == 1:
		bad+=1

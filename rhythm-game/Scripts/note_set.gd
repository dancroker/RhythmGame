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

func round_to_dp(value: float, dp: int) -> float:
	var multiplier = pow(10, dp)
	return round(value * multiplier) / multiplier

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
	#print (internal_timer)
	#print(internal_timer)
	print(round_to_dp(internal_timer,1))
	match (round_to_dp(internal_timer,1)):
		2.0:
			note.launch(2)
		3.0: 
			note_2.launch(1)
		4.0:
			note_4.launch(2)
		6.0:
			note_5.launch(1)
		7.0:
			note_7.launch(2)
		9.0:
			note_8.launch(1)
		10.0:
			note_7.launch(2)
		10.4:
			note.launch(1)
		11.0:
			note_6.launch(1)
		12.0:
			note_3.launch(1)
		13.0:
			note_4.launch(1)
		13.1:
			note_5.launch(2)
		13.3:
			note_6.launch(2)
		13.5:
			note_7.launch(1)
		13.8:
			note_8.launch(1)
		14.0:
			note.launch(2)
		15.0:
			note_3.launch(1)
		16.0:
			note_5.launch(2)
		17.0:
			note_4.launch(1)
		17.3:
			note_7.launch(2)
		17.6:
			note_4.launch(1)
		18.0:
			note_8.launch(2)
		18.3:
			note_6.launch(2)	
		18.5:
			note_4.launch(2)
		18.7:
			note_2.launch(2)
		18.9:
			note.launch(1)
		19.1:
			note_3.launch(1)
		19.4:
			note_5.launch(1)
		19.6:
			note_7.launch(1)
		19.8:
			note_3.launch(1)
		20.0:
			note.launch(1)
		21.0:
			note_5.launch(2)
		21.5:
			note.launch(1)
		22.0:
			note_4.launch(2)
		22.5:
			note_8.launch(2)
		23.0:
			note_4.launch(1)
		23.4:
			note_3.launch(1)
		23.8:
			note_6.launch(2)
		24.2:
			note_2.launch(2)
		25.0:
			note_7.launch(1)
		26.0:
			note.launch(1)
		27.0:
			note_5.launch(2)
			print("1")
		27.4:
			note_4.launch(1)
			print("2")
		27.6:
			note_5.launch(2)
			print("3")
		27.9:
			note_6.launch(2)
			print("4")
		28.1:
			note_8.launch(2)
			print("5")
		28.4:
			note_4.launch(2)
			print("6")
		28.9:
			note_2.launch(1)
			print("7")
		29.2:
			note_4.launch(1)
			print("1")
		29.6:
			note_7.launch(2)
			print("1")
		29.8:
			note_3.launch(2)
			print("1")
		30.4:
			note_6.launch(1)
			print("1")
		30.8:
			note_2.launch(2)
			print("1")
		31.4:
			note.launch(2)
			print("1")
		31.8:
			note_6.launch(1)
		32.0:
			note_8.launch(1)
		32.2:
			note.launch(2)
		32.4:
			note_2.launch(1)
		32.6:
			note_3.launch(2)
		32.8:
			note_4.launch(2)
		33.2:
			note_7.launch(2)
		33.6:
			note_4.launch(2)
		34.0:
			note_7.launch(2)
		35.0:
			note.launch(1)
		36.0:
			note_6.launch(2)
		37.3:
			note_8.launch(1)
		37.5:
			note.launch(2)
		37.8:
			note_3.launch(1)
		38.0:
			note_7.launch(1)
		38.5:
			note_5.launch(2)
		39.0:
			note_2.launch(2)
		39.7:
			note_4.launch(1)
		40.0:
			note_6.launch(2)
		40.6:
			note.launch(1)
		41.2:
			note_7.launch(1)
		41.8:
			note_4.launch(2)
		42.4:
			note_8.launch(1)
		42.8:
			note.launch(2)
		43.0:
			note_3.launch(1)
		44.0:
			note_5.launch(2)
		45.0:
			note_7.launch(1)
		46.0:
			note_2.launch(2)
		46.5:
			note_4.launch(2)
		48.0:
			note.launch(1)

			
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

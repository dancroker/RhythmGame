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
@onready var Demo_music = $Demo_music

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
	

func _process(delta) -> void:
	if !$AudioStreamPlayer.is_playing():
		$AudioStreamPlayer.stream = preload("res://Scripts/simpsons_demo_theme.mp3")
		$AudioStreamPlayer.play()

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
	print(round_to_dp(internal_timer,2))
	match (round_to_dp(internal_timer,2)):
		
		
		2.12:
			note.launch(2)
		3.07: 
			note_2.launch(1)
		4.03:
			note_4.launch(2)
		9.12:
			note_5.launch(1)
		10.00:
			note_7.launch(2)
		10.12:
			note_8.launch(1)
		10.21:
			note_7.launch(2)
		11.21:
			note.launch(1)
		11.00:
			note_6.launch(1)
		12.00:
			note_3.launch(1)
		12.12:
			note_4.launch(1)
		12.21:
			note_5.launch(2)
		13.21:
			note_7.launch(1)
		14.12:
			note_8.launch(1)
		15.03:
			note_2.launch(2)
		17.21:
			note.launch(1)
		17.30:
			note_7.launch(2)
		17.60:
			note_6.launch(1)
		18.00:
			note_8.launch(2)
		18.16:
			note_2.launch(2)
		19.00:
			note_5.launch(1)
		19.20:
			note_4.launch(1)
		20.00:
			note_3.launch(1)
			print("test")
		21.06:
			note.launch(1)
		21.5:
			note_7.launch(2)
		22.03:
			note_2.launch(1)
		22.25:
			note_5.launch(2)
		23.00:
			note_8.launch(2)
		23.12:
			note_4.launch(1)
		24.00:
			note_6.launch(2)
		24.21:
			note_2.launch(2)
		25.06:
			note_7.launch(1)
		25.15:
			note.launch(1)
		26.00:
			note_5.launch(2)
			print("1")
		27.00:
			note_4.launch(1)
			print("2")
		28.12:
			note_6.launch(2)
			print("4")
		29.00:
			note_8.launch(2)
			print("5")
		28.23:
			note.launch(2)
			print("6")
		29.00:
			note_2.launch(1)
			print("7")
		30.12:
			note_7.launch(2)
			print("1")
		31.06:
			note_3.launch(2)
			print("1")
		31.15:
			note_4.launch(1)
			print("1")
		33.03:
			note_2.launch(2)
			print("1")
		33.12:
			note_5.launch(2)
			print("1")
		33.21:
			note_6.launch(1)
		34.06:
			note_8.launch(2)
		34.12:
			note_7.launch(1)
		35.00:
			note_4.launch(2)
		35.21:
			note_3.launch(2)
		36.09:
			note_2.launch(2)
		37.06:
			note.launch(1)
		37.18:
			note_6.launch(2)
		38.12:
			note_8.launch(1)
		39.03:
			note.launch(2)
		39.20:
			note_7.launch(1)
		40.16:
			note_5.launch(2)
		41.06:
			note_2.launch(2)
		42.03:
			note_4.launch(1)
		42.18:
			note_6.launch(2)
		45.15:
			note.launch(1)
		46.03:
			note_7.launch(1)
		46.12:
			note_4.launch(2)
		47.03:
			note_8.launch(1)
		47.15:
			note.launch(2)
		48.12:
			note_3.launch(1)
		49.06:
			note_5.launch(2)
		49.15:
			note_7.launch(1)
		50.00:
			note_2.launch(2)
		50.18:
			note_4.launch(2)
		51.06:
			note.launch(1)
		51.21:
			note_6.launch(1)
		53.00:
			note_8.launch(2)
		55.50:
			note_6.launch(2)
		55.70:
			note_4.launch(1)
		55.90:
			note_5.launch(1)
		57.03:
			note_2.launch(2)
		59.03:
			note_7.launch(2)
		59.21:
			note.launch(2)
		61.06:
			note_3.launch(1)
		61.21:
			note_2.launch(2)
		62.12:
			note_4.launch(1)
		63.06:
			note_5.launch(1)
		64.00:
			note_8.launch(2)
		64.18:
			note_6.launch(1)
		65.03:
			note.launch(2)
		65.12:
			note_7.launch(2)
		66.00:
			note_3.launch(1)
		67.06:
			note_5.launch(2)
		67.15:
			note_2.launch(1)
		68.00:
			note_4.launch(2)
		68.09:
			note_8.launch(2)
		69.09:
			note.launch(1)
		71.12:
			note_6.launch(2)
		72.00:
			note_2.launch(1)
		72.21:	
			note_4.launch(1)
		73.18:
			note_7.launch(2)
		74.06:
			note_3.launch(2)
		74.18:
			note_5.launch(1)
		75.18:
			note.launch(2)
		76.06:
			note_8.launch(1)
		77.00:
			note_7.launch(1)
		77.03:
			note_6.launch(1)
		77.06:
			note_5.launch(2)

			
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

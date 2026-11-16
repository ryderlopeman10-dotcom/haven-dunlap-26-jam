extends Label
@onready var label: Label = $"."

func _process(delta):
	label.text = "Previous Score: " + str(Globals.score) + "\nHigh Score: " + str(Globals.high_score)
	

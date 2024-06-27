extends Control

func _ready():
	$ReturnButton.grab_focus()


func on_ReturnButton_pressed():
	queue_free()

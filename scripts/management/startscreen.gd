extends Control

func _ready():
	$Controls/StartButton.grab_focus()


func on_StartButton_pressed() -> void:
	get_tree().change_scene("res://scenes/management/game_level.tscn")


func on_ControlsButton_pressed() -> void:
	var control_screen = load("res://scenes/management/ControlsScreen.tscn").instance()
	get_tree().current_scene.add_child(control_screen)


func on_CreditsButton_pressed() -> void:
	var credits_screen = load("res://scenes/management/CreditsScene.tscn").instance()
	get_tree().current_scene.add_child(credits_screen)


func on_QuitButton_pressed() -> void:
	get_tree().quit()

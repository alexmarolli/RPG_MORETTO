extends StaticBody2D
class_name Npc

onready var quest_mark: Sprite = get_node("QuestMark")

var is_quest_finished: bool = false
var can_interact: bool = false
var player_ref: KinematicBody2D = null

export(Array, String) var dialog_text
export(Array, String) var special_text


func _ready() -> void:
	Global.enemies_dict[4] = self

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_interact") and can_interact:
		can_interact = false
		player_ref.freeze(false)
		
		if is_quest_finished:
			get_tree().call_group("interface", "spawn_dialog", self, special_text)
			return
			
		get_tree().call_group("interface", "spawn_dialog", self, dialog_text)
	

func on_body_entered(body) -> void:
	if body is Player:
		player_ref = body
		can_interact = true
		quest_mark.visible = true
		


func on_body_exited(body) -> void:
	if body is Player:
		player_ref = null
		can_interact = false
		quest_mark.visible = false
		
func on_dialog_finished() -> void:
	can_interact = true
	player_ref.freeze(true)

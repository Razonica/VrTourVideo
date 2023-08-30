extends Node2D

onready var bridge = preload("res://VID_20230801_130230_941.ogv")
onready var beach = preload("res://VID_20230801_130227_162.ogv")

onready var vidPlay = find_node('VideoPlayer')
onready var switch_buttons = find_node('SwitchVidButtons')
var move_px = 40
var move_while_px = 20
var moving : bool = false
onready var timer = find_node('Timer')

func _ready():
	for x in switch_buttons.get_children():
		x.connect('pressed', self, 'switch_pressed', [x.call_func])

func button_up():
	moving = false

func clamp_vid():
	vidPlay.rect_position.x = clamp(vidPlay.rect_position.x, -640, 0)
	vidPlay.rect_position.y = clamp(vidPlay.rect_position.y, -360, 0)

func _on_upButton_pressed():
	vidPlay.rect_position.y += move_while_px
	clamp_vid()

func _on_upButton_down():
	moving = true
	while moving:
		vidPlay.rect_position.y += move_while_px
		timer.start()
		yield(timer, "timeout")
		clamp_vid()

func _on_downButton_pressed():
	vidPlay.rect_position.y -= move_while_px
	clamp_vid()
	
func _on_downButton_down():
	moving = true
	while moving:
		vidPlay.rect_position.y -= move_while_px
		timer.start()
		yield(timer, "timeout")
		clamp_vid()

func _on_rightButton_pressed():
	vidPlay.rect_position.x += move_while_px
	clamp_vid()

func _on_rightButton_down():
	moving = true
	while moving:
		vidPlay.rect_position.x += move_while_px
		timer.start()
		yield(timer, "timeout")
		clamp_vid()

func _on_leftButton_pressed():
	vidPlay.rect_position.x -= move_while_px
	clamp_vid()

func _on_leftButton_down():
	moving = true
	while moving:
		vidPlay.rect_position.x -= move_while_px
		timer.start()
		yield(timer, "timeout")
		clamp_vid()

func _on_VideoPlayer_finished():
	vidPlay.play()


func switch_pressed(x):
	vidPlay.stop()
	vidPlay.stream = get(x)
	vidPlay.play()


func _on_Button_pressed():
	get_tree().change_scene("res://pictures/PhotoNavi.tscn") # Replace with function body.

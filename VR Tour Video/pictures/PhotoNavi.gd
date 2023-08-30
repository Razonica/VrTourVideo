extends Control

onready var photos = find_node('Photos2')
onready var left_button = find_node('LeftButton')
onready var right_button = find_node('RightButton')
var pictures
var vis = 0

func _ready():
	pictures = photos.get_children()
	
func next():
	vis += 1
	
	if vis > pictures.size()-1:
		vis = 0
		for x in pictures:
			x.hide()
		pictures[vis].show()
		
	else:
		for x in pictures:
			x.hide()
		pictures[vis].show()

func prev():
	vis -= 1
	
	if vis < 0:
		vis = pictures.size()-1
		for x in pictures:
			x.hide()
		pictures[vis].show()
		
	else:
		for x in pictures:
			x.hide()
		pictures[vis].show()



func _on_LeftButton_pressed():
	prev() # Replace with function body.


func _on_RightButton_pressed():
	next() # Replace with function body.


func _on_ChangeSceneButton_pressed():
	get_tree().change_scene("res://VideoNavi.tscn") # Replace with function body.

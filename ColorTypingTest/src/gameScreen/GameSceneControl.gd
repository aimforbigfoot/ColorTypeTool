extends Control

var letters := ["a","b","c","d","e",
"f","g","h","i","j","k","l","m","n",
"o","p","q","r","s","t","u","v","w",
"x","y","z"]
var nums_of_letters :Array= [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25]
var count := 0
var good_count := 0
var mistake_count := 0
var letters_done_arr := []
var letter_on : int 
var letter_pressed : int
onready var letterLabel := $VBoxContainer/letterLabel
onready var youClicked := $VBoxContainer/youClicked
onready var yourMistakes := $VBoxContainer/yourMistakes

func _ready() -> void:
	randomize()
	nums_of_letters.shuffle()
	get_rand_letter()

#65 = A  			 90 = Z
func _unhandled_key_input(event: InputEventKey) -> void:
#	print("you are on ",letter_on)
	if event and (event.scancode >= 65 and event.scancode <= 90):
		letter_pressed = get_lerped_value(event.scancode)
		if letter_on == letter_pressed:
			get_rand_letter()
			good_count += 1
		elif not letter_on == letter_pressed:
			mistake_count += 1
		youClicked.text = ("You clicked: " + letters[letter_pressed])
		yourMistakes.text = ("You clicked " + str(good_count)+" letters out of " + str(mistake_count))
	if event.is_action_pressed("esc"):
		get_tree().change_scene("res://src/homeScreen/HomeScreen.tscn")


func get_lerped_value(pressed_num) -> int:
#	print("you gave me ", var_int)
	var var_int : int = 0
	var_int = floor(range_lerp(pressed_num, 65,90,0,25))
#	check_if_num_is_the_same(var_int,pressed_num)
#	letters_done_arr.append(var_int)
	return var_int


func check_if_num_is_the_same(var_int:int, pressed_num:int) -> void:
	pass



func get_rand_letter() -> void:
	var rand_num :int= nums_of_letters[count]
	count += 1
	if count == 25:
		nums_of_letters.shuffle()
		count = 0

#			get_rand_letter()
	letterLabel.text = (letters[rand_num])
	letterLabel.modulate = Colors.letter_color_arr[rand_num]
	letters_done_arr.append(rand_num)
	letter_on = rand_num
#	print(letters_done_arr, "	", rand_num)



#	var rand_num := floor(rand_range(0,letters.size()))
#
#	if letters_done_arr.size() == (letters.size()-10):
#		letters_done_arr.clear()
#	for num in letters_done_arr:
#		if num == rand_num:

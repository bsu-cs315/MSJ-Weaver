extends Node2D

@export var frog_number = 100
var pressure = 0

@export var frog_types : Array[String] = [
	"res://frogs/frog_1.tscn",
	"res://frogs/frog_2.tscn",
	"res://frogs/frog_3.tscn",
	"res://frogs/frog_4.tscn",
	"res://frogs/frog_5.tscn"
]

@onready var _frog_position := self.position + Vector2(60,100)
@onready var _frogs := $frogs


func _ready():

	while frog_number > 0:
		$frog_counter_label.text = "Demons Left: %d" % ceil(frog_number)
		var scene_path : String = frog_types.pick_random()
		var object : Node2D = load(scene_path).instantiate()
		object.global_position = _frog_position
		_frogs.add_child(object)
		await get_tree().create_timer(1.0 - pressure).timeout
		frog_number -= 1
		pressure +=.01
	$frog_counter_label.text = "Congrats You Little Monster!!"
	await get_tree().create_timer(10.0).timeout
	get_tree().change_scene_to_file("res://menu/menu.tscn")

extends Control

func _ready():
	var tween = get_tree().create_tween().set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property($title_1, "position", Vector2(800, 100), 1)
	
	var tween2 = get_tree().create_tween().set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_IN_OUT)
	tween2.tween_property($title_2, "position", Vector2(840, 300), 1)
	
	var tween3 = get_tree().create_tween().set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_IN_OUT)
	tween3.tween_property($title_3, "position", Vector2(950, 500), 1)
	

func _on_play_pressed():
	$start.play()
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://world/world.tscn")


func _on_quit_pressed():
	get_tree().quit()

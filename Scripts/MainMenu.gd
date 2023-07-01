extends Control


func _ready():
	$ParallaxBackground/Control2/AnimatedSprite.play("default")

# Play Btn
func _on_Play_pressed():
	get_tree().change_scene("res://Scenes/jungle/jungle.tscn")


# Quit btn
func _on_Exit_pressed():
	get_tree().quit()

extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta


	if randf() > .99 and is_on_floor():
		velocity.y = JUMP_VELOCITY



	velocity.x = SPEED

	move_and_slide()
	

func _on_area_2d_body_entered(body):
	
	if body.is_in_group("player"):
		body.game_over()
	if body.is_in_group("hook"):
		$death.play()
		await get_tree().create_timer(.1).timeout
		queue_free()
		

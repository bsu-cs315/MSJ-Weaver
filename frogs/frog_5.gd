extends CharacterBody2D


const SPEED = 80
const JUMP_VELOCITY = -200.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if randf() > .93: 
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.

	velocity.x = SPEED

	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		body.game_over() 
	if body.is_in_group("hook"):
		$flying_death.play()
		gravity = gravity * 2
		await get_tree().create_timer(1).timeout
		queue_free()

extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -280.0

@onready var anim = $Sprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Mov_Left", "Mov_Right")
	
	if direction > 0:
		anim.flip_h = false
	elif direction < 0:
		anim.flip_h = true

	#if not is_on_floor() && velocity.y<0:
		#anim.play("Jump")
	#elif direction != 0:
		#anim.play("Walk")
	#else:
		#anim.play("Idle")
	#
	if is_on_floor():
		if direction == 0:
			anim.play("Idle")
		else: 
			anim.play("Walk")
	else:
		if velocity.y < 0:
			anim.play("Jump")
		else:
			if anim.animation != "Fall":
				anim.play("Fall")
	if direction:
		velocity.x = direction * SPEED
		#anim.flip_h=direction<0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	

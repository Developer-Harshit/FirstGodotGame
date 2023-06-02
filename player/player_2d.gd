extends CharacterBody2D

#Get Player move according to input
#Set velocity * speed in that direction
#Move the fucking player

@export var speed: int  = 100
@export var lerpValue: float  = 0.43

func stepLerp(start,final,t):
	var tValue = t*t*t *(t*(1.000000 *t - 1.000000) + 1.0000000000)
	return start + (final - start)* tValue
func handleInput():
	var moveDir = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = stepLerp(velocity,moveDir * speed,lerpValue)

	
func _physics_process(delta):
	handleInput()
	move_and_slide()

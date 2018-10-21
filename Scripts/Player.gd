extends KinematicBody2D

const SPEED =  750
const GRAVITY = 3600
const UP = Vector2(0,-1)
const JUMP_SPEED = -1100
const KNOCKBACK = -1500
const JUMP_BOOST = 2

var hurt = false
var motion = Vector2()
var key = false

var notepad = false;
var avast = false;


func _ready():
	Global.Player = self

func _process(delta):
	_update_animation(motion)

func _update_animation(motion):
	$AnimatedSprite.update_animation(motion)

func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	fall(delta)
	run()
	jump ()
	move_and_slide(motion,UP)

func fall(delta):
	if is_on_floor():
		motion.y = 0
	elif is_on_ceiling():
		# Forces an immediate drop when hitting the ceiling
		motion.y = GRAVITY * delta
	else:
		motion.y += GRAVITY * delta

func run():
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = -SPEED
		
	else: 
		motion.x = 0

func jump(): 
	if is_on_floor() and Input.is_action_pressed("ui_up"):
		motion.y = JUMP_SPEED
		#Global.jump_sfx.play()

func boost():
	motion.y = JUMP_SPEED * JUMP_BOOST

func hurt():
	motion.y = KNOCKBACK
	hurt = true
	$AnimatedSprite.play("hurt")
	$Timer.start()

func _on_Timer_timeout():
	hurt = false

extends KinematicBody2D

const SPEED =  750
const GRAVITY = 3600
const UP = Vector2(0,-1)
const JUMP_SPEED = -1100
const KNOCKBACK = -1500
const JUMP_BOOST = 2

var hurt = false
var notmoving = false
var motion = Vector2()

var _keySprite = preload("res://xNotepadSprite.tscn")
var _notepadSprite = preload ("res://NotepadSprite.tscn")
var _avastSprite = preload ("res://AvastSprite.tscn")
var key = false
var notepad = false;
var avast = false;

var qtdDamage = 0

func _ready():
	Global.Player = self

func _process(delta):
	_update_animation(motion)

func _update_animation(motion):
	$AnimatedSprite.update_animation(motion)

func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	if not Global.Player.notmoving:
		run()
		jump ()
		move_and_slide(motion,UP)
		fall(delta)

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

	
func take_damage(x,y):
	SPEED = SPEED/2
	
	var novoAvastGrudado = preload("res://avastGrudado.tscn").instance()
	get_node(".").add_child(novoAvastGrudado)
	novoAvastGrudado.position = Vector2(x,y) - self.position
	qtdDamage = qtdDamage +1
	
func take_damage_off():
	SPEED = SPEED*2
	qtdDamage = qtdDamage-1
	
	
func pickup_key(wichkey):
	if wichkey == "xnotepad":
		var keySprite = _keySprite.instance()
		add_child(keySprite)
		key = true
	elif wichkey == "notepadicon":
		var notepadSprite = _notepadSprite.instance()
		add_child(notepadSprite)
		Global.IconKeyNotepad = true
	elif wichkey == "avasticon":
		var avastSprite = _avastSprite.instance()
		add_child(avastSprite)
		Global.IconKeyAvast = true

func destroy_key(wichkey):
	if wichkey == "xnotepad":
		$xNotepadSprite.queue_free()
		key = false
	elif wichkey == "notepadicon":
		$NotepadSprite.queue_free()
		Global.IconKeyNotepad = false
		notepad = true
	elif wichkey == "avasticon":
		$AvastSprite.queue_free()
		Global.IconKeyAvast = false
		avast = true
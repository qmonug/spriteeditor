extends Control

var is_alt = false



var pos1 = Vector2.ZERO
var pos2 = Vector2.ZERO
func _update_pos():
	if $Sprite/pos.pressed:
		pos1 = get_global_mouse_position() - $Sprite.position
		if Input.is_action_just_pressed("lmb"):
			pos2 = -(get_global_mouse_position() - $Sprite.position)
		$Sprite.position += pos1+pos2





var qa = Vector2.ZERO
func _update_scale(var mar):
	
	#handle scale
	var c = (get_global_mouse_position() - $Sprite.position) / Vector2(32,32)
	$Sprite.scale.y = abs(c.y)
	$Sprite.scale.x = abs(c.x)
	
	#handle position
	if Input.is_action_just_pressed("lmb"):
		qa = $Sprite.position + mar*$Sprite.scale
	$Sprite/Scale.modulate = Color(1,1,1,0)
	if !is_alt:
		var qb = ($Sprite.position + (get_global_mouse_position() - $Sprite.position))
		var qc = (qa+qb)/2
		$Sprite.position = qc
		
		#this is qa and qb's position!
		$qa.position = qa
		$qb.position = qb



onready var texture_size = $Sprite.texture.get_size()


func _process(delta):
	
	
	if Input.is_action_pressed("alt"):
		is_alt = true
		$AltMode.pressed = true
	else:
		is_alt = false
		$AltMode.pressed = false
	
	
	_update_pos()
	
	
	if $Sprite/Scale/UpRight.pressed:
		_update_scale(Vector2(-32,32))
	elif $Sprite/Scale/UpLeft.pressed:
		_update_scale(Vector2(32,32))
	elif $Sprite/Scale/DownRight.pressed:
		_update_scale(Vector2(-32,-32))
	elif $Sprite/Scale/DownLeft.pressed:
		_update_scale(Vector2(32,-32))
	else:
		$Sprite/Scale.modulate = Color(1,1,1,1)
	
	
	
	
	
	$Label.text = "mouse position "+str(get_global_mouse_position())+\
	 "\nsprite position ("+str(int($Sprite.position.x),", ",int($Sprite.position.x),")")+\
	 "\nsprite scale "+str($Sprite.scale)



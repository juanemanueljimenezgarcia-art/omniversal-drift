extends CharacterBody2D

@export var velocidad: float = 200.0

@onready var sprite: AnimatedSprite2D = $AnimacionesMary

func _physics_process(delta: float) -> void:
	var direccion = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	velocity = direccion * velocidad
	
	if direccion != Vector2.ZERO:
		if abs(direccion.x) > abs(direccion.y):
			sprite.play("Caminar_lados")
			if direccion.x < 0:
				sprite.flip_h = true
			else:
				sprite.flip_h = false
		else:
			if direccion.y < 0:
				sprite.play("Caminar_Arriba")
			else:
				sprite.play("Caminar_Abajo")
	else:
		sprite.stop()
		
	move_and_slide()

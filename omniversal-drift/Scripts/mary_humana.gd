extends CharacterBody2D

@export var velocidad: float = 200.0

@onready var sprite: AnimatedSprite2D = $AnimacionesMH

# Guardamos la última dirección horizontal para mantener el flip_h en el idle de los lados
var ultima_direccion_x: float = 1.0

func _physics_process(delta: float) -> void:
	var direccion = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	velocity = direccion * velocidad
	
	if direccion != Vector2.ZERO:
		# Movimiento
		if abs(direccion.x) > abs(direccion.y):
			sprite.play("Caminar_lados")
			if direccion.x < 0:
				sprite.flip_h = true
				ultima_direccion_x = -1.0
			else:
				sprite.flip_h = false
				ultima_direccion_x = 1.0
		else:
			if direccion.y < 0:
				sprite.play("Caminar_arriba")
			else:
				sprite.play("Caminar_abajo")
	else:
		# Estados Idle (reposo) basados en la última animación o dirección
		# Verificamos cuál fue la última animación activa o la dirección predominante
		if sprite.animation == "Caminar_lados" or sprite.animation == "Idle_1":
			sprite.play("Idle_1")
			# Mantiene el flip_h de la última dirección a los lados
			sprite.flip_h = (ultima_direccion_x < 0)
		elif sprite.animation == "Caminar_arriba" or sprite.animation == "Idle_2":
			sprite.play("Idle_2")
		elif sprite.animation == "Caminar_abajo" or sprite.animation == "Idle_3":
			sprite.play("Idle_3")
		else:
			# Por defecto si acaba de iniciar o hay conflicto
			sprite.play("Idle_3")
		
	move_and_slide()

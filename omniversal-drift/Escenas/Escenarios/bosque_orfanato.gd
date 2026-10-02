extends Area2D

# Ruta a la escena bosque_1 (verifica la carpeta exacta en tu Sistema de Archivos)
const ESCENA_BOSQUE = "res://Escenas/Escenarios/orfanato.tscn"

func _on_body_entered(body: Node2D) -> void:
	# Verifica que sea el personaje (Mary) quien toca la reja
	if body.name == "Mary":
		get_tree().change_scene_to_file(ESCENA_BOSQUE)

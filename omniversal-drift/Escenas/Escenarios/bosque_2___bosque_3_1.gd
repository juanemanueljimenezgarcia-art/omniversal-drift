extends Area2D

# Ruta a la escena bosque_1 (verifica la carpeta exacta en tu Sistema de Archivos)
const ESCENA_BOSQUE = "res://Escenas/Escenarios/bosque_3.tscn"

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Mary":
		Global.punto_entrada = "Salida2Bosque2"
		get_tree().change_scene_to_file("res://Escenas/Escenarios/bosque_3.tscn")

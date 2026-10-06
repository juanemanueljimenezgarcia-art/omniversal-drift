extends Area2D

const ESCENA_BOSQUE = "res://Escenas/Escenarios/bosque_2.tscn"

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Mary":
		Global.punto_entrada = "EntradaBosque2"
		get_tree().change_scene_to_file(ESCENA_BOSQUE)

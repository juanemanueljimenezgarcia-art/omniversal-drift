extends Node2D

@onready var mary: CharacterBody2D = $Mary

func _ready() -> void:
	if Global.punto_entrada != "":
		# Busca el Marker2D cuyo nombre coincida con Global.punto_entrada
		var punto: Marker2D = get_node_or_null(Global.punto_entrada)
		if punto:
			mary.global_position = punto.global_position

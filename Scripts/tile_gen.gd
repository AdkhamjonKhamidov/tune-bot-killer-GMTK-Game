extends Node2D

@onready var tiles: TileMapLayer = $TileMap
var top_right = [39,-1] 
var bottom_left = [0, 20]

func make_floor() -> void:
	for i in range(top_right[0]+1):
		for j in range(top_right[1],bottom_left[1]+1):
			tiles.set_cell(Vector2i(i, j),0, Vector2i(5,3))

func make_border() -> void:
	for i in range(top_right[0]+1):
		for j in range(top_right[1],bottom_left[1]+1):
			if i == top_right[0] || i == bottom_left[0] || j == top_right[1] || j == bottom_left[1]:
				tiles.set_cell(Vector2i(i, j),0, Vector2i(7,1))

func _ready() -> void:
	make_floor()
	make_border()

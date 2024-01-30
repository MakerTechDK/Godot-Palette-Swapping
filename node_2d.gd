extends Node2D

@onready var sprite = $Sprite2D
@export var palettes: Array[Texture2D]
@export var current_palette: int = 0

var palette_arrays = []


func _ready() -> void:
	for palette in palettes:
		var palette_data = palette.get_image()
		var palette_array: Array[Color]
		for i in range(0, palette_data.get_size().x):
			palette_array.append(palette_data.get_pixel(i, 0))
			
		palette_arrays.append(palette_array)
			
	set_palette()
	

func set_palette() -> void:
	var mat = sprite.material as ShaderMaterial
	
	mat.set_shader_parameter("newPalette", palette_arrays[current_palette])


func change_palette() -> void:
	current_palette += 1
	current_palette %= palettes.size()
	
	set_palette()
	

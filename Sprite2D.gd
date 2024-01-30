extends Sprite2D


@export var palette_texture: Texture2D

func _ready() -> void:
	var palette_image = palette_texture.get_image()
	var palette: Array[Color]
	for x in range(palette_image.get_size().x):
			var color = palette_image.get_pixel(x, 0)
			palette.append(color)
			
	var texData = texture.get_image()
	var texSize = texData.get_size()
	
	for x in range(texSize.x):
		for y in range(texSize.y):
			var color = texData.get_pixel(x, y)
			var index = palette.find(color)
			if index < 0:
				texData.set_pixel(x, y, Color(0, 0, 0))
			else:	
				texData.set_pixel(x, y, Color(float((index+1) / 255.0), 0, 0))
			
	texture = ImageTexture.create_from_image(texData)

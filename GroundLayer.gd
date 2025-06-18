extends TileMapLayer

@onready var shaderMaterial = material as ShaderMaterial

func generateBitcodeMap() -> ImageTexture:
	var size:Vector2i = get_used_rect().size
	var image:Image = Image.create(size.x,size.y,false,Image.FORMAT_R8)
	
	for x in size.x:
		for y in size.y:
			var bit:int = 0;
			if get_cell_source_id(Vector2i(x,y)) == -1 : bit=16
			else:
				if get_cell_source_id(Vector2i(x,y) + Vector2i.UP   ) == -1 : bit+=1
				if get_cell_source_id(Vector2i(x,y) + Vector2i.RIGHT) == -1 : bit+=2
				if get_cell_source_id(Vector2i(x,y) + Vector2i.DOWN ) == -1 : bit+=4
				if get_cell_source_id(Vector2i(x,y) + Vector2i.LEFT ) == -1 : bit+=8
			image.set_pixel(x,y,Color(bit,0,0))
	
	return ImageTexture.create_from_image(image)

func _ready() -> void:
	shaderMaterial.set_shader_parameter("proximityMap", generateBitcodeMap())

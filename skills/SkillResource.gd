extends Resource
class_name SkillResource

@export var name: String
@export var texture: Texture2D
@export var cooldown: float = 1.0
#TODO targeting types
#no target, toggle, target point, target area, target unit
@export_enum("none","toggle","point","unit","area") var targeting: int


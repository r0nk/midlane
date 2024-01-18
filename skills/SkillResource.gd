extends Resource
class_name SkillResource

@export var name: String
@export var texture: Texture2D
@export var cooldown: float = 1.0
#TODO targeting types
#no target, toggle, target point, target area, target unit
@export_enum("none","toggle","point","unit","area") var targeting: int
@export_file("*.tscn") var spawned_scene_path: String
@export_enum("projectile","instant","hook") var scene_travel: int
@export var passives: Array[EffectResource]

extends PracticeTester

var expected_rect := [Vector2(0, 0), Vector2(200, 0), Vector2(200, 120), Vector2(0, 120), Vector2(0, 0)]


# We sort vertices for accurate comparison
func _init() -> void:
	expected_rect.sort()


func test_rectangle_starts_at_120_by_100() -> String:
	var turtle: DrawingTurtle = _scene_root_viewport.get_child(0)
	var polygons := turtle.get_polygons()
	var p = polygons[0]
	if not Vector2(120, 100).is_equal_approx(p.position):
		return "The rectangle doesn't start at position (120, 100). Did you not set the position right?"
	return ""

func test_rectangle_size_is_200_by_120() -> String:
	var turtle: DrawingTurtle = _scene_root_viewport.get_child(0)
	var polygons := turtle.get_polygons()
	var points = Array(polygons[0].points)
	points.sort()
	if points != expected_rect:
		return "The drawn shapes don't have the expected length and height. Did you forget to use the length and height parameter?"
	return ""


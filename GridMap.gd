extends Node2D

# These are exported parameters so that the grid dimensions are flexible.
# The actual cells are instantiated at runtime.
@export var n_rows = 20
@export var n_cols = 20

var grid_cell_scene = preload("res://Scenes/Grid/grid_cell.tscn")

# Create and place all grid cells
func _ready():
	for i in range(n_rows):
		for j in range(n_cols):
			_create_and_place_grid_cell(i,j)

# Helper function. Creates and places a single grid cell
func _create_and_place_grid_cell(row, col):
	# Create instance
	var grid_cell_instance = grid_cell_scene.instantiate()
	
	# Calculate and set position
	var grid_cell_size = grid_cell_instance.get_node("CollisionShape2D").shape.get_size()
	grid_cell_instance.position = grid_cell_size * Vector2(row,col)
	
	# Add to grid map
	add_child(grid_cell_instance)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

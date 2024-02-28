extends Node2D

# These are exported parameters so that the grid dimensions are flexible.
# The actual cells are instantiated at runtime.
@export var n_rows = 20
@export var n_cols = 20
@export var grid_cell_offset = 50
@export var item_drops = {} # dictionary that has the item and its chance of dropping

var grid_cells = []

var grid_cell_scene = preload("res://Scenes/Grid/grid_cell.tscn")
var fossil_scene = preload("res://Scenes/Items/Fossil.tscn")

# Create and place all grid cells
func _ready():
	for i in range(n_rows):
		for j in range(n_cols):
			_create_and_place_grid_cell(i,j)
	
	_place_fossils()

# Helper function. Creates and places a single grid cell
func _create_and_place_grid_cell(row, col):
	# Create instance
	var grid_cell_instance = grid_cell_scene.instantiate()
	grid_cells.append(grid_cell_instance)
	
	# Calculate and set position
	var grid_cell_size = grid_cell_instance.get_node("CollisionShape2D").shape.get_size()
	grid_cell_instance.position = grid_cell_size * Vector2(row,col)
	
	# Add to grid map
	add_child(grid_cell_instance)

func _place_fossils():
	var rng = RandomNumberGenerator.new()

	# get total amount of cells
	var total_cells = n_rows * n_cols

	# list of cell indices to place fossils
	var fossil_indices = []

	# loop 8 times
	for i in range(0, 8):
		# loop until random number is not in fossil indices
		while(true):
			var rand_index = rng.randi_range(0, total_cells - 1)

			if !(rand_index in fossil_indices):
				fossil_indices.append(rand_index)
				break

	# loop through fossil_indices
	for i in range(0, len(fossil_indices)):
		# get position of cell
		var spawn_position = grid_cells[fossil_indices[i]].position	
		var fossil_instance = fossil_scene.instantiate()

		fossil_instance.position = Vector2(spawn_position.x + grid_cell_offset, spawn_position.y + grid_cell_offset) 

		# change fossil texture
		fossil_instance.change_texture(i)

		add_child(fossil_instance)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

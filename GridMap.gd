extends Node2D

# These are exported parameters so that the grid dimensions are flexible.
# The actual cells are instantiated at runtime.
@export var n_rows = 20
@export var n_cols = 20
@export var fossil_cell_offset = 50
@export var item_cell_offset = 75
@export var item_drops = {} # dictionary that has the item and its chance of dropping

var total_chance = 0 # total chance of all the item drops

var grid_cells = []
var filled_cells = [] # cells that are already filled with fossils

var grid_cell_scene = preload("res://Scenes/Grid/grid_cell.tscn")
var fossil_scene = preload("res://Scenes/Items/Fossil.tscn")

var player_instance

# Create and place all grid cells
func _ready():
	# calculate total_chance
	for item in item_drops:
		total_chance += item_drops[item]	

	for i in range(n_rows):
		for j in range(n_cols):
			_create_and_place_grid_cell(i,j)
	
	_place_fossils()

	_place_items()

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

		fossil_instance.position = Vector2(spawn_position.x + fossil_cell_offset, spawn_position.y + fossil_cell_offset) 

		# change fossil texture
		fossil_instance.change_texture(i)

		add_child(fossil_instance)

		filled_cells.append(grid_cells[fossil_indices[i]])

# places items that are not fossils
func _place_items():
	var rng = RandomNumberGenerator.new()

	# loop through grid cells
	for i in range(0, len(grid_cells)):
		# only fill cell if cell does not have fossil already
		if !(grid_cells[i] in filled_cells): 	
			# generate random number
			var rand_num = rng.randi_range(0, total_chance - 1)
		
			# get item
			var item = _get_item(rand_num)

			# instantiate the item and place it in the proper position
			var spawn_position = grid_cells[i].position
			var item_instance = item.instantiate()

			item_instance.position = Vector2(spawn_position.x + item_cell_offset, spawn_position.y + item_cell_offset)

			item_instance.connect("started", item_instance.on_start)
			grid_cells[i].item_instance = item_instance

			get_tree().get_root().get_node("Main").add_child(item_instance)


# get the item for the corresponding chance
func _get_item(num):
	var counter = 0
	for item in item_drops:
		# add chance of item to the counter
		counter += item_drops[item]

		# if num is less or equal to counter, then return that item
		if num <= counter:
			return item 

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

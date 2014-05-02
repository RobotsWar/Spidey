# STLs to build
STLS := u side body leg

# Output directory
BUILD_DIR := build

# Targets are $(BUILD_DIR)/file.stl
TARGETS := $(addprefix $(BUILD_DIR)/, $(addsuffix .stl,$(STLS)))

all: $(TARGETS)

build_dir:
	@mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/%.stl: spidey/print/%.scad build_dir
	@echo "Building $@..."
	@openscad $< -o $@ 

view:
	@openscad spidey.scad -o spidey.png --imgsize=1024,768 --camera=400,200,300,0,0,0 
	@eog spidey.png 

csg:
	@openscad spidey.scad -o spidey.csg

movie: csg
	@rm -rf movie-out
	@mkdir -p movie-out
	python movie.py

clean:
	rm -rf $(BUILD_DIR) *.csg movie-out

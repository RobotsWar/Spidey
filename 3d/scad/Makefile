# STLs to build
PARTS := u side body leg

# Output directory
BUILD_DIR := build

# Dimensions for plating
PLATE_W := 280
PLATE_H := 150

# Targets are $(BUILD_DIR)/file.stl
TARGETS := $(addprefix $(BUILD_DIR)/, $(addsuffix .stl,$(PARTS)))
DXFS := $(addprefix $(BUILD_DIR)/, $(addsuffix .dxf,$(PARTS)))

all: $(TARGETS)
dxf: $(DXFS)

build_dir:
	@mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/%.stl: spidey/print/%.scad build_dir
	@echo "Building $@..."
	@openscad $< -o $@ 

$(BUILD_DIR)/%.dxf: spidey/print/%_projection.scad build_dir
	@echo "Building $@..."
	@openscad $< -o $@ 

view:
	@openscad spidey/spidey.scad -o spidey.png --imgsize=1024,768 --camera=400,200,300,0,0,0 
	@eog spidey.png 

csg:
	@openscad spidey/spidey.scad -o spidey.csg

plates: $(BUILD_DIR)/plater.conf
	@echo "Running plater, plate size: $(PLATE_W)x$(PLATE_H)"
	rm build/plate_*
	plater -v -W $(PLATE_W) -H $(PLATE_H) -s 1.8 -R 1 $<

$(BUILD_DIR)/plater.conf: spidey/config.scad parts.py
	@echo "Generating plater.conf"
	python parts.py > $@

movie: csg
	@rm -rf movie-out
	@mkdir -p movie-out
	python movie.py

clean:
	rm -rf $(BUILD_DIR) *.csg movie-out

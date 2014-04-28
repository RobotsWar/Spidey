# STLs to build
STLS := u side body leg

# Output directory
BUILD_DIR := build

# Targets are $(BUILD_DIR)/file.stl
TARGETS := $(addprefix $(BUILD_DIR)/, $(addsuffix .stl,$(STLS)))

all: $(TARGETS)

build_dir:
	@mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/%.stl: parts/%.scad build_dir
	@echo "Building $@..."
	@openscad $< -o $@ 

view:
	@openscad spidey.scad -o spidey.png --imgsize=1024,768
	@eog spidey.png 

clean:
	rm -rf $(BUILD_DIR)

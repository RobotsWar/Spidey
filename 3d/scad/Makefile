# STLs to build
STLS := u side body leg

# Output directory
BUILD_DIR := build

# Targets are $(BUILD_DIR)/file.stl
TARGETS := $(addprefix $(BUILD_DIR)/, $(addsuffix .stl,$(STLS)))

all: $(TARGETS)

build_dir:
	@mkdir -p $(BUILD_DIR)

$(BUILD_DIR)/%.stl: %.scad build_dir
	@echo "Building $@..."
	@openscad $< -o $@ 2>/dev/null

clean:
	rm -rf $(BUILD_DIR)

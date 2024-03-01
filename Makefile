# Variables
MKARCHISO = sudo ./archiso/mkarchiso
WORK_DIR = work_dir
OUT_DIR = out_dir
CONFIG_DIR = configs/bro

# Default target
.PHONY: all
all: $(WORK_DIR) $(OUT_DIR)
    $(MKARCHISO) -w $(WORK_DIR) -o $(OUT_DIR) -m iso -v $(CONFIG_DIR)

# Rule to create the work directory
$(WORK_DIR):
    mkdir -p $(WORK_DIR)

# Rule to create the output directory
$(OUT_DIR):
    mkdir -p $(OUT_DIR)

# Clean rule
.PHONY: clean
clean:
    rm -rf $(WORK_DIR) $(OUT_DIR)

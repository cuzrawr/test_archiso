# Makefile

all: clean create_dirs build_iso

create_dirs:
    @echo "Creating directories..".
    sudo mkdir -p work_dir out_dir

build_iso:
    @echo "Building ISO..".
    sudo ./archiso/mkarchiso -w work_dir -o out_dir -m iso -v configs/bro/

clean:
    @echo "Cleaning work_dir and out_dir..".
    sudo rm -rf work_dir out_dir
    @echo "Cleanup complete".

.PHONY: all create_dirs build_iso clean

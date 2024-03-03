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
	@echo "Trying unmount if prev build failed: "
#	sudo umount ./work_dir/x86_64/airootfs/proc
#	stat -fc %T ./work_dir/x86_64/airootfs/proc | grep -q "proc" && sudo umount ./work_dir/x86_64/airootfs/proc
#	bash "[[ $(stat -fc %T ./work_dir/x86_64/airootfs/proc) == *"proc"* ]] && sudo umount ./work_dir/x86_64/airootfs/proc"
	sudo ./umount_helper.sh
	sudo rm -rf work_dir out_dir
	@echo "Cleanup complete".

.PHONY: all create_dirs build_iso clean

# WARNING THIS README.md IS 50% AI GENERATED.


# Offline Arch Project

The **Offline Arch Project** focusing installation for 4GB HD disks.
 Using scripting hell in bash, provbiding to  `archinstall` automatically answers.
 ( cannot be rewritten in Python due to time constraints. )

## Features

- **Disk Compatibility**: Tailored for 4GB HD disks.
- **Offline Installation**: Supports installation without internet.
- **Customized Presets**: Uses hardcoded presets for `archinstall`.
- **Desktop Environment**: Default desktop environment is KDE with Wayland ( xorg droped).
- **Automated Installation**: Supports one-button press installation for 0 iq ppl.

- **User Credentials**:
  - Default User: Username - "username", with password = "123"
  - Root User: Username - "root", with password = "123"

- Default disk is autodetected first disk in system.

## Implementation Details

Script logic is in `.sh` files in `<airootfs>/root/scripts123/`.
An `/localrepo` directory is needed in `airootfs`, semi-automatically created via `prerequisites.sh`.

## Usage Instructions

To compile the script:

1. Review `prerequisites.sh` & download the necessary packages to integrate into the local repository.
2. Create an offline repository.
3. Run the `make` command to generate the ISO in the `out_dir` folder upon completion.


## Instructions

1. Clone the repository.
2. Review and configure settings.
3. Execute scripts.

**Note:** Use caution when executing commands as they may harm the system.

---
This project is licensed?

# Offline Arch Project

The **Offline Arch Project** streamlines installation for 4GB HD disks, focusing on offline capabilities. Using customized presets in Bash, it supports `archinstall` but cannot be rewritten in Python due to time constraints.

## Features

- **Disk Compatibility**: Tailored for 4GB HD disks.
- **Offline Installation**: Supports installation without internet.
- **Customized Presets**: Uses tailored presets for `archinstall`.
- **Desktop Environment**: Default desktop environment is KDE for Wayland support and user-friendliness.
- **Automated Installation**: Supports one-button press installation.

- **User Credentials**:
  - Default User: Username - "username", Password - "123"
  - Root User: Username - "root", Password - "123"

  - Default disk: /dev/sda with the option to change in user_configuration.json or guided install.

## Implementation Details

Script logic is in `.sh` files in `<airootfs>/root/scripts123/`. An `/localrepo` directory is needed in `airootfs`, automatically created in Archiso at `/localrepo`.

## Usage Instructions

To compile the script:

1. Review `prerequisites.sh`.
2. Create an offline repository.
3. Run the `make` command to generate the ISO in the `out_dir` folder upon completion.

## Prerequisites

- Review and configure settings in `prerequisites.sh`.
- Create an offline repository.

## Instructions

1. Clone the repository.
2. Review and configure settings.
3. Compile the script.
4. Execute the generated ISO for installation.

**Note:** Use caution when executing commands as they may alter the system.

---
This project is licensed under [I DONT CAREEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE USE AS YOU WANT](#).

# Offline Arch Project

The **Offline Arch Project** aims to provide a streamlined installation process tailored for compatibility with 4GB HD disks, with a focus on offline installation capabilities. The project utilizes customized presets for `archinstall` and is currently implemented in the Bash scripting language. Due to time constraints, a full rewrite in Python is not feasible at this juncture.

## Features

- **Disk Compatibility**: Specifically designed to accommodate 4GB HD disks.
- **Offline Installation**: Facilitates installation without requiring an internet connection.
- **Customized Presets**: Utilizes tailored presets for `archinstall`.
- **Desktop Environment**: KDE is set as the default desktop environment, chosen for its robust Wayland support and user-friendly interface.
- **Automated Installation**: Supports automated installation with a single button press.
- **User Credentials**:
  - Default User: Username - "username", Password - "123"
  - Root User: Username - "root", Password - "123"

## Implementation Details

All script logic is contained within `.sh` files located in the `<airootfs>/root/scripts123/` directory. Additionally, a `/localrepo` directory is required within `airootfs`, which will be automatically created for Archiso on your actual system at `/localrepo`.

## Usage Instructions

To compile the script, follow these steps:

1. Review the `prerequisites.sh` file.
2. Create your own offline repository.
3. Once completed, simply run the `make` command to generate the ISO in the `out_dir` folder upon successful completion.

## Prerequisites

Ensure the following prerequisites are met before compiling the script:

- Review and configure settings in `prerequisites.sh`.
- Create an offline repository.

## Instructions for Use

1. Clone the repository.
2. Review and configure settings as necessary.
3. Compile the script using the provided instructions.
4. Upon successful compilation, execute the generated ISO for installation.

**Note:** Ensure proper caution and understanding before executing commands, as they may lead to system changes.

---
This project is licensed under [I DONT CAREEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE USE AS YOU WANT](#).

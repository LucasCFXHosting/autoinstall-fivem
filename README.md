
# FiveMShield Auto-Installer Script

This **FiveMShield** auto-installer script makes it easy to install or update your FiveM server environment with minimal effort.

---

## **Prerequisites**

Before running the script, ensure the following:

- You have SSH access to your Linux-based server.
- Your server is running a supported Linux distribution (Ubuntu or Debian recommended).
- You have `curl` installed (if not, the instructions below will guide you).

---

## **Installation Steps**

1. **Update and Prepare Your Server**  
   Open your terminal and run the following commands to update your system and install `curl`:
   ```bash
   apt update -y && apt full-upgrade -y && apt install curl -y

2.  **Run the Auto-Installer Script**  
    Execute the installer script by running:
    
    ```bash
    bash <(curl -s https://raw.githubusercontent.com/LucasCFXHosting/autoinstall-fivem/refs/heads/main/setup.sh) 
    

----------

## **Features of the Script**

-   Automatically updates your server to the latest packages.
-   Installs the required dependencies for **FiveMShield**.
-   Configures the necessary runtime and server environment.
-   Allows for easy updates or fresh installations.

----------

## **Usage Notes**

-   The script will prompt you to make selections (e.g., runtime versions) during installation.
-   Ensure that no conflicting services (e.g., another FiveM server) are running on the default ports.

----------

## **Troubleshooting**

If you encounter issues during or after installation:

1.  Check your system logs for specific errors.
2.  Make sure your server has an active internet connection.
3.  Ensure that the script has sufficient permissions to make changes.

For additional support, feel free to raise an issue on the official GitHub repository.

----------

## **License and Credits**

This script is maintained by **LucasCFXHosting**.  
Feel free to contribute or report issues to improve the installer.

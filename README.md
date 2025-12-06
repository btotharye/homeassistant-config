🏠 Home Assistant Configuration
===============================

Welcome to my **Home Assistant configuration repository**.This repo contains the YAML files, packages, automations, and general configuration that power my smart home setup running on a **Raspberry Pi with Home Assistant OS**.

All sensitive data is stored securely in `secrets.yaml` and **not committed** to GitHub.

📦 Repository Purpose
---------------------

This repository serves as:

*   A **version-controlled backup** of my Home Assistant configuration
    
*   A way to track changes to automations, scripts, dashboards, and integrations
    
*   A place to document how my smart home is built
    
*   A foundation for future improvements, add-ons, and automations
    

🧠 Setup Overview
-----------------

This Home Assistant instance is installed on:

*   **Hardware:** Raspberry Pi
    
*   **OS:** Home Assistant OS
    
*   **Configuration path:** `/config`
    
*   **Version control:** Git + GitHub (SSH key authentication)
    

This repository contains only **user-managed configuration files**.Internal HA files such as `.storage/`, database files, TTS, and backups are intentionally excluded.

🔐 Secrets Management
---------------------

Sensitive values (API tokens, passwords, coordinates, etc.) are stored in:

`/config/secrets.yaml`

This file is included in .gitignore and **never committed** to version control.

Use secrets in YAML like:

```yaml
api_key: !secret openai_api_key
```

📁 Directory Structure
----------------------

The structure will evolve over time, but a typical layout looks like:

```
/config
├── configuration.yaml        # Main config entry point
├── automations.yaml          # Automations
├── scripts.yaml              # Scripts
├── scenes.yaml               # Scenes
├── ui-lovelace.yaml          # Dashboards (YAML mode, if used)
├── custom_components/        # Custom integrations
├── packages/                 # Modular YAML packages
├── includes/                 # Split configuration files
└── .gitignore
```

As the setup grows, this section can be updated.

🔧 How I Work With This Repository
----------------------------------

### Pull updates (from GitHub → Home Assistant)

```bash
cd /config
git pull
ha core restart
```

### Push updates (from Home Assistant → GitHub)

```bash
cd /config
git add .
git commit -m "Update automations"
git push
```

📡 Integrations
---------------

A running list of the integrations used in this Home Assistant setup.

(Currently a placeholder list — will expand as they are added.)

*   Home Assistant Mobile App
    
*   MQTT
    
*   UniFi Network
    
*   ESPHome / Tasmota
    
*   Voice assistants
    
*   More coming soon…
    

⚙️ Automations
--------------

A summary of key automations in the system.(Will be expanded as more automations are added.)

Examples to document later:

*   Lights on at sunset
    
*   Presence-based HVAC control
    
*   Door/window notifications
    
*   Night mode routines
    
*   Energy usage insights
    

📝 Notes & Future Improvements
------------------------------

*   Add modular packages for cleaner config
    
*   Expand and document dashboards
    
*   Automate off-site backups
    
*   Add CI for YAML linting / validation
    
*   Document individual automations and blueprints


## 🖥️ Home Assistant CLI Commands

Home Assistant OS includes the `ha` command-line tool for managing the system directly from SSH or the terminal add-on. Below are commonly used commands for checking logs, restarting services, validating configuration, and managing the system.

### 🔍 View Logs

**Core Home Assistant logs (live stream):**
```bash
ha core logs --follow
```

**Core logs (not streaming):**
```bash
ha core logs
```

**Supervisor logs:**
```bash
ha supervisor logs --follow
```

**jView logs for a specific add-on:**
```bash
ha addons logs <addon_name>
```

### 🔄 Restarting Home Assistant
**Restart Home Assistant Core**:
```bash
ha core restart
```

**Restart the Supervisor:**
```bash
ha supervisor restart
```

**Reboot the entire Home Assistant OS (the host):**
```bash
ha host reboot
```

### 🧪 Configuration Validation
Validate your YAML configuration before restarting:
```bash
ha core check
```

If the configuration is valid, the command will return:
```pgsql
Configuration is valid!
```

### 📦 Add-on Management
**List installed add-ons:**
```bash
ha addons list
```

**Start an add-on:**
```bash
ha addons start >addon_name>
```

**Stop an add-on:**
```bash
ha addons stop <addon_name>
```


🛡️ License
-----------

This repository contains personal Home Assistant configuration files and is shared publicly for reference.  Feel free to draw inspiration from it, but **never commit your own secrets or personal identifiers**.

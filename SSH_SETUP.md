# SSH Setup for Home Assistant Config Sync

## Public Key to Add to Your Pi

Copy this key to your Pi's `~/.ssh/authorized_keys`:

```
ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE2gvZhC1vyWZOfu6vAneU3Q14BoXycKVIkW7JbsjAI9 ha-sync@openclaw
```

### Steps to authorize the key:

1. **SSH into your Pi** (use your current method):
   ```bash
   ssh pi@192.168.1.33
   ```

2. **Create .ssh directory if it doesn't exist:**
   ```bash
   mkdir -p ~/.ssh
   chmod 700 ~/.ssh
   ```

3. **Add the public key:**
   ```bash
   # Option A: Paste directly
   echo 'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE2gvZhC1vyWZOfu6vAneU3Q14BoXycKVIkW7JbsjAI9 ha-sync@openclaw' >> ~/.ssh/authorized_keys
   chmod 600 ~/.ssh/authorized_keys
   
   # Option B: Copy-paste into an editor
   nano ~/.ssh/authorized_keys
   # Paste the key, save (Ctrl+X, Y, Enter)
   ```

4. **Verify permissions:**
   ```bash
   ls -la ~/.ssh/authorized_keys
   # Should show: -rw------- (600 permissions)
   ```

5. **Test the connection:**
   ```bash
   # From your local machine where OpenClaw runs:
   ssh -i /home/node/.openclaw/workspace/.secrets/id_ed25519_pi pi@192.168.1.33 "echo 'SSH key auth works!'"
   ```

## Home Assistant Config Path

Make sure the sync script knows where your HA config is stored. Update `sync-ha-config.sh` if needed:

```bash
REMOTE_PATH="/home/pi/home-assistant/config"  # Update if different
```

Common paths:
- Docker: `/home/pi/docker/homeassistant/config` or `/opt/homeassistant/config`
- Supervised/OS: `/root/config`
- Core (manual): `/home/pi/.homeassistant`

## Once SSH is set up:

```bash
cd /home/node/.openclaw/workspace-home-assistant
./sync-ha-config.sh
```

Follow the prompts to commit and push your changes.

---

**Key fingerprint:** `SHA256:Gfw5Drq+TBamA/d6tmmHBOhwW0b+dP4lei7k5yaJ52Y`

Let me know once you've added the key!

# Pi Setup: Pull Config from GitHub

Once you have the energy dashboard and other configs in GitHub, set up your Pi to pull them automatically.

## Initial Setup on the Pi

1. **SSH into your Pi:**
   ```bash
   ssh pi@192.168.1.33
   ```

2. **Navigate to your HA config directory:**
   ```bash
   cd /config  # Or wherever your HA config is
   ```

3. **Initialize git (if not already done):**
   ```bash
   git init
   git remote add origin https://github.com/btotharye/homeassistant-config.git
   ```

4. **Pull the latest config:**
   ```bash
   git pull origin master
   ```

5. **Verify files were pulled:**
   ```bash
   ls -la energy-dashboard-builtin.yaml
   ```

## Using the Energy Dashboard on HA

Now the energy dashboard YAML is in your config directory. To use it:

### Option A: Lovelace UI (Recommended)
1. Go to **Settings → Dashboards** in HA
2. Create a new dashboard
3. Click **Edit Dashboard** (pencil icon) → **Code Editor**
4. Paste the contents of `energy-dashboard-builtin.yaml`
5. Save

### Option B: YAML Config Mode
If your HA uses YAML mode for lovelace:
1. Add this to your `configuration.yaml`:
   ```yaml
   lovelace:
     mode: yaml
     resources: []
     views: !include dashboard.yaml
   ```
2. Create `dashboard.yaml` and include the energy dashboard content
3. Restart HA

## Keeping Config in Sync

### Manual Pull
```bash
cd /config
git pull origin master
ha core restart
```

### Auto-Pull with Cron (Optional)

Set up automatic pulls every hour:

```bash
# Edit crontab
crontab -e

# Add this line:
0 * * * * cd /config && git pull origin master > /tmp/ha-config-pull.log 2>&1 && ha core restart
```

This will:
- Pull config every hour on the hour
- Log the output to `/tmp/ha-config-pull.log`
- Restart HA if changes were pulled

### Check Logs
```bash
# View pull history
cat /tmp/ha-config-pull.log

# View last pull
tail -f /tmp/ha-config-pull.log
```

## Making Changes

From OpenClaw (or any machine):

```bash
cd /home/node/.openclaw/workspace-home-assistant
./sync-ha-config.sh
```

This will:
1. Commit your changes
2. Push to GitHub
3. Optionally pull on the Pi and restart HA

---

**Your GitHub repo:** https://github.com/btotharye/homeassistant-config

**Energy Dashboard:** `energy-dashboard-builtin.yaml` (now in your repo!)

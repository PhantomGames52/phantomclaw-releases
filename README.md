# PhantomClaw Releases

⚠️ ALPHA SOFTWARE — NOT FOR PRODUCTION USE

This repository contains **release assets only** (compiled binaries, distributions).  
Source code, documentation, and issue tracking are hosted in a separate repository (not linked here to avoid exposing private repositories).

Binary releases are published as GitHub Releases and attached to tags.  
The `main` branch is intentionally kept minimal.

---

## Installation (End-User)

Prerequisites: Node.js 20+ and npm.

1. Download the latest release archive from the [Releases page](https://github.com/PhantomGames52/phantomclaw-releases/releases).
2. Extract it:
   ```bash
   unzip phantomclaw-v0.0.1-alpha.zip -d phantomclaw
   ```
3. Install the CLI globally (from the extracted folder):
   ```bash
   cd phantomclaw
   npm install -g .
   ```
   This creates the `phantomclaw` command in your PATH.
4. Verify:
   ```bash
   phantomclaw --version
   ```
5. Start all services (Gateway + WebUI) from the project root:
   ```bash
   phantomclaw start
   ```
   - Gateway: `ws://localhost:18790`
   - Web UI: `http://localhost:5173`
   (Note: `start` should be run from the extracted project folder containing `gateway/` and `webui/`. Alternatively, run `phantomclaw gateway start` and `npm run dev` in `webui/` separately.)

## Update

1. Download the new release archive.
2. Replace your installation folder and reinstall:
   ```bash
   cd phantomclaw
   npm install -g . --force
   ```
   Alternatively, if you installed from a fixed location, just extract the new version and run `npm install -g .` again.

## One-Command Setup

Use the provided installer (requires `curl` and `bash`):

```bash
curl -fsSL https://raw.githubusercontent.com/PhantomGames52/phantomclaw-releases/main/install.sh | sh
```

It will download the latest release, extract, and install globally.

## CLI Reference

- `phantomclaw start` — start Gateway and Web UI together
- `phantomclaw gateway start` — start the Gateway server
- `phantomclaw gateway status` — check Gateway status
- `phantomclaw agent list` — list available skills/agents
- `phantomclaw message send -t <skillId> -m "<text>"` — send a message to a skill
- `phantomclaw doctor` — run health checks

See `phantomclaw --help` for more.

---

**Note:** The `main` branch here is intentionally minimal; all versioned releases are attached to tags.

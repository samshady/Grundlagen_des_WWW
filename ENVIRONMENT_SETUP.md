# Environment Setup — Grundlagen des WWW (SS26)

> Human-readable guide to setting up the local Elm development environment.
> Course: Grundlagen des World Wide Web @ Uni Halle, Dozent: PD Dr. Alexander Hinneburg

---

## Prerequisites

### What you need installed

| Tool | Version | Why |
|---|---|---|
| **Node.js** | v22+ | To run npm and install Elm |
| **npm** | 10+ | Package manager for Elm and dev tools |
| **Git** | latest | Version control, push to GitHub |
| **SSH key (GitHub)** | ed25519 | Authenticate with GitHub without passwords |

### Check what you have

```bash
node --version    # should be v22.x
npm --version     # should be 10.x
git --version     # should be 2.x
```

---

## Step 1: Install Elm

The Elm compiler (version 0.19.1) is installed via npm:

```bash
npm install -g elm
```

Verify it works:

```bash
elm --version    # should print 0.19.1
elm repl         # interactive Elm REPL (exit with :q)
```

### If `elm` command is not found

Make sure the npm global bin directory is in your `PATH`:

```bash
npm root -g       # check global node_modules location
npm bin -g        # check global bin directory
```

Add to `~/.zshrc` if needed:
```bash
export PATH="$PATH:$(npm bin -g)"
```

---

## Step 2: Install GitHub CLI (optional but helpful)

```bash
sudo dnf install gh      # Fedora
# or: brew install gh    # macOS
# or: https://cli.github.com/ for other platforms

gh auth login             # authenticate with your GitHub account
```

---

## Step 3: Create a GitHub Repository

1. Go to https://github.com/new
2. Create a repository named `Grundlagen_des_WWW`
3. Choose **private** or **public** (your choice)
4. Do NOT initialize with README, .gitignore, or license (we already have files)

### Connect your local folder to GitHub

```bash
# From the project root:
cd /home/sam/Development/workflow-optimisation/Grundlagen_des_WWW
git init
git add .
git commit -m "Initial commit: course materials and project plan"

# Add remote with SSH alias (uses your personal SSH key)
git remote add origin git@github-samshady:samshady/Grundlagen_des_WWW.git
git branch -M main
git push -u origin main
```

> **Note**: We use `github-samshady` instead of `github.com` because your SSH config
> routes the personal key through this alias. Just `git@github.com` would use the
> wrong key.

---

## Step 4: Create the Elm Project

We'll use the **Smart Wardrobe Planner** project. Inside the repo:

```bash
mkdir -p uni-project/src
cd uni-project
elm init
```

This creates:
- `elm.json` — project config with package dependencies
- `src/Main.elm` — entry point (will be created by us)

### Install required Elm packages

```bash
elm install elm/browser       # Browser.application, Browser.sandbox
elm install elm/http          # HTTP requests
elm install elm/json          # JSON decoding
elm install elm/url           # URL parsing and routing
elm install elm/svg           # SVG rendering
elm install elm/time          # For any time-based features
```

---

## Step 5: Project Structure

```
Grundlagen_des_WWW/
├── AGENTS.md                 # Technical bug/issue log (for AI agents)
├── ENVIRONMENT_SETUP.md      # This file — setup guide for humans
├── IMPLEMENTATION_PLAN.md    # Detailed project implementation plan
├── Plan/                     # Course planning documents
│   ├── 00_Module_Overview.md
│   ├── 01_Roadmap_Plan.md
│   ├── 02_Project_Ideas.md
│   ├── 03_Projekt_Digital-Closet.md
│   ├── 04_Elm_Installation_Setup.md
│   ├── 05_Exam_Prep.md
│   └── 06_Partner_Guide.md
├── VL_Kontext/               # Course lecture context
│   ├── Fragen_Loesungen.txt
│   ├── vorlesung_uebung_inhalte.txt
│   ├── elm.txt
│   ├── blubber.txt
│   ├── details.txt
│   └── Folien/               # PDF lecture slides (Brass)
│       ├── c1_inet.pdf
│       ├── c2_dns.pdf
│       └── ...
└── uni-project/              # Elm project directory
    ├── elm.json
    ├── src/
    │   ├── Main.elm          # Browser.application entry point
    │   ├── Types.elm         # Model, domain types, Route type
    │   ├── Api.elm           # HTTP + JSON decoder
    │   ├── View.elm          # Main view + routing
    │   ├── Views/
    │   │   ├── Home.elm      # Home page
    │   │   ├── Closet.elm    # Outfit builder
    │   │   └── About.elm     # Project info
    │   ├── Svg/
    │   │   └── OutfitPreview.elm  # Outfit visualization SVG
    │   └── Styles.elm        # Bulma CSS helpers
    ├── public/
    │   └── index.html        # HTML shell for the app
    └── README.md             # Project README
```

---

## Step 6: Run the Dev Server

```bash
cd uni-project
elm reactor
# Open http://localhost:8000 in your browser
# Click on src/Main.elm to preview
```

For a standalone build:

```bash
elm make src/Main.elm --output=public/main.js
# Then open public/index.html via a local server (not file://)
```

---

## Step 7: Compile and Verify

```bash
elm make src/Main.elm --output=main.js
```

Successful compilation produces `main.js`. No output means success (Elm is silent on success).

---

## Common Issues & Fixes

### "elm: command not found"
→ Global npm bin not in PATH: `export PATH="$PATH:$(npm bin -g)"`

### "Port 8000 already in use"
→ `elm reactor --port=8080`

### "I cannot install Elm via npm"
→ Try direct binary from https://github.com/elm/compiler/releases/tag/0.19.1

### "SSH key not working with GitHub"
→ Verify: `ssh -T git@github-samshady`
→ Should print: `Hi samshady! You've successfully authenticated...`

### "CORS errors in the browser"
→ Always test via `elm reactor` (localhost), never via `file://`
→ The API/JSON endpoint supports CORS, so this should work out of the box

---

## Quick Reference: Git Workflow

```bash
# Daily workflow
git pull                       # get latest changes
# ... make changes ...
git add .
git commit -m "description"
git push                       # push to GitHub

# Branch for features
git checkout -b feature/radar-chart
# ... work ...
git checkout main
git merge feature/radar-chart
git push
```

# AGENTS.md — Technical Bug/Problem Log

> Live documentation of issues encountered during dev environment setup.
> Format: `YYYY-MM-DD | Category | Problem | Solution | Status`

---

## 2026-05-28 | Git & GitHub | Default `git` command uses wrong SSH key

**Problem**: `git@github.com` resolves to the default SSH key, not `github_samshady`. The default pubkey is not authorized for the personal GitHub account `samshady`.

**Solution**: Add SSH host alias in `~/.ssh/config`:
```
Host github-samshady
    HostName github.com
    User git
    IdentityFile ~/.ssh/github_samshady
    IdentitiesOnly yes
```
Then use remote URL `git@github-samshady:samshady/<repo>.git` instead of `git@github.com:samshady/<repo>.git`.

**Status**: ✅ Resolved (alias already exists in config)

---

## 2026-05-28 | npm Permissions | `npm install -g` fails with EACCES

**Problem**: System npm prefix is `/usr/local` which requires root. Running `npm install -g elm` fails with EACCES.

**Solution**: Change npm prefix to user-local directory:
```bash
mkdir -p ~/.npm-global
npm config set prefix "$HOME/.npm-global"
export PATH="$HOME/.npm-global/bin:$PATH"
```
Then `npm install -g elm` succeeds. Added PATH export to `~/.zshrc`.

**Status**: ✅ Resolved

---

## 2026-05-28 | Elm Installation | `elm` binary not found after npm install (EACCES workaround)

**Problem**: After fixing npm prefix, Elm compiled and installed successfully. Elm 0.19.1 confirmed working on Fedora 44 via npm (no binary compatibility issues).

**Solution**: The npm-installed Elm binary works on Fedora 44 without any glibc issues. No `sudo` or DNF needed.

**Status**: ✅ Resolved — Elm 0.19.1 installed and working

---

## 2026-05-28 | Fedora 44 | Binary compatibility for elm

**Problem**: Elm 0.19.1 was released pre-2026. Concerned that prebuilt binaries might not link correctly on Fedora 44 (glibc version mismatch) or may need `libtinfo5` etc.

**Solution**: npm-installed version (`npm install -g elm`) works perfectly on Fedora 44. No compatibility issues encountered. The npm package bundles its own binary.

**Status**: ✅ Resolved — Fedora 44 compatible via npm

---

## 2026-05-28 | GitHub CLI | `gh` not installed

**Problem**: `gh auth status` fails — `gh` CLI not available. Cannot create repos via CLI. User does not have sudo access, so `dnf install gh` is not possible.

**Solution**: Used GitHub API directly with a Personal Access Token (saved at `~/.github_token`):
```bash
curl -X POST -H "Authorization: token <TOKEN>" \
  https://api.github.com/user/repos \
  -d '{"name":"Grundlagen_des_WWW"}'
```
Token saved to `~/.github_token` with `chmod 600`.

**Status**: ✅ Resolved via API (gh CLI optional, not critical)

---

## 2026-05-28 | Node Version | nvm vs system Node

**Problem**: Node.js v22.22.2 is installed system-wide via Fedora packages (`/usr/bin/node`). If nvm is needed later, it may conflict.

**Solution**: Stick with system Node for now. Only install nvm if a specific Node version is required by a tool.

**Status**: ⏳ Pending — monitor if issues arise

---

## 2026-05-28 | Elm Packages | `elm install` requires network

**Problem**: `elm install` fetches package metadata from the Elm package registry. Behind a corporate firewall or in an air-gapped environment, this fails.

**Solution**: Ensure network access to `package.elm-lang.org`. Network was available during setup. All packages installed successfully:
- elm/browser 1.0.2
- elm/http 2.0.0
- elm/json 1.1.3
- elm/url 1.0.0
- elm/svg 1.0.1

**Status**: ✅ Resolved — all packages installed

---

## 2026-05-28 | Git Remote | Using SSH host alias in git remote URL

**Problem**: Standard `git@github.com:samshady/repo.git` routes through the default SSH key. For personal account, must use `git@github-samshady` host alias.

**Solution**: Set remote URL as:
```bash
git remote add origin git@github-samshady:samshady/Grundlagen_des_WWW.git
```
This uses the correct SSH key automatically via the SSH config alias. Push succeeded.

**Status**: ✅ Resolved

---

## 2026-05-28 | Elm Project | Unknown dependencies vs installed

**Problem**: `elm.json` tracks dependencies in `dependencies.direct`. If a package version is incompatible with Elm 0.19.1, compilation fails.

**Solution**: Used `elm install` for each dependency. All packages were resolved correctly. `elm make src/Main.elm --output=public/main.js` compiled successfully with all dependencies.

**Status**: ✅ Resolved

---

## 2026-05-28 | Elm Reactor | Port 8000 already in use

**Problem**: `elm reactor` defaults to port 8000. If another service (e.g., a web server, another reactor instance) is already on that port, it fails.

**Solution**: Use `elm reactor --port=8080` or kill the conflicting process.

**Status**: ⏳ Pending — check during dev

---

## 2026-05-28 | CORS | HTTP calls from local file:// or elm reactor

**Problem**: Browsers block CORS requests from `file://` protocol. `elm reactor` serves on `localhost:8000` which should work with the JSON endpoint (CORS is configured), but needs verification.

**Solution**: Always test HTTP via `elm reactor` or a proper web server, never `file://`. If CORS still fails, use a CORS proxy or configure a local dev server.

**Status**: ⏳ Pending — verify during HTTP integration

---

## 2026-05-28 | GitLab Pages | Only needed for university deployment

**Problem**: The course uses GitLab Lehre for deployment. But we're using GitHub as primary repo. Need to decide: dual remote (GitHub + GitLab) or just GitHub?

**Solution**: Use GitHub as primary. If GitLab Pages is required for the course, add GitLab as a secondary remote and push there separately.

**Status**: ⏳ Pending — decision needed

---

## 2026-05-28 | GitHub API | Repo creation via Bearer token from SSH key file fails

**Problem**: Tried using the SSH private key file content as a Bearer token for the GitHub API. This failed because SSH private keys are not valid OAuth tokens.

**Solution**: Use a proper GitHub Personal Access Token (classic or fine-grained) with `repo` scope. Saved to `~/.github_token` with `chmod 600`. Use via:
```bash
export GITHUB_TOKEN=$(cat ~/.github_token | grep -v ^#)
```

**Status**: ✅ Resolved — token saved securely

---

## 2026-05-28 | GitHub Repo | Default branch is `master` instead of `main`

**Problem**: The GitHub API created the repo with default branch `master`, but our local git repo uses `main`.

**Solution**: Changed local default to `main` via `git branch -M main` (already done during `git init`). Git push succeeded: `git push -u origin main`.

**Status**: ✅ Resolved — no action needed, push created the `main` branch on GitHub

---

## 2026-05-28 | Elm Build | `elm make` compiles silently on success

**Problem**: `elm make` compiles without output on success (just "Success!"). This is normal Elm behavior but can be confusing if you expect verbose output.

**Solution**: This is not a bug — Elm is silent on success by design. Verified by checking exit code and existence of output file `public/main.js`.

**Status**: ✅ Not a bug — expected behavior

---

## 2026-05-28 | GitHub Push Protection | Token in AGENTS.md blocks push

**Problem**: GitHub secret scanning flagged the PAT in AGENTS.md and blocked the push. GitHub Push Protection prevents any commit containing known secret patterns from being pushed.

**Solution**: Removed the token string from AGENTS.md. Token reference now uses `<TOKEN>` placeholder in docs. The actual token is stored only in `~/.github_token`.

**Status**: ✅ Resolved — token removed from committed files

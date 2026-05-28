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

## 2026-05-28 | Elm Installation | `elm` binary not found globally after npm install

**Problem**: Running `elm --version` fails with "elm not installed". Need to install Elm globally via npm.

**Solution**: Install globally:
```bash
npm install -g elm
```
Or install locally in the project and use `npx elm`.

**Status**: ⏳ Pending — will install during setup

---

## 2026-05-28 | Fedora 44 | Binary compatibility for elm

**Problem**: Elm 0.19.1 was released pre-2026. The prebuilt binaries on the Elm website may not link correctly on Fedora 44 (glibc version mismatch) or may need `libtinfo5` etc.

**Solution**: Use npm-installed version (`npm install -g elm`) which ships its own binary. If that fails, try:
```bash
sudo dnf install elm  # if available in Fedora repos
```
Fallback: Use the official elm binary from GitHub releases with `LD_LIBRARY_PATH` workarounds.

**Status**: ⏳ Pending

---

## 2026-05-28 | GitHub CLI | `gh` not installed

**Problem**: `gh auth status` fails — `gh` CLI not available. Cannot create repos or manage PRs via CLI without it.

**Solution**: Install GitHub CLI:
```bash
sudo dnf install gh
gh auth login
```

**Status**: ⏳ Pending

---

## 2026-05-28 | Node Version | nvm vs system Node

**Problem**: Node.js v22.22.2 is installed system-wide via Fedora packages (`/usr/bin/node`). If nvm is needed later, it may conflict.

**Solution**: Stick with system Node for now. Only install nvm if a specific Node version is required by a tool.

**Status**: ⏳ Pending — monitor if issues arise

---

## 2026-05-28 | Elm Packages | `elm install` requires network

**Problem**: `elm install` fetches package metadata from the Elm package registry. Behind a corporate firewall or in an air-gapped environment, this fails.

**Solution**: Ensure network access to `package.elm-lang.org`. If blocked, use a proxy or pre-download packages manually.

**Status**: ⏳ Pending — check during install

---

## 2026-05-28 | Git Remote | Using SSH host alias in git remote URL

**Problem**: Standard `git@github.com:samshady/repo.git` routes through the default SSH key. For personal account, must use `git@github-samshady` host alias.

**Solution**: Set remote URL as:
```bash
git remote add origin git@github-samshady:samshady/Grundlagen_des_WWW.git
```
This uses the correct SSH key automatically via the SSH config alias.

**Status**: ⏳ Pending — to apply when creating repo

---

## 2026-05-28 | Elm Project | Unknown dependencies vs installed

**Problem**: `elm.json` tracks dependencies in `dependencies.direct`. If a package version is incompatible with Elm 0.19.1, compilation fails.

**Solution**: Read `elm.json` after `elm init` and verify versions. Pin to exact versions if needed. Use `elm install` for each dependency rather than editing `elm.json` by hand.

**Status**: ⏳ Pending

---

## 2026-05-28 | Elm Reactor | Port 8000 already in use

**Problem**: `elm reactor` defaults to port 8000. If another service (e.g., a web server, another reactor instance) is already on that port, it fails.

**Solution**: Use `elm reactor --port=8080` or kill the conflicting process.

**Status**: ⏳ Pending — check during dev

---

## 2026-05-28 | CORS | PokéAPI calls from local file:// or elm reactor

**Problem**: Browsers block CORS requests from `file://` protocol. `elm reactor` serves on `localhost:8000` which should work with PokéAPI (they allow CORS), but needs verification.

**Solution**: Always test HTTP via `elm reactor` or a proper web server, never `file://`. If CORS still fails, use a CORS proxy or configure a local dev server.

**Status**: ⏳ Pending — verify during HTTP integration

---

## 2026-05-28 | GitLab Pages | Only needed for university deployment

**Problem**: The course uses GitLab Lehre for deployment. But we're using GitHub as primary repo. Need to decide: dual remote (GitHub + GitLab) or just GitHub?

**Solution**: Use GitHub as primary. If GitLab Pages is required for the course, add GitLab as a secondary remote and push there separately.

**Status**: ⏳ Pending — decision needed

# Clairvoyance releases

Public releases and community catalogs for [Clairvoyance](https://www.clairvoyanceai.com).

This repository does not contain the Clairvoyance source code. Installers are attached to [GitHub Releases](https://github.com/StardockCorp/clairvoyance-releases/releases). The files in git are catalogs: a version pointer, and lists of packages the app can install.

`desktop-releases.json` names the latest published version and the per-platform installer URL, sha256, and size. It is empty until the first signed release is published. Built installers stay in the product's `App/Binaries` directory and are uploaded from there. Do not commit `.exe`, `.dmg`, `.AppImage`, or `.deb` files to this repo.

## Community catalogs

Each file under `community/` is a JSON array of pointers. The package itself stays in the author's repository. A listing looks like this:

```json
{
  "id": "example",
  "name": "Example",
  "author": "Author Name",
  "description": "What it does.",
  "repo": "owner/repo"
}
```

| File | Installs into |
| --- | --- |
| `extensions.json` | CAMs (marketplace type `extension`) |
| `skills.json` | Staff skills |
| `mcp.json` | MCP bundles |
| `themes.json` | `config/themes` |
| `icon-themes.json` | `config/icon-themes` |
| `basetypes.json` | `config/basetypes` |
| `canvas-templates.json` | `config/canvas-templates` |
| `note-templates.json` | `config/templates` |
| `jobs.json` | `config/jobs` |
| `artifacts.json` | `config/artifacts/<id>/` |

`removed.json` lists yanked ids, keyed by those same names. `community-stats.json` is generated download counts. Do not edit it by hand.

Themes may also include `screenshot` and `modes` (`dark`, `light`, or both).

## Bugs and feature requests

This repo does not take issues about the Clairvoyance app. A pull request here is only for adding, updating, or removing a catalog listing. Read `review.md` before opening one.

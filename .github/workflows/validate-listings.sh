#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "$0")/../.." && pwd)"
types='["extensions","skills","mcp","themes","icon-themes","basetypes","canvas-templates","note-templates","jobs","artifacts"]'

jq empty "$root/desktop-releases.json" "$root/community-stats.json" "$root"/community/*.json

jq -e '
  (.latestVersion == null or (.latestVersion | type) == "string")
  and (.releasedAt == null or (.releasedAt | type) == "string")
  and (.minimumVersion == null or (.minimumVersion | type) == "string")
  and (.platforms | type) == "object"
' "$root/desktop-releases.json" >/dev/null

jq -e 'type == "object"' "$root/community-stats.json" >/dev/null

listing='
  def listing:
    type == "object"
    and (.id | type) == "string" and (.id | test("^[a-z0-9][a-z0-9-]*$"))
    and (.name | type) == "string" and .name != ""
    and (.author | type) == "string" and .author != ""
    and (.description | type) == "string" and .description != ""
    and (.repo | type) == "string" and (.repo | test("^[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+$"));
  type == "array" and all(.[]; listing)
'

for file in "$root"/community/*.json; do
  name="$(basename "$file")"
  if [[ "$name" == "removed.json" ]]; then
    continue
  fi
  jq -e "$listing" "$file" >/dev/null
done

jq -e --argjson types "$types" '
  type == "object"
  and ((keys - $types) | length == 0)
  and (($types - keys) | length == 0)
  and all(.[]; type == "array" and all(.[]; type == "string" and test("^[a-z0-9][a-z0-9-]*$")))
' "$root/community/removed.json" >/dev/null

if git -C "$root" ls-files | grep -Ei '\.(exe|msi|dmg|appimage|deb|zip|blockmap)$'; then
  echo "Installers do not belong in this repository." >&2
  exit 1
fi

echo "Catalogs are valid."

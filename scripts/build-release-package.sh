#!/usr/bin/env bash
set -euo pipefail

# Erstellt ein reproduzierbares ZIP aus dem aktuell ausgecheckten Git-Stand.
# Das Paket enthält keine lokalen Secrets, Backups oder unversionierten Dateien.

version="${1:-dev}"
output_dir="${2:-dist}"
repository_root="$(git rev-parse --show-toplevel)"

# Akzeptiert sowohl einen Repository-relativen als auch einen absoluten Zielpfad.
if [[ "$output_dir" = /* ]]; then
  resolved_output_dir="$output_dir"
else
  resolved_output_dir="$repository_root/$output_dir"
fi

archive_path="$resolved_output_dir/MGD-Living-Documentation-$version.zip"

mkdir -p "$resolved_output_dir"
git -C "$repository_root" archive --format=zip --prefix="MGD-Living-Documentation-$version/" HEAD > "$archive_path"
shasum -a 256 "$archive_path" > "$archive_path.sha256"
printf 'Paket erstellt: %s\nPrüfsumme: %s.sha256\n' "$archive_path" "$archive_path"

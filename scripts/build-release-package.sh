#!/usr/bin/env bash
set -euo pipefail

# Erstellt ein reproduzierbares ZIP aus dem aktuell ausgecheckten Git-Stand.
# Das Paket enthält keine lokalen Secrets, Backups oder unversionierten Dateien.

version="${1:-dev}"
output_dir="${2:-dist}"
repository_root="$(git rev-parse --show-toplevel)"
archive_path="$repository_root/$output_dir/MGD-Living-Documentation-$version.zip"

mkdir -p "$repository_root/$output_dir"
git -C "$repository_root" archive --format=zip --prefix="MGD-Living-Documentation-$version/" HEAD > "$archive_path"
shasum -a 256 "$archive_path" > "$archive_path.sha256"
printf 'Paket erstellt: %s\nPrüfsumme: %s.sha256\n' "$archive_path" "$archive_path"

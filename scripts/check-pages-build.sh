#!/usr/bin/env bash
set -euo pipefail
repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
output_dir="${PAGES_CHECK_OUTPUT:-${XDG_CACHE_HOME:-$HOME/.cache}/sixie-blog-pages-check}"
mkdir -p "$output_dir"
docker run --rm \
  --user "$(id -u):$(id -g)" \
  --volume "$repo_dir:/github/workspace:ro" \
  --volume "$output_dir:/output" \
  --env GITHUB_WORKSPACE=/github/workspace \
  --env GITHUB_REPOSITORY=marsplus/marsplus.github.io \
  --env GITHUB_API_URL=https://api.github.com \
  --env INPUT_SOURCE=. \
  --env INPUT_DESTINATION=../../output \
  ghcr.io/actions/jekyll-build-pages:v1.0.13
printf 'Production build: %s\n' "$output_dir"

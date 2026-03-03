#!/usr/bin/env bash
set -euo pipefail

# Sync new/updated posts from a source posts directory into this repo's posts/
# Usage: ./scripts/sync_posts_from_source.sh [SRC_DIR] [DST_DIR]
# Defaults: SRC_DIR=../jimenezgomez.org/posts  DST_DIR=posts

SRC_DIR="${1:-../jimenezgomez.org/posts}"
DST_DIR="${2:-posts}"

echo "Source: $SRC_DIR"
echo "Destination: $DST_DIR"

if [ ! -d "$SRC_DIR" ]; then
  echo "Source directory does not exist: $SRC_DIR" >&2
  exit 1
fi

mkdir -p "$DST_DIR"

copied=0

shopt -s nullglob
for d in "$SRC_DIR"/*/; do
  [ -d "$d" ] || continue
  if [ -f "$d/index.md" ]; then
    slug=$(basename "$d")
    src_index="$d/index.md"
    dst_postdir="$DST_DIR/$slug"
    dst_index="$dst_postdir/index.md"

    if [ ! -d "$dst_postdir" ]; then
      echo "Copying new post: $slug"
      cp -a "$d" "$DST_DIR/"
      copied=$((copied+1))
    else
      # If source index.md is newer than destination, copy whole folder
      if [ "$src_index" -nt "$dst_index" ]; then
        echo "Updating post: $slug (source newer)"
        rm -rf "$dst_postdir"
        cp -a "$d" "$DST_DIR/"
        copied=$((copied+1))
      else
        echo "Skipping existing post (up-to-date): $slug"
      fi
    fi
  else
    echo "Skipping directory without index.md: $d"
  fi
done

# Rebuild posts/post_list.json from folders that contain index.md
echo "Rebuilding $DST_DIR/post_list.json"
posts=()
while IFS= read -r -d '' dir; do
  slug=$(basename "$dir")
  posts+=("$slug")
done < <(find "$DST_DIR" -maxdepth 1 -mindepth 1 -type d -print0)

if [ ${#posts[@]} -eq 0 ]; then
  echo "No posts found in $DST_DIR"
  exit 0
fi

# Sort descending (newest first by slug name)
IFS=$'\n' sorted=( $(printf "%s\n" "${posts[@]}" | sort -r) )

out_file="$DST_DIR/post_list.json"
printf "[\n" > "$out_file"
first=true
for s in "${sorted[@]}"; do
  if [ "$first" = true ]; then
    first=false
  else
    printf ",\n" >> "$out_file"
  fi
  printf "  \"%s\"" "$s" >> "$out_file"
done
printf "\n]\n" >> "$out_file"

echo "Wrote $out_file (${#sorted[@]} entries)."
echo "Copied or updated posts: $copied"

echo "Next: review frontmatter and images in each imported post, then commit changes:" 
echo "  git add $DST_DIR && git commit -m 'Import posts from source' && git push"

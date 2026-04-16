#!/usr/bin/env bash
# data-raw/fetch_ookla.sh
#
# Downloads Ookla mobile performance tiles (2022-2024) from the public S3 bucket.
# No AWS account or credentials required -- public data, anonymous access.
#
# Usage (from project root):
#   bash data-raw/fetch_ookla.sh
#
# Output: data/ookla/<year>/quarter=<q>/*.parquet

set -euo pipefail

BUCKET="s3://ookla-open-data/parquet/performance/type=mobile"
DEST="data/ookla"
YEARS="2022 2023 2024"
QUARTERS="1 2 3 4"

mkdir -p "$DEST"

for year in $YEARS; do
  for q in $QUARTERS; do
    src="${BUCKET}/year=${year}/quarter=${q}/"
    dst="${DEST}/year=${year}/quarter=${q}/"
    echo "→ Fetching ${year} Q${q} ..."
    aws s3 cp "$src" "$dst" \
      --recursive \
      --no-sign-request \
      --only-show-errors
  done
done

echo ""
echo "Done. Files written to ${DEST}/"
du -sh "$DEST"

#!/bin/sh

HOST_BASE="$1"
USE_HTTPS="$2"
BUCKET="$3"
SOURCE="$4"
DESTINATION="$5"
EXCLUDE="$6"
INCLUDE="$7"

cat > ~/.s3cfg <<EOF
[default]
host_base = ${HOST_BASE}
host_bucket = ${HOST_BASE}
use_https = ${USE_HTTPS}
EOF

s3cmd sync \
  "$SOURCE" \
  "s3://${BUCKET}/${DESTINATION}" \
  ${EXCLUDE:+--exclude "$EXCLUDE"} \
  ${INCLUDE:+--include "$INCLUDE"}

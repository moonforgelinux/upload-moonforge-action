#!/bin/sh

ACCESS_KEY="$1"
SECRET_KEY="$2"
HOST_BASE="$3"
USE_HTTPS="$4"
BUCKET="$5"
SOURCE="$6"
DESTINATION="$7"
EXCLUDE="$8"
INCLUDE="$9"

cat > ~/.s3cfg <<EOF
[default]
access_key = ${ACCESS_KEY}
secret_key = ${SECRET_KEY}
host_base = ${HOST_BASE}
host_bucket = ${HOST_BASE}
use_https = ${USE_HTTPS}
EOF

s3cmd sync \
  "$SOURCE" \
  "s3://${BUCKET}/${DESTINATION}" \
  ${EXCLUDE:+--exclude "$EXCLUDE"} \
  ${INCLUDE:+--include "$INCLUDE"}

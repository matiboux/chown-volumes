#!/bin/sh
set -e

if [ -z "$VOLUME_PATHS" ]; then
	exit 0
fi

while IFS= read -r VOLUME_PATH; do
	if [ -n "$VOLUME_PATH" ]; then
		echo "Chown '$VOLUME_PATH' to '${UID:-1000}:0'"
		chown -R ${UID:-1000}:0 ${VOLUME_PATH}
	fi
done <<EOF
$VOLUME_PATHS
EOF

exit 0

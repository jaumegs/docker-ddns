#!/bin/sh
set -eu

TYPE="${TYPE:-A}"
NAME="${NAME:-@}"
TTL="${TTL:-600}"
DELAY="${DELAY:-0}"
FREQUENCY="${FREQUENCY:-600}"
TIMEOUT="${TIMEOUT:-30}"

sleep "$DELAY"
while true; do
	NEWIP="$(curl -s ifconfig.me)"
	OLDIP="$(curl -s -m "$TIMEOUT" -H "Authorization: sso-key $KEY:$SECRET" -X GET https://api.godaddy.com/v1/domains/"$DOMAIN"/records/"$TYPE"/"$NAME" | jq -r '.[0].data')"
	if [ "$NEWIP" != "$OLDIP" ]; then
		echo "Updating DNS record $NAME.$DOMAIN of type $TYPE from $OLDIP to $NEWIP..."
		curl -s -m "$TIMEOUT" -X PUT \
			https://api.godaddy.com/v1/domains/"$DOMAIN"/records/"$TYPE"/"$NAME" \
			-H "Authorization: sso-key $KEY:$SECRET" \
			-H "accept: application/json" \
			-H "Content-Type: application/json" \
			-d "[ { \"data\": \"$NEWIP\", \"ttl\": $TTL } ]"
	fi
	sleep "$FREQUENCY"
done

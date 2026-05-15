#!/usr/bin/env bash
set -euo pipefail

: "${IKM_API_KEY:?Set IKM_API_KEY to a scoped instantKOM API token}"
: "${IKM_API_URL:?Set IKM_API_URL to the instantKOM API base URL}"

CHANNEL_ID="${IKM_CHANNEL_ID:-channel_ops}"
RECIPIENT_ID="${IKM_RECIPIENT_ID:-recipient_ops_room}"
HOST_NAME="${MONIT_HOST:-web-01}"
SERVICE_NAME="${MONIT_SERVICE:-api}"
EVENT_STATUS="${MONIT_EVENT:-resource limit}"

ikm send \
  --channel "${CHANNEL_ID}" \
  --to "${RECIPIENT_ID}" \
  --text "Monit alert: ${HOST_NAME}/${SERVICE_NAME} reported ${EVENT_STATUS}."

ikm tail --channel "${CHANNEL_ID}" --limit 5 --format table

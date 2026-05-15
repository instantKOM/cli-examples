#!/usr/bin/env bash
set -euo pipefail

: "${IKM_API_KEY:?Set IKM_API_KEY to a scoped instantKOM API token}"
: "${IKM_API_URL:?Set IKM_API_URL to the instantKOM API base URL}"

CHANNEL_ID="${IKM_CHANNEL_ID:-channel_members}"
SEGMENT_ID="${IKM_SEGMENT_ID:-segment_weekly_training}"
SEND_AT="${IKM_SEND_AT:-$(node -e "console.log(new Date(Date.now() + 7 * 24 * 60 * 60 * 1000).toISOString())")}"

ikm broadcast create \
  --target "${CHANNEL_ID}:${SEGMENT_ID}" \
  --send-status scheduled \
  --send-at "${SEND_AT}" \
  --text "Training reminder: book your weekly session in the app."

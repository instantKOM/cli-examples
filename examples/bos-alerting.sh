#!/usr/bin/env bash
set -euo pipefail

: "${IKM_API_KEY:?Set IKM_API_KEY to a scoped instantKOM API token}"
: "${IKM_API_URL:?Set IKM_API_URL to the instantKOM API base URL}"

CHANNEL_ID="${IKM_CHANNEL_ID:-channel_dispatch}"
ESCALATION_SEGMENT="${IKM_SEGMENT_ID:-segment_duty_team}"
INCIDENT="${IKM_INCIDENT:-door access offline}"

ikm broadcast create \
  --target "${CHANNEL_ID}:${ESCALATION_SEGMENT}" \
  --send-status sending \
  --text "BOS escalation: ${INCIDENT}. Confirm receipt in instantKOM."

ikm tickets create \
  --channel "${CHANNEL_ID}" \
  --subject "BOS escalation: ${INCIDENT}" \
  --priority urgent \
  --source automation \
  --data "{\"broadcastTarget\":\"${CHANNEL_ID}:${ESCALATION_SEGMENT}\"}"

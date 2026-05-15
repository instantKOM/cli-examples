#!/usr/bin/env bash
set -euo pipefail

: "${IKM_API_KEY:?Set IKM_API_KEY to a scoped instantKOM API token}"
: "${IKM_API_URL:?Set IKM_API_URL to the instantKOM API base URL}"

PAYLOAD_FILE="${1:-/dev/stdin}"
CHANNEL_ID="${IKM_CHANNEL_ID:-channel_support}"
PROJECT="${SENTRY_PROJECT:-frontend}"
ISSUE_TITLE="$(node -e "const fs=require('fs'); const p=JSON.parse(fs.readFileSync(process.argv[1], 'utf8')); console.log(p?.data?.issue?.title || p?.title || 'Sentry issue');" "${PAYLOAD_FILE}")"
ISSUE_URL="$(node -e "const fs=require('fs'); const p=JSON.parse(fs.readFileSync(process.argv[1], 'utf8')); console.log(p?.data?.issue?.web_url || p?.url || '');" "${PAYLOAD_FILE}")"

ikm tickets create \
  --channel "${CHANNEL_ID}" \
  --subject "Sentry: ${PROJECT}: ${ISSUE_TITLE}" \
  --priority high \
  --source automation \
  --data "{\"url\":\"${ISSUE_URL:-}\"}"

ikm status --format table

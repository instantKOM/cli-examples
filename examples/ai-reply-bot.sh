#!/usr/bin/env bash
set -euo pipefail

: "${IKM_API_KEY:?Set IKM_API_KEY to a scoped instantKOM API token}"
: "${IKM_API_URL:?Set IKM_API_URL to the instantKOM API base URL}"

CHAT_ID="${IKM_CHAT_ID:-chat_active_member}"
MESSAGE_ID="${IKM_MESSAGE_ID:-message_latest_member_question}"

DRAFT="$(ikm ai reply --message-id "${MESSAGE_ID}" --style concise --limit 1 --format text)"

printf '%s\n' "${DRAFT}"

if [[ "${IKM_SEND_REPLY:-0}" == "1" ]]; then
  ikm chats reply "${CHAT_ID}" --text "${DRAFT}"
fi

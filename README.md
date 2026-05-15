# instantKOM CLI Cookbook

Production-oriented examples for using `ikm` in monitoring, automation, and incident workflows.

[![CLI Documentation](https://img.shields.io/badge/CLI%20Docs-instantKOM-blue)](https://app.instantkom.app/de/help/cli)
[![npm package](https://img.shields.io/badge/npm-%40instantkom%2Fcli-red)](https://www.npmjs.com/package/@instantkom/cli)

## Install

```bash
npm install -g @instantkom/cli
ikm --help
```

## Before running examples

Set the target API and authenticate through environment variables or a configured profile:

```bash
export IKM_API_URL="https://staging.instantkom.app/api"
export IKM_API_KEY="<scoped-api-token>"
```

The examples intentionally use placeholders. Replace IDs such as `channel_ops` or `segment_members` with IDs from your tenant.

## Workflow examples

| Workflow | File | What it demonstrates |
|----------|------|----------------------|
| Monitoring alert | [`examples/monit-alert.sh`](examples/monit-alert.sh) | Posts infrastructure alerts into an operations channel and tails recent activity. |
| Sentry webhook | [`examples/sentry-webhook.sh`](examples/sentry-webhook.sh) | Converts a Sentry-style webhook payload into a high-priority support ticket. |
| Scheduled newsletter | [`examples/cron-broadcast.sh`](examples/cron-broadcast.sh) | Schedules a segment-targeted weekly reminder. |
| BOS escalation | [`examples/bos-alerting.sh`](examples/bos-alerting.sh) | Sends operational escalation alerts and opens a tracking ticket. |
| AI-assisted reply | [`examples/ai-reply-bot.sh`](examples/ai-reply-bot.sh) | Drafts a concise AI reply and optionally sends it into an active chat. |

## Broadcast targeting

Broadcasts are created for channels, channel/segment pairs, or reusable target groups. They do not accept arbitrary recipient lists. Use:

```bash
ikm broadcast create --target channel_ops:segment_members --text "..."
```

Do not model broadcasts as `--recipient`, `--recipients`, or `--to` calls.

## Run an example

```bash
chmod +x examples/monit-alert.sh
IKM_CHANNEL_ID="channel_ops" IKM_RECIPIENT_ID="recipient_ops_room" examples/monit-alert.sh
```

## Source of truth

The canonical source lives in the instantKOM monorepo at `services/cli/cookbook`.
The public repository mirrors the checked examples to:

https://github.com/instantKOM/cli-examples

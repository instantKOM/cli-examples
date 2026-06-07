# instantKOM CLI Cookbook

Praxisnahe Beispiele für `ikm` in Monitoring, Automatisierung und Incident-Workflows.

[![CLI-Dokumentation](https://img.shields.io/badge/CLI%20Doku-instantKOM-blue)](https://instantkom.app/de/help/cli)
[![npm-Paket](https://img.shields.io/badge/npm-%40instantkom%2Fcli-red)](https://www.npmjs.com/package/@instantkom/cli)

## Installation

```bash
npm install -g @instantkom/cli
ikm --help
```

## Vor dem Ausführen

Setzen Sie die Ziel-API und authentifizieren Sie sich über Umgebungsvariablen oder ein konfiguriertes Profil:

```bash
export IKM_API_URL="https://api.instantkom.app"
export IKM_API_KEY="<scoped-api-token>"
```

Die Beispiele verwenden bewusst Platzhalter. Ersetzen Sie IDs wie `channel_ops` oder `segment_members` durch IDs aus Ihrem eigenen Mandanten.

## Workflow-Beispiele

| Workflow | Datei | Was das Beispiel zeigt |
|----------|------|----------------------|
| Monitoring-Alarm | [`examples/monit-alert.sh`](examples/monit-alert.sh) | Sendet Infrastruktur-Alarme in einen Operations-Kanal und zeigt aktuelle Aktivität. |
| Sentry-Webhook | [`examples/sentry-webhook.sh`](examples/sentry-webhook.sh) | Wandelt einen Sentry-ähnlichen Webhook-Payload in ein Support-Ticket mit hoher Priorität um. |
| Geplanter Newsletter | [`examples/cron-broadcast.sh`](examples/cron-broadcast.sh) | Plant eine regelmäßige Erinnerung an ein Segment. |
| BOS-Eskalation | [`examples/bos-alerting.sh`](examples/bos-alerting.sh) | Sendet operative Eskalationsmeldungen und erstellt ein Tracking-Ticket. |
| KI-Antwortentwurf | [`examples/ai-reply-bot.sh`](examples/ai-reply-bot.sh) | Erstellt einen kurzen KI-Antwortentwurf und sendet ihn optional in einen aktiven Chat. |

## Newsletter-Zielgruppen

Newsletter werden für Kanäle, Kanal/Segment-Kombinationen oder wiederverwendbare Zielgruppen erstellt. Beliebige Empfängerlisten sind hier nicht das Modell. Verwenden Sie:

```bash
ikm broadcast create --target channel_ops:segment_members --text "..."
```

Modellieren Sie Newsletter nicht als `--recipient`, `--recipients` oder `--to`-Aufrufe.

## Beispiel ausführen

```bash
chmod +x examples/monit-alert.sh
IKM_CHANNEL_ID="channel_ops" IKM_RECIPIENT_ID="recipient_ops_room" examples/monit-alert.sh
```

## Source of Truth

Die kanonische Quelle liegt im instantKOM-Monorepo unter `services/cli/cookbook`.
Das öffentliche Repository spiegelt die geprüften Beispiele nach:

https://github.com/instantKOM/cli-examples

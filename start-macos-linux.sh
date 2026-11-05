#!/usr/bin/env sh
cd "$(dirname "$0")" || exit 1
if ! command -v node >/dev/null 2>&1; then
  echo 'Node.js 20+ fehlt. Download: https://nodejs.org/'
  exit 1
fi
printf '\nPLAYROOM startet unter http://localhost:3000\n'
exec node server.js

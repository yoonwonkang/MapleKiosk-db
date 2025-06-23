#!/bin/sh

set -e

host=$(echo "$1" | cut -d: -f1)
port=$(echo "$1" | cut -d: -f2)
shift

timeout=15
while [ "$#" -gt 0 ]; do
  key="$1"
  case $key in
    -t|--timeout)
      timeout="$2"
      shift
      shift
      ;;
    --)
      shift
      break
      ;;
    *)
      shift
      ;;
  esac
done

echo "Waiting for $host:$port to be available..."

i=0
while [ "$i" -lt "$timeout" ]; do
  if nc -z "$host" "$port"; then
    echo "$host:$port is available!"
    exec "$@"
    exit 0
  fi
  i=$((i + 1))
  sleep 1
done

echo "Timeout waiting for $host:$port"
exit 1
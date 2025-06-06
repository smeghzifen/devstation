#!/bin/bash

# chmod +x free-port.sh
#./free-port.sh 8080

PORT=$1

if [ -z "$PORT" ]; then
  echo "Usage: $0 <port>"
  exit 1
fi

PID=$(sudo lsof -t -i :"$PORT")

if [ -z "$PID" ]; then
  echo "Aucun processus n'écoute sur le port $PORT"
else
  echo "Port $PORT utilisé par PID $PID"
  echo "Tentative d'arrêt du processus..."
  sudo kill -9 "$PID" && echo "Processus $PID tué avec succès."
fi
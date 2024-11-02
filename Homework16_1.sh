#!/bin/bash

PID_FILE="/tmp/sleep walking server.pid"
SERVER_SCRIPT="/tmp/sleep walking server"

case "$1" in
    start)
        if [ -f "$PID_FILE" ]; then
            echo "Sleep Walking Server is already running."
        else
            "$SERVER_SCRIPT" &
            echo "Sleep Walking Server started."
        fi
        ;;
    stop)
        if [ -f "$PID_FILE" ]; then
            kill "$(cat "$PID_FILE")"
            rm "$PID_FILE"
            echo "Sleep Walking Server stopped."
        else
            echo "Sleep Walking Server is not running."
        fi
        ;;
    *)
        echo "Usage: sleep_walking start|stop"
        exit 1
        ;;
esac


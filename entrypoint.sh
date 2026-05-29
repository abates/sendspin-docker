#!/bin/ash

if [[ -n "${SENDSPIN_NAME}" ]]; then
    set -- "$@" "--name" "$SENDSPIN_NAME"
fi

if [[ -n "${SENDSPIN_AUDIO_DEVICE}" ]]; then
    set -- "$@" "--audio-device" "$SENDSPIN_AUDIO_DEVICE"
fi

if [[ -n "${SENDSPIN_SERVER_URL}" ]]; then
    set -- "$@" "--url" "$SENDSPIN_SERVER_URL"
fi

if [[ -n "${SENDSPIN_ID}" ]]; then
    set -- "$@" "--id" "$SENDSPIN_ID"
fi

/usr/local/bin/sendspin daemon "$@"

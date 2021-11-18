#!/bin/sh
MQTT_TOPIC="${MQTT_TOPIC:-test}"
MQTT_URL="${MQTT_URL:-mqtts://username:password@localhost:8883/${MQTT_TOPIC}}"
MQTT_MESG="${MQTT_MESG:-test}"
MQTT_DEBUG="${MQTT_DEBUG:-false}"
MQTT_OPTS="${MQTT_OPTS:-}"

if [ "${MQTT_MESG}" = "test" ] ; then
  MQTT_MESG="$(date '+%Y%m%d-%H%M%S') $(cat /proc/sys/kernel/random/uuid) $(id -u -r)@$(hostname)"
fi

if [ "${MQTT_DEBUG}" = "true" ] ; then
  MQTT_OPTS="${MQTT_OPTS} -d"
fi

# shellcheck disable=2086 # Intended splitting of MQTT_OPTS
exec mosquitto_pub ${MQTT_OPTS} -L "${MQTT_URL}" -m "${MQTT_MESG}"

#!/bin/sh
MQTT_TOPIC="${MQTT_TOPIC:-test}"
MQTT_URL="${MQTT_URL:-mqtts://username:password@localhost:8883/${MQTT_TOPIC}}"
MQTT_DEBUG="${MQTT_DEBUG:-false}"
MQTT_OPTS="${MQTT_OPTS:-}"

if [ "${MQTT_DEBUG}" = "true" ] ; then
  MQTT_OPTS="${MQTT_OPTS} -d"
fi

exec mosquitto_sub ${MQTT_OPTS} -L "${MQTT_URL}"

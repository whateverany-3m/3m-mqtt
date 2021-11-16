ARG SOURCE_GROUP
ARG SOURCE_IMAGE
ARG SOURCE_REGISTRY
ARG SOURCE_VERSION

FROM $SOURCE_REGISTRY$SOURCE_GROUP$SOURCE_IMAGE:$SOURCE_VERSION

COPY src/rootfs/ /

RUN set -x ;\
  echo "INFO: begin RUN" ;\
  /sbin/apk add --no-cache \
    mosquitto-clients=2.0.11-r0 \
  ;\
  echo "INFO: end RUN"

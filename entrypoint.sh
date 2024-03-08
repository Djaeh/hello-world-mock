#!/bin/bash
set -x
set -e
karate_jar="karate-1.1.0.jar"
echo $PATH
# Download karate.jar if is not found
if [ ! -f "${karate_jar}" ]; then
  curl -L https://github.com/karatelabs/karate/releases/download/v1.1.0/karate-1.1.0.jar -o ${karate_jar}
fi

# Run karate mock server, using all feature files under features/*-service/*.feature
java \
    -XX:+HeapDumpOnOutOfMemoryError \
    -XX:+ExitOnOutOfMemoryError \
    -XX:HeapDumpPath=/tmp \
    -Dcom.sun.management.jmxremote \
    -Dcom.sun.management.jmxremote.authenticate=false \
    -Dcom.sun.management.jmxremote.ssl=false \
    -Dcom.sun.management.jmxremote.local.only=false \
    -Dcom.sun.management.jmxremote.port=1099 \
    -Dcom.sun.management.jmxremote.rmi.port=1099 \
    -Djava.rmi.server.hostname=127.0.0.1 \
    -Dlogback.configurationFile=logback.xml \
    -Dlog4j2.formatMsgNoLookups=true \
    -jar ${karate_jar} \
    $(find features  -wholename "*service*feature" | grep -v -e 'response' -e 'error' | xargs -I{} echo "-m {} ") \
    -p ${KARATE_PORT:-8081}
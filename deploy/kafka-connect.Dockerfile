FROM confluentinc/cp-kafka-connect:latest

RUN curl "https://highlight-client-bundle.s3.us-east-2.amazonaws.com/assets/clickhouse-kafka-connect-v1.2.6-confluent.jar" --output /home/appuser/clickhouse-kafka-connect-v1.2.6.jar

ARG SECURITY_PROTOCOL=SASL_SSL
ARG SASL_MECHANISM=SCRAM-SHA-512

ENV CLASSPATH=/usr/share/java/monitoring-interceptors/monitoring-interceptors-7.3.0.jar
ENV CONNECT_CONFIG_STORAGE_REPLICATION_FACTOR=2
ENV CONNECT_CONFIG_STORAGE_TOPIC=clickhouse-connector-configs
ENV CONNECT_GROUP_ID=clickhouse-connector
ENV CONNECT_KEY_CONVERTER=org.apache.kafka.connect.storage.StringConverter
ENV CONNECT_LOG4J_LOGGERS=org.apache.kafka.connect=INFO,com.clickhouse=INFO
ENV CONNECT_OFFSET_FLUSH_INTERVAL_MS=1000
ENV CONNECT_OFFSET_STORAGE_REPLICATION_FACTOR=2
ENV CONNECT_OFFSET_STORAGE_TOPIC=clickhouse-connector-offsets
ENV CONNECT_PLUGIN_PATH="/usr/share/java,/usr/share/confluent-hub-components,/home/appuser"
ENV CONNECT_REST_PORT=8083
ENV CONNECT_PRODUCER_SASL_MECHANISM=${SASL_MECHANISM}
ENV CONNECT_PRODUCER_SECURITY_PROTOCOL=${SECURITY_PROTOCOL}
ENV CONNECT_REST_ADVERTISED_HOST_NAME=localhost:8083
ENV CONNECT_SASL_MECHANISM=${SASL_MECHANISM}
ENV CONNECT_SECURITY_PROTOCOL=${SECURITY_PROTOCOL}
ENV CONNECT_STATUS_STORAGE_REPLICATION_FACTOR=2
ENV CONNECT_STATUS_STORAGE_TOPIC=clickhouse-connector-status
ENV CONNECT_VALUE_CONVERTER=org.apache.kafka.connect.json.JsonConverter

ENV CONNECT_CONSUMER_CLIENT_RACK=use2-az2
ENV CONNECT_CONSUMER_FETCH_MAX_WAIT_MS=60000
ENV CONNECT_CONSUMER_FETCH_MIN_BYTES=10485760
ENV CONNECT_CONSUMER_FETCH_MAX_BYTES=104857600
ENV CONNECT_CONSUMER_MAX_PARTITION_FETCH_BYTES=10485760
ENV CONNECT_CONSUMER_MAX_POLL_RECORDS=500000
ENV CONNECT_CONSUMER_REQUEST_TIMEOUT_MS=180000
ENV CONNECT_CONSUMER_SASL_MECHANISM=${SASL_MECHANISM}
ENV CONNECT_CONSUMER_SECURITY_PROTOCOL=${SECURITY_PROTOCOL}
ENV CONNECT_CONSUMER_SESSION_TIMEOUT_MS=60000

ENV KAFKA_HEAP_OPTS="-Xms1g -Xmx28g"

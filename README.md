#!/bin/bash

# change 127.0.0.1 by your Docker ADW_HOST
# Exec the command line from:
docker run --net=host -it confluentinc/cp-schema-registry:3.3.0 bash

# Or download the Confluent Binaries at
# https://www.confluent.io/download/
# And add them to your PATH

# Produce a record with one field
kafka-avro-console-producer \
--broker-list localhost:9092 --topic test-avro \
--property schema.registry.url=http://127.0.0.1:8081 \
--property value.schema='{"type":"record","name":"myrecord",
"fields":[{"name":"f1","type":"string"}]}'

{"f1":"value1"}
{"f1":"value2"}
{"f1":"value3"}

# let's trigger an error:
{"f2":"value4"}

# let's trigger another error:
{"f1":1}

# Consume the records from the beginning of the topic:
kafka-avro-console-consumer --topic test-avro \
--bootstrap-server localhost:9092 \
--property schema.registry.url=http://127.0.0.1:8081 \
--from-beginning

# Produce some errors with an incompatible schema (we changed to int) - should produce a 409
kafka-avro-console-producer \
--broker-list localhost:9092 --topic test-avro \
--property schema.registry.url=http://127.0.0.1:8081 \
--property value.schema='{"type":"int"}'


{
"type": "record",
"name": "CustomerTest",
"namespace": "com.example",
"doc": "This is a test of the schema registry",
"fields": [
{
"name": "first_name",
"type": "string"
},
{
"name": "age",
"type": "int"
},
{
"name": "height",
"type": "float"
},
{
"name": "last_name",
"type": "string",
"doc": "Person's last name. Unknown if not referenced",
"default": "Unknown"
}
]
}














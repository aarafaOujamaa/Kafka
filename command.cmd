#From  Terminal
>> docker-compose -f docker-compose.yml --env-file environment.env up
>> docker exec -it kafka-1 kafka-topics --list --bootstrap-server localhost:9092
>> docker exec -it kafka-2 kafka-topics --list --bootstrap-server localhost:9094
>> docker exec -it kafka-1 kafka-topics  --create  --topic test-topic2  --partitions 3  --replication-factor 2  --bootstrap-server localhost:9090

#From exec container
>> kafka-topics --create --topic test-topic --bootstrap-server localhost:9092
>> kafka-topics --list  --bootstrap-server localhost:9092
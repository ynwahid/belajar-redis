# 9. Flush
# Jalankan docker compose
docker-compose -f "2. redis-with-config/docker-compose.yaml" up -d
# Masuk ke redis di container
docker container exec -it redis /bin/sh
redis-cli -h localhost

# Flushdb
# Remove all keys from the selected database
flushdb
# example
select 1
flushdb

# Flushall
# Remove all keys from the all database
flushall
# example
flushall

# Matikan dan hapus container hasil docker compose
docker-compose -f "2. redis-with-config/docker-compose.yaml" down
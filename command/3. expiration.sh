# 7. Expiration
# Jalankan docker compose
docker-compose -f "2. redis-with-config/docker-compose.yaml" up -d
# Masuk ke redis di container
docker container exec -it redis /bin/sh
redis-cli -h localhost
# Pilih database yang akan digunakan (default 0).
select 0

# Secara default Redis menyimpan data secara permanen. Namun,
# kita bisa menambahkan durasi kadaluwarsa.
expire <key> <seconds>
# example
set ynw1 "yusuf nur wahid 1"
set ynw2 "yusuf nur wahid 2"
set ynw3 "yusuf nur wahid 3"
expire ynw1 10

# Set value and add expiration time
setex <key> <seconds> <value>
# example
setex ynw6 10 "contoh"

# Get time to live for a key
ttl <key>
# example
ttl ynw1

# Matikan dan hapus container hasil docker compose
docker-compose -f "2. redis-with-config/docker-compose.yaml" down
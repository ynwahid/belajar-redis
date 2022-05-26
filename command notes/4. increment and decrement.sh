# 8. Increment and Decrement
# Jalankan docker compose
docker-compose -f "2. redis-with-config/docker-compose.yaml" up -d
# Masuk ke redis di container
docker container exec -it redis /bin/sh
redis-cli -h localhost
# Pilih database yang akan digunakan (default 0).
select 0

# Increment
# Bisa menggunakan key yang belum diinisialiasi juga.
# Operasi ini juga hanya berlaku pada tipe data string of number.
incr <key>
# example
incr counter

# Decrement
decr <key>
# example
decr counter

# Increment with specified increment amount
incrby <key> <increment_amount>
# example
incrby counter 5

# Decrement with specified decrement amount
decrby <key> <decrement_amount>
# example
decrby counter 5

# Matikan dan hapus container hasil docker compose
docker-compose -f "2. redis-with-config/docker-compose.yaml" down
# 1
# Jalankan docker compose
docker-compose -f "1. redis/docker-compose.yaml" up -d
# Masuk ke shell container redis
docker container exec -it redis /bin/sh
# Masuk ke cli redis
redis-cli -h <host> -p <port>
# Port bersifat opsional, jika tidak diisi maka akan menggunakan
# port default
redis-cli -h localhost
# Cek koneksi ke server redis
ping
# Matikan dan hapus container hasil docker compose
docker-compose -f "1. redis/docker-compose.yaml" down

# 2
# Jalankan docker compose
docker-compose -f "2. redis-with-config/docker-compose.yaml" up -d
# Masuk ke redis di container
docker container exec -it redis /bin/sh
redis-cli -h localhost
# Pilih database yang akan digunakan (default 0).
select 1
# Matikan dan hapus container hasil docker compose
docker-compose -f "2. redis-with-config/docker-compose.yaml" down
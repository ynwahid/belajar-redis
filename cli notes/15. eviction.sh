# 19. Eviction
# Ketika memory redis penuh, maka redis secara default akan mereject
# semua request penyimpanan data.
# Hal ini mungkin bisa menjadi masalah ketika kita hanya menggunakan redis
# sebagai cache untuk media penyimpanan sementara.
# Kadang akan sangat berguna jika memory penuh, redis bisa secara
# otomatis menghapus data yang sudah jarang digunakan.
# Redis memiliki fitur ini, yaitu fitur eviction.
# Fitur ini akan menghapus data lama atau yang jarang digunakan
# dan menerima data baru.
# Namun, untuk mengaktifkan fitur ini, kita perlu memberi tahu redis,
# maximum memory yang boleh digunakan dan bagaimana strategi untuk
# melakukan eviction-nya.
# Untuk referensinya bisa dibaca di https://redis.io/docs/manual/eviction/.

# Untuk strateginya secara umum ada dua, yaitu LRU dan LFU.
# LRU -> Least Recently Used (yang terakhir kali digunakan).
# LFU -> Least Frequently Used (yang paling sedikit digunakan).
# Jika yakin semua key terdapat expiry-nya maka disarankan menggunakan
# volatile-lru.
# volatile-random akan menghapus data yang memiliki expiry secara
# random.

# Set Maximum Memory
maxmemory <bytes>
# Set Maxmemory Policy
maxmemory-policy <eviction-strategy>
# example
maxmemory 100mb
maxmemory 10gb
maxmemory-policy allkeys-lfu

# Jalankan docker compose
docker-compose -f "5. redis-with-acl/docker-compose.yaml" up -d
# Masuk shell redis server
docker container exec -it redis /bin/bash
redis-cli -h localhost
# Masuk shell redis client
docker container exec -it redis-client /bin/bash
redis-cli -h redis

# Matikan dan hapus container hasil docker compose
docker-compose -f "5. redis-with-acl/docker-compose.yaml" down
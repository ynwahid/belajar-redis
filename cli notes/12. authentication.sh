# 16. Authentication
# Autentikasi adalah proses verifikasi identitas untuk memastikan
# bahwa yang mengakses adalah identitas yang benar.
# Redis memiliki fitur authentication dan kita bisa menambahkannya
# di file konfigurasi server redis.
# Namun, perlu diingat bahwa proses autentikasi di redis itu sangat
# cepat. Maka dari itu, pastikan kita menggunakan password sepanjang
# mungkin agar tidak mudah di-brute force.

# Configs
# Set connection configs
# Comment the bind config
# bind 127.0.0.1 -::1
protected-mode yes
# Set user default config (minimal bisa melakukan connection) agar
# kita bisa melakukan autentikasi user
user default on +@connection
# Add ACL User(s)
user <username> ... acl rules ...
# example
user cakcup on +@all >rahasia

# Jalankan docker compose
docker-compose -f "5. redis-with-acl/docker-compose.yaml" up -d
# Masuk shell redis server
docker container exec -it redis /bin/bash
redis-cli -h localhost
# Masuk shell redis client
docker container exec -it redis-client /bin/bash
redis-cli -h redis

# Auth user
auth <user> <password>
# example
auth cakcup rahasia

# Matikan dan hapus container hasil docker compose
docker-compose -f "5. redis-with-acl/docker-compose.yaml" down
# 17. Authorization
# Authorization adalah proses memberi hak akses terhadap identitas
# yang telah berhasil melewati proses authentication.
# Redis mendukung hal ini, jadi kita bisa membatasi hak akses
# apa saja yang bisa dilakukan oleh identitas yang kita buat.

# Acl cat
# Untuk mendapatkan kategori yang bisa dipakai di Redis
acl cat <category_name>
# example
acl cat
acl cat read

# Add keys
# Agar kita bisa memiliki akses terhadap keys
user <username> on +/-<@category> ~<keys_pattern> >password
# example
user cakcup on +@all ~* >rahasia
user ucup on +@all -@set ~* >rahasia
user nur on +@read ~ynw* >rahasia

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
get ynw1
set ynw1 "ynw1"
set ynw2 "ynw2"
set ucup1 "ucup1"
set ucup2 "ucup2"
keys *
auth ucup rahasia
get ynw1
get ynw2
get ucup1
get ucup2
set ynw1 "ynw1"
auth nur rahasia
keys *
get ynw1
get ucup1

# Matikan dan hapus container hasil docker compose
docker-compose -f "5. redis-with-acl/docker-compose.yaml" down
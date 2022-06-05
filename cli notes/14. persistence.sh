# 18. Persistence
# Media penyimpanan utama bagi redis adalah memory.
# Namun, kita juga bisa melakukan penyimpanan data di dalam disk
# jika kita mau.
# Akan tetapi, perlu diingat proses penyimpanan data ke disk redis
# tidak realtime dengan menggunakan scheduler dengan konfigurasi tertentu
# (backup).
# Maka dari itu jangan menggunakan redis sebagai media penyimpanan
# yang persistence (permanen).
# Redis juga menyimpan data ke disk secara keseluruhan.
# Jika semisal di memory terdapat 10 GB data, maka yang disimpan
# ke disk juga 10 GB juga.
# Melainkan, gunakan redis sebagai media penyimpanan pembantu (support).
# Misalnya untuk caching.

# Jalankan docker compose
docker-compose -f "5. redis-with-acl/docker-compose.yaml" up -d
# Masuk shell redis server
docker container exec -it redis /bin/bash
redis-cli -h localhost
# Masuk shell redis client
docker container exec -it redis-client /bin/bash
redis-cli -h redis

# Persistance Configuration
# Kita melakukan penyimpanan ke disk jika dalam <s> detik jika
# terjadi minimal perubahan <c> data.
save <seconds> <changes>
# Karena redis ini single thread maka dia tidak akan membalas
# perintah yang diberikan (tidak merespon) selama masih dalam
# proses penyimpanan data ke disk.
# Maka dari itu jangan menggunakan durasi yang terlalu cepat.
# example
save 900 1
# Jika dalam 900s ada minimal 1 data yang berubah maka akan disimpan di dalam disk.
save 300 10
# Atau jika dalam 300s ada minimal 10 data yang berubah maka akan disimpan di dalam disk.
save 60 10000
# Atau jika dalam 60s ada minimal 10000 data yang berubah maka akan disimpan di dalam disk.

# Manually Backup
# Save
# Save melakukan penyimpanan ke disk secara Synchronous
save
# example
auth cakcup rahasia
set ynw1 "ynw1"
set ynw2 "ynw2"
set ynw3 "ynw3"
save
exit
exit
docker container redis stop
docker container redis start
auth cakcup rahasia
keys *

# Bgsave
# Bgsave melakukan penyimpanan ke disk secara Asynchronous
bgsave
# example
bgsave

# Matikan dan hapus container hasil docker compose
docker-compose -f "5. redis-with-acl/docker-compose.yaml" down
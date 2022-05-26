# 10. Pipeline
# Jalankan docker compose
docker-compose -f "3. redis-with-command/docker-compose.yaml" up -d
# Masuk ke redis di container
docker container exec -it redis /bin/sh

# Untuk melakukan bulk operation kita bisa menggunakan pipeline
# Ambil file yang berisi perintah-perintah redis untuk digunakan
# sebagai input dalam proses bulk di redis pipeline.
cat /usr/local/etc/command/sets.txt | redis-cli -h localhost --pipe
# Namun jika datanya sangat banyak, lebih baik dikirim per batch
# untuk menghemat network transfer.
# Misal jika ada 1 juta data, maka akan dikirim per 1000 data.

# Matikan dan hapus container hasil docker compose
docker-compose -f "3. redis-with-command/docker-compose.yaml" down
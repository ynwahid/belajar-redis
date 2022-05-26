# 11. Transaction
# Jalankan docker compose
docker-compose -f "3. redis-with-command/docker-compose.yaml" up -d
# Masuk ke redis di container
docker container exec -it redis /bin/sh
redis-cli -h localhost

# Agar integrasi data di dalam database terjaga, maka perlu proses transaksi

# Start
# Untuk memulai transaksi, bisa menggunakan instruksi multi
multi
# example
multi
set ynw1 "ynw1"
set ynw2 "ynw2"

# Exec
# Mengeksekusi/apply semua instruksi setelah multi
exec
# example
exec

# Discard
# Membatalkan/rollback semua instruksi stelah multi
discard
# example
discard

# Matikan dan hapus container hasil docker compose
docker-compose -f "3. redis-with-command/docker-compose.yaml" down
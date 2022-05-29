# 15. Security
# Secara default redis akan mendengarkan request dari semua
# network interface.
# Ini bisa jadi sangat berbahaya karena bisa jadi redis terekspos
# ke publik.
# Namun redis memiliki second layer untuk pengecekan koneksi, yaitu
# mode protected.
# Secara default mode protected-nya aktif yang artinya walaupun
# redis bisa diakses dari manapun, redis hanya mau menerima request
# dari IP 127.0.0.1 (localhost).

# Jalankan docker compose
docker-compose -f "4. redis-with-security/docker-compose.yaml" up -d
# Masuk ke redis di container
docker container exec -it redis /bin/bash
redis-cli -h localhost

# Default
bind 127.0.0.1 -::1
# Setelah Diubah (dicomment)
# bind 127.0.0.1 -::1

# Matikan dan hapus container hasil docker compose
docker-compose -f "3. redis-with-command/docker-compose.yaml" down
# 10. Client Connection
# Redis menyimpan semua informasi dari client di server.
# Hal ini akan memudahkan kita untuk melihat daftar client dan
# juga mengecek jika ada anomali, misalnya terlalu banyak koneksi
# client ke redis.

# Jalankan docker compose
docker-compose -f "3. redis-with-command/docker-compose.yaml" up -d
# Masuk ke redis di container
docker container exec -it redis /bin/bash
redis-cli -h localhost

# Client List
# Get the list of client connections.
client list
# example
client list

# Client ID
# Returns the ID of the current connection.
client id
# example
client id

# Client Kill
# The CLIENT KILL command closes a given client connection.
client kill <ip>:<port>
# example
client kill 127.0.0.1:47322
# Ketika koneksi sudah terputus redis punya kemampuan untuk melakukan
# koneksi ulang (reconnect).
# Jika terjadi koneksi zombie maka sebaiknya kita kill semua koneksi dan
# biarkan aplikasi kita melakukan reconnect.

# Matikan dan hapus container hasil docker compose
docker-compose -f "3. redis-with-command/docker-compose.yaml" down
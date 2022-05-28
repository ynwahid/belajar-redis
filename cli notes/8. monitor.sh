# 12. Monitor
# Ada kalanya kita ingin melakukan debug terhadap aplikasi kita.
# Baik di dalam aplikasi kita ataukah di redis untuk mengetahui
# apakah perintah yang dikirim ke redis masuk dan apakah perintah
# yang masuk itu mengirimkan data yang benar.

# Jalankan docker compose
docker-compose -f "3. redis-with-command/docker-compose.yaml" up -d
# Masuk ke redis di container
docker container exec -it redis /bin/bash
redis-cli -h localhost

# Monitor
# Listen to all requests received from the client in real time.
monitor
# example
monitor
# create new terminal as client
set ynw1 "ynw1"
set ynw2 "ynw2"
set ynw3 "ynw3"

# Matikan dan hapus container hasil docker compose
docker-compose -f "3. redis-with-command/docker-compose.yaml" down
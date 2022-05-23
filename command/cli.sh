# Masuk ke shell container redis
docker container exec -it redis /bin/sh
# Masuk ke cli redis
redis-cli -h <host> -p <port>
# Port bersifat opsional, jika tidak diisi maka akan menggunakan
# port default
redis-cli -h localhost
# Cek koneksi ke server redis
ping
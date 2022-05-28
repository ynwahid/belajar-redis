# 13. Server Information/Command
# Terkadang kita butuh untuk mengetahui statistik dari redis server,
# seperti: jumlah memory yang digunakan, konfigurasi, dll.
# Redis memiliki fitur untuk mendapatkan informasi server dan memonitornya.

# Jalankan docker compose
docker-compose -f "3. redis-with-command/docker-compose.yaml" up -d
# Masuk ke redis di container
docker container exec -it redis /bin/bash
redis-cli -h localhost

# Info
# Get information and statistics about the server
info <section>
# Jika section tidak diberi argumen, maka akan menampilkan semua
# informasi
# example
info
info memory
info keyspace

# Config
# Get the value of a configuration parameter
config <subcommand>

# Config Get
# The CONFIG GET command is used to read the configuration
# parameters of a running Redis server.
config get <pattern>
# example
config get *
config get databases

# Config Set
# The CONFIG SET command is used in order to reconfigure
# the server at run time without the need to restart Redis.
# This method is not recommended because we can't track the change.
# Change the config by updating the config file instead.
config set <parameter> <value>
# example
config set

# Config Resetstat
# The CONFIG RESETSTAT command is used in order to resets
# the statistics reported by Redis using the INFO command.
config resetstat

# Config Rewrite
# The CONFIG REWRITE command rewrites the redis.conf file the
# server was started with, applying the minimal changes needed
# to make it reflect the configuration currently used by the
# server, which may be different compared to the original one
# because of the use of the CONFIG SET command.
# This method is not recommended because we can't track the change.
# Change the config by updating the config file instead.
config rewrite

# Slowlog
# Slowlog is a system to log queries that exceeded a specified
# execution time.
# This does not include I/O operations like talk with the client,
# reply, and so forth, but the time to actually execute the command.
slowlog <subcommand>
# Get
# Return top entries of the slowlog
slowlog get <count>
# example
slowlog get 5

# Matikan dan hapus container hasil docker compose
docker-compose -f "3. redis-with-command/docker-compose.yaml" down
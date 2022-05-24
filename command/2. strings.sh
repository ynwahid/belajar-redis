# 3. Strings Data Type
# Jalankan docker compose
docker-compose -f "2. redis-with-config/docker-compose.yaml" up -d
# Masuk ke redis di container
docker container exec -it redis /bin/sh
redis-cli -h localhost
# Pilih database yang akan digunakan (default 0).
select 0

# Insert value
# Set key value pairs, value bisa string, json, xml
set <key> <value>
# Untuk key atau value lebih dari satu kata harus menggunakan
# tanda petik dua.
set <"key"> <"value">
# Jika value baru diisikan ke dalam ke yang sudah ada maka akan
# me-replace value yang lama
# example
set "ynw 1" "yusuf nur wahid"
set ynw1 "yusuf nur wahid"
set "ynw 2" "yusuf nur wahid"
set ynw2 "yusuf nur wahid"
set "ynw 3" "yusuf nur wahid"
set ynw3 "yusuf nur wahid"

# Get value
get <key>
# Untuk key yang terdiri dari satu kata bisa menggunakan
# tanda petik dua
get <"key">
# Jika key tidak memiliki nilai maka akan mengembalikan value nil
# Get hanya bisa mengambil nilai dari satu key
# example
get ynw1
get "ynw 1"
get tidakada

# Check key existence
# Jika mengembalikan value 1 artinya ada, jika 0 maka tidak ada
exists <key>
exists <"key">
# example
exists ynw1
exists "ynw 10"

# Delete a key
# Bisa menghapus banyak key dalam waktu yang sama
# Setelah melakukan operasi ini akan mengembalikan jumlah data
# yang dihapus, jika 0 artinya tidak ada data yang dihapus
del <key> <key2...>
# example
del ynw1 ynw2
del tidakada

# Append value to a key
# Meskipun sebuah key belum dipakai, tetap akan sukses
# Setelah melakukan append, maka akan mendapatkan kembalian nilai
# panjang total dari string
append <key> <value>
append <"key"> <"value">
# example
set ynw1 "yusuf nur wahid"
append ynw1 " ucup"
append tidakada "empty"

# Keys
# Untuk mendapatkan banyak keys maka bisa menggunakan command
# keys dengan pola regex
keys <pattern>
# example
keys ynw*

# Setrange
# Overwrite some parts of a string starts at the specified offset
setrange <key> <offset> <value>
# example
setrange ynw1 0 YUSUF

# Getrange
# Get substring from value start and end at specified position
getrange <key> <start> <end>
# example
getrange ynw1 0 4

# Set multiple values with multiple keys
mset <key value> <key2 value2...>
# example
mset ynw1 "ucup 1" ynw2 "ucup 2" ynw3 "ucup 3"

# Get multiple values from multiple keys
mget <key> <key2...>
# example
mget ynw1 ynw2 ynw3

# Matikan dan hapus container hasil docker compose
docker-compose -f "2. redis-with-config/docker-compose.yaml" down
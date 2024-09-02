echo -n "password" | md5sum | tr -d " *-" > target_hashes.txt
echo -n "PASSWORD" | md5sum | tr -d " *-" >> target_hashes.txt
echo -n "Password" | md5sum | tr -d " *-" >> target_hashes.txt
echo -n "P455w0rd" | md5sum | tr -d " *-" >> target_hashes.txt
echo -n "rockyou" | md5sum | tr -d " *-" >> target_hashes.txt
echo -n "S3CuReP455Word" | md5sum | tr -d " *-" >> target_hashes.txt
echo -n "GuessMe" | md5sum | tr -d " *-" >> target_hashes.txt

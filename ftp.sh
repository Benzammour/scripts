echo "Enter your username followed by [ENTER]:"
read username

echo "Enter your host followed by [ENTER]:"
read host
echo

# macos
#sftp $username@$host

# linux
ftp $username@$host

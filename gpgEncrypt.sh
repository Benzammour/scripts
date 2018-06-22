recep='samir.benzammour@gmail.com'

command="gpg -r $recep --encrypt-files *{.png,.jpg}"

find . -type d -exec bash -c "cd '{}' && $command" \;

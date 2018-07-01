recep='samir.benzammour@gmail.com'

command="gpg -r $recep --decrypt-files *.gpg"

find . -type d -exec bash -c "cd '{}' && $command" \;

sleep .1

find . -name '*.gpg' -delete

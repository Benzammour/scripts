recep='contact@benzammour.com'

command="gpg -r $recep --decrypt-files *.gpg"

find . -type d -exec bash -c "cd '{}' && $command" \;

sleep .1

find . -name '*.gpg' -delete

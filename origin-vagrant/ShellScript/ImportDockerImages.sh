#! /bin/bash
image_loaded=false
while IFS= read -r ln
do
  a=($ln)
  image=${a[0]}
  tag=${a[1]}
  if [ -d /vagrant/OpenshiftK8s ];then
     if [ "$image_loaded" = false ];then
        echo "Loading all images from local storage"
        while IFS= read -r ln1
        do
          # shellcheck disable=SC2206
          a1=($ln1)
          image1=${a1[0]}
          tag1=${a1[1]}
          ids=${a1[2]}
          # shellcheck disable=SC2059
          printf "Loading Image : $image1-$tag1-$ids \n"
          docker load -i /vagrant/OpenshiftK8s/"$ids".tar
        done < /vagrant/OpenshiftK8s/images.txt
        image_loaded=true
     fi
  fi
  printf "Validating Image : $image-$tag \n"
  docker pull $image:$tag
done < /vagrant/OpenshiftK8s/images.txt

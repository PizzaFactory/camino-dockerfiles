#!/bin/bash
# From https://github.com/eclipse/che-dockerfiles.
# Licensed under EPL-1.0.

PRIVATE_REPO=${PRIVATE_REPO:-}

images=$(for i in $(find recipes -maxdepth 3 -mindepth 1 -type f -not -path '*/\.*' -name Dockerfile -print ); do a=${i#recipes/}; b=${a%/Dockerfile}; case $b in */*) c=${b/\//:};; *) c=$b:latest;; esac; from=$(grep FROM $i); echo ${from#FROM} cantinona/$c; done | tsort)

external_images=$(echo "$images" | grep -v cantinona/)
cantinona_images=$(echo "$images" | grep cantinona/)

function error() {
  echo $1 > /dev/stderr
  exit 1
}

for image in $external_images; do
    docker pull $image || error "Unable to pull image: $image"
    if [ "x$PRIVATE_REPO" != "x" ]; then
        docker tag $image $PRIVATE_REPO/$image
        docker push $PRIVATE_REPO/$image || error "Unable to push image: $image"
    fi
done

for image in $cantinona_images; do
    a=${image%:latest}
    b=${a#cantinona/}
    d=recipes/${b/:/\/}
    echo $b $d
    docker build -t $image $d || error "Unable to build image: $image"
    if [ "x$PRIVATE_REPO" != "x" ]; then
        docker tag $image $PRIVATE_REPO/$image
        docker push $PRIVATE_REPO/$image || error "Unable to push image: $image"
    else
        docker push $image
    fi
done

#!/bin/bash

options='t:'

while getopts ${options} option ; do
  case ${option} in
    t )
      tag=${OPTARG}
      ;;
    \? )
      exit 1
      ;;
  esac
done

if [ -z ${tag} ] ; then
  echo "Must specify a tag with -t TAG_NAME."
  exit 1
fi

make clean
make
docker tag raphaelmeyer/base raphaelmeyer/base:${tag}
docker push raphaelmeyer/base:${tag}


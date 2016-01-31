#!/bin/bash

options='v:'

while getopts ${options} option ; do
  case ${option} in
    v ) version=${OPTARG}
      ;;
    \?)
      echo "Invalid option: -${OPTARG}" >&2
      exit 1
      ;;
    : )
      echo "Option -${OPTARG} requires an argument." >&2
      exit 1
      ;;
  esac
done

shift $(($OPTIND - 1))

if [ -z ${version} ] ; then
  echo "Must specify version with -v VERSION."
  exit 1
fi

make clean
make
docker tag raphaelmeyer/base raphaelmeyer/base:${version}
# docker push raphaelmeyer/base:${version}


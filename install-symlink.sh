#!/bin/bash
function usage() {
  echo usage: install-symlink.sh \[-f\] DEST
  echo     installs all scripts to DEST/\[...\]
}

overwrite=0

if [ $# -eq 2 ]; then
  if [ "$1" = "-f" ]; then
    overwrite=1
  else
    echo error: invalid usage
    exit 1
  fi
  shift
elif [ $# -ne 1 ]; then
  echo error: invalid usage
  usage
  exit 1
elif [ $1 = "-f" ]; then
  echo error: missing DEST
  usage
  exit 1
fi

src=`pwd`
dest=$1

if [ $overwrite -eq 1 ]; then
  echo Installing in $dest \(overwriting\):
  cd $dest


  ln -v -s -f $src/simpleq
  ln -v -s -f $src/batcheq
  ln -v -s -f $src/cleaneq
elif [ -f $dest/simpleq -o -f $dest/batcheq -o -f $dest/cleaneq ]; then
  echo filename colission, make sure to delete $dest/simpleq, $dest/batcheq and $dest/cleaneq, if they exist 
  exit 1
else
  echo Installing in $dest:
  cd $dest

  ln -v -s $src/simpleq
  ln -v -s $src/batcheq
  ln -v -s $src/cleaneq
fi



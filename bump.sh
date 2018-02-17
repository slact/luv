#!/bin/sh
rock="luv-updated"
version=$1
if [ -z "$version" ]; then
  echo "must specify a version" >&2
  exit 1
fi

script="/^version/s@\"[^\"]\\+\"@\"${version}\"@"
sed -e "${script}" -i ${rock}*.rockspec
sed -e "${script}" -i rockspecs/${rock}*.rockspec
git mv ${rock}-*.rockspec ${rock}-${version}.rockspec
git mv rockspecs/${rock}-*.rockspec rockspecs/${rock}-${version}.rockspec
git add ${rock}-${version}.rockspec rockspecs/${rock}-${version}.rockspec

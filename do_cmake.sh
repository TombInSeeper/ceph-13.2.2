#!/bin/sh -x
git submodule update --init --recursive
build="clion-build"
if test -e $build; then
    echo 'build dir already exists; rm -rf build and re-run'
    exit 1
fi

if type ccache > /dev/null 2>&1 ; then
    echo "enabling ccache"
    ARGS="$ARGS -DWITH_CCACHE=ON"
fi

mkdir $build
cd $build

ARGS="$ARGS -DWITH_RADOSGW=OFF"
ARGS="$ARGS -DWITH_MGR_DASHBOARD_FRONTEND=OFF"
ARGS="$ARGS -DWITH_SPDK=OFF"

NPROC=${NPROC:-$(nproc)}
cmake -DBOOST_J=$NPROC $ARGS "$@" ..



# minimal config to find plugins
cat <<EOF > ceph.conf
plugin dir = lib
erasure code dir = lib
EOF

echo done.

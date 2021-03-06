#!/usr/bin/env bash
BASEDIR=$(dirname $0)
if [ -f $BASEDIR/../ceph-helpers-root.sh ]; then
    source $BASEDIR/../ceph-helpers-root.sh
else
    echo "$BASEDIR/../ceph-helpers-root.sh does not exist."
    exit 1
fi

PATH=$BASEDIR:$BASEDIR/..:$PATH

: ${PYTHON:=python}
$PYTHON --version

type pip

# newer versions of pytest (e.g. 3.7.0) seem to work fine with Python 2.7,
# so just grab the latest version
sudo -H pip install pytest
$PYTHON -m pytest --version

# complete the cluster setup done by the teuthology ceph task
sudo chown $(id -u) /etc/ceph/ceph.conf
if ! test -f /etc/ceph/ceph.client.admin.keyring ; then
    sudo cp /etc/ceph/ceph.keyring /etc/ceph/ceph.client.admin.keyring
fi
if ! sudo test -f /var/lib/ceph/bootstrap-osd/ceph.keyring ; then
    sudo ceph-create-keys --id a
fi
sudo ceph osd crush rm osd.0 || true
sudo ceph osd crush rm osd.1 || true

sudo cp $BASEDIR/60-ceph-by-partuuid.rules /lib/udev/rules.d
sudo udevadm control --reload

sudo perl -pi -e 's|pid file.*|pid file = /var/run/ceph/\$cluster-\$name.pid|' /etc/ceph/ceph.conf

sudo env PATH=$PATH PYTHONWARNINGS=ignore ${PYTHON} -m pytest -s -v --rootdir=$BASEDIR $BASEDIR/ceph-disk-test.py
result=$?

sudo rm -rf $BASEDIR/.pytest_cache
sudo rm -f /lib/udev/rules.d/60-ceph-by-partuuid.rules
# own whatever was created as a side effect of the py.test run
# so that it can successfully be removed later on by a non privileged
# process
sudo chown -R $(id -u) $BASEDIR
exit $result

#!/bin/bash

echo "Calling script /opt/cl-pg-utils/scripts/bootstrap/initdb.sh"
su postgres /opt/cl-pg-utils/scripts/bootstrap/initdb.sh
if [ $? -ne 0 ] ; then
 echo initdb.sh FAILURE
 exit 1
else
 echo initdb OK, starting init
fi
exec /usr/sbin/init

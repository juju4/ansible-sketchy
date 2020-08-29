#!/bin/sh
## one script to be used by travis, jenkins, packer...

umask 022

if [ $# != 0 ]; then
rolesdir=$1
else
rolesdir=$(dirname $0)/..
fi

[ ! -d $rolesdir/juju4.redhat_epel ] && git clone https://github.com/juju4/ansible-redhat-epel $rolesdir/juju4.redhat_epel
## galaxy naming: kitchen fails to transfer symlink folder
#[ ! -e $rolesdir/juju4.sketchy ] && ln -s ansible-sketchy $rolesdir/juju4.sketchy
[ ! -e $rolesdir/juju4.sketchy ] && cp -R $rolesdir/ansible-sketchy $rolesdir/juju4.sketchy

## don't stop build on this script return code
true


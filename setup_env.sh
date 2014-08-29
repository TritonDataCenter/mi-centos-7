#!/bin/bash

set -euo pipefail
IFS=$'\n\t'

yum install -y anaconda anaconda-runtime createrepo isomd5sum genisoimage rpmdevtools

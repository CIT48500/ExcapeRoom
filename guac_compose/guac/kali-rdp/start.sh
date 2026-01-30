#!/bin/bash
set -e

service xrdp restart

# start the session manager (your current CMD)
exec /usr/sbin/xrdp-sesman --nodaemon

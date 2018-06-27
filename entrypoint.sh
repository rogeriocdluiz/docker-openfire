#!/bin/bash

set -e

OPENFIRE_DIR=/opt/openfire

if [ -z "$(ls -A $OPENFIRE_DIR/logs)" ]; then
   #vazio
   cp -rfvp $OPENFIRE_DIR/conf.default/logs/* $OPENFIRE_DIR/logs/
   
fi

if [ -z "$(ls -A $OPENFIRE_DIR/conf)" ]; then
   #vazio
   cp -rfvp $OPENFIRE_DIR/conf.default/conf/* $OPENFIRE_DIR/conf/
   
fi

if [ -z "$(ls -A $OPENFIRE_DIR/plugins)" ]; then
   #vazio
   cp -rfvp $OPENFIRE_DIR/conf.default/plugins/* $OPENFIRE_DIR/plugins/
   
fi


if [ -z "$(ls -A $OPENFIRE_DIR/resources/security)" ]; then
   #vazio
   cp -rfvp $OPENFIRE_DIR/conf.default/security/* $OPENFIRE_DIR/resources/security
fi


chown openfire: $OPENFIRE_DIR/ -R

su - openfire -c "$OPENFIRE_DIR/bin/openfire start"


exec "$@";

 

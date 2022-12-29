#!/bin/bash

if [[ ! -z ${NAMESPACE} ]] ; then
    sed -i "s|K8S_NAMESPACE_VALUE|${NAMESPACE}|g" /usr/local/apache2/htdocs/index.html
fi

httpd-foreground
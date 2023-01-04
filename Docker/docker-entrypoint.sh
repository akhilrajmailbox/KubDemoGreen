#!/bin/bash

if [[ ! -z ${NAMESPACE} ]] ; then
    sed -i "s|K8S_NAMESPACE_VALUE|${NAMESPACE}|g" /usr/local/apache2/htdocs/index.html
    sed -i "s|RELEASE_VERSION_VALUE|${RELEASE_VERSION}|g" /usr/local/apache2/htdocs/index.html
    sed -i "s|REPO_BRANCH_NAME_VALUE|${REPO_BRANCH_NAME}|g" /usr/local/apache2/htdocs/index.html
fi

httpd-foreground
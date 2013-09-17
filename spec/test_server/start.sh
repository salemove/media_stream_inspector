#!/usr/bin/env bash
thin start --ssl --ssl-key-file $SM_CONF/development/certificates-localhost.ssl/localhost.ssl.key --ssl-cert-file $SM_CONF/development/certificates-localhost.ssl/localhost.ssl.crt -p 9876

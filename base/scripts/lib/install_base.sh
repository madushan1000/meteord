#!/bin/bash
set -e
apk update
apk upgrade
apk add --update curl bzip2 python git build-base

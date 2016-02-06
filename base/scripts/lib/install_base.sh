#!/bin/bash
set -e
apk update
apk upgrade
apk add --update curl bash bzip2 python git build-base

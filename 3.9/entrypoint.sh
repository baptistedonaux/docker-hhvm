#!/bin/bash
set -e

exec hhvm -m server -vServer.Type=fastcgi -vServer.Port=9000
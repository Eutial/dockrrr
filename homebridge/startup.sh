#!/bin/bash
set -euo pipefail

rm -rf node_modules
npm install
homebridge -U /homebridge
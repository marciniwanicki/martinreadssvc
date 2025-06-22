#!/bin/bash
set -e

go build -ldflags="-s -w" -o bin/martinreadssvc ./cmd/martinreadssvc

#!/bin/bash

# Load variables from .env
set -o allexport
source .env
set +o allexport

# Run Flutter with --dart-define from the loaded env variables
flutter run -d chrome \
  --dart-define=API_GH_KEY=$API_GH_KEY \
  --dart-define=USERNAME_GH=$USERNAME_GH

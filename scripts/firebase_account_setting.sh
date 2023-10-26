#!/bin/bash

# firebase cli 및 flutterfire-cli 설치필수
# firebase cli 설치 - https://firebase.google.com/docs/cli?hl=ko#mac-linux-auto-script
# 공식문서 - https://firebase.google.com/docs/flutter/setup?hl=ko&platform=ios

# 기존 계정 logout
firebase logout

# 필요 계정으로 login
firebase login

# flutterfire cli 설치
dart pub global activate flutterfire_cli

# flutterfire 명령어 환경설정(일단 수동)
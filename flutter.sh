#!/bin/bash

function print_usage() {
    echo "Usage: ./flutter_tasks.sh [command]"
    echo ""
    echo "Available commands:"
    echo "  build-release"
    echo "  build-runner:build"
    echo "  build-runner:watch"
    echo "  change-app-icons"
    echo "  change-app-name"
    echo "  change-app-package-name"
    echo "  change-app-splash-screen"
    echo "  deploy:web"
    echo "  open-xcode"
    echo "  open-xcode-macos"
    echo "  translate"
}

if [ "$#" -ne 1 ]; then
    print_usage
    exit 1
fi

command="$1"

case $command in
    "build-release")
        flutter run --release
        ;;
    "build-runner:build")
        dart run build_runner build --delete-conflicting-outputs
        ;;
    "build-runner:watch")
        dart run build_runner watch --delete-conflicting-outputs
        ;;
    "change-app-icons")
        dart run flutter_launcher_icons:main
        ;;
    "change-app-name")
        dart run flutter_launcher_name:main
        ;;
    "change-app-package-name")
        dart run change_app_package_name:main com.locatyataste
        ;;
    "change-app-splash-screen")
        dart run flutter_native_splash:create --path=pubspec.yaml
        ;;
    "deploy:web")
        flutter build web --profile  && vercel --prod
        ;;
    "open-xcode")
        open ios/Runner.xcworkspace
        ;;
    "open-xcode-macos")
        open macOS/Runner.xcworkspace
        ;;
    "translate")
        dart run easy_localization:generate -S assets/localization -O lib/generated -f keys -o locale_keys.g.dart && dart run easy_localization:generate -S assets/localization -O lib/generated
        ;;
    *)
        echo "Invalid command: $command"
        print_usage
        exit 1
        ;;
esac
